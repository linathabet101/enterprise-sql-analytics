CREATE OR REPLACE PROCEDURE warehouse.run_production_etl()
LANGUAGE plpgsql
AS $$
DECLARE
    v_run_id BIGINT;
    v_rows_loaded BIGINT := 0;
    v_rows BIGINT := 0;
    v_error TEXT;
BEGIN
    INSERT INTO warehouse.etl_run_log (
        process_name,
        status
    )
    VALUES (
        'Production Warehouse ETL',
        'RUNNING'
    )
    RETURNING run_id INTO v_run_id;

    BEGIN

        -- 1. Update customer versions changed today.
        UPDATE warehouse.dim_customer AS dimension
        SET
            first_name = source.first_name,
            last_name = source.last_name,
            email = source.email,
            created_at = source.created_at
        FROM staging.vw_customers AS source
        WHERE dimension.customer_id = source.customer_id
          AND dimension.is_current = TRUE
          AND dimension.effective_from = CURRENT_DATE
          AND ROW(
              dimension.first_name,
              dimension.last_name,
              dimension.email,
              dimension.created_at
          ) IS DISTINCT FROM ROW(
              source.first_name,
              source.last_name,
              source.email,
              source.created_at
          );

        -- 2. Expire older customer versions when attributes change.
        UPDATE warehouse.dim_customer AS dimension
        SET
            effective_to = CURRENT_DATE - 1,
            is_current = FALSE
        FROM staging.vw_customers AS source
        WHERE dimension.customer_id = source.customer_id
          AND dimension.is_current = TRUE
          AND dimension.effective_from < CURRENT_DATE
          AND ROW(
              dimension.first_name,
              dimension.last_name,
              dimension.email,
              dimension.created_at
          ) IS DISTINCT FROM ROW(
              source.first_name,
              source.last_name,
              source.email,
              source.created_at
          );

        -- 3. Insert new customer versions.
        INSERT INTO warehouse.dim_customer (
            customer_id,
            first_name,
            last_name,
            email,
            created_at,
            effective_from,
            effective_to,
            is_current
        )
        SELECT
            source.customer_id,
            source.first_name,
            source.last_name,
            source.email,
            source.created_at,
            CURRENT_DATE,
            DATE '9999-12-31',
            TRUE
        FROM staging.vw_customers AS source
        WHERE NOT EXISTS (
            SELECT 1
            FROM warehouse.dim_customer AS current_dimension
            WHERE current_dimension.customer_id = source.customer_id
              AND current_dimension.is_current = TRUE
        );

        GET DIAGNOSTICS v_rows = ROW_COUNT;
        v_rows_loaded := v_rows_loaded + v_rows;

        -- 4. Load policy type dimension.
        INSERT INTO warehouse.dim_policy_type (policy_type)
        SELECT DISTINCT policy_type
        FROM staging.vw_policies
        WHERE policy_type IS NOT NULL
        ON CONFLICT (policy_type) DO NOTHING;

        -- 5. Load policy status dimension.
        INSERT INTO warehouse.dim_policy_status (status)
        SELECT DISTINCT status
        FROM staging.vw_policies
        WHERE status IS NOT NULL
        ON CONFLICT (status) DO NOTHING;

        -- 6. Extend the date dimension.
        WITH policy_dates AS (
            SELECT start_date AS calendar_date
            FROM staging.vw_policies
            WHERE start_date IS NOT NULL

            UNION

            SELECT end_date
            FROM staging.vw_policies
            WHERE end_date IS NOT NULL
        ),
        date_bounds AS (
            SELECT
                MIN(calendar_date) AS min_date,
                MAX(calendar_date) AS max_date
            FROM policy_dates
        ),
        calendar AS (
            SELECT generated_date::DATE AS full_date
            FROM date_bounds
            CROSS JOIN LATERAL GENERATE_SERIES(
                min_date,
                max_date,
                INTERVAL '1 day'
            ) AS generated_dates(generated_date)
            WHERE min_date IS NOT NULL
        )
        INSERT INTO warehouse.dim_date (
            date_key,
            full_date,
            day_number,
            month_number,
            month_name,
            quarter_number,
            year_number,
            is_weekend
        )
        SELECT
            TO_CHAR(full_date, 'YYYYMMDD')::INTEGER,
            full_date,
            EXTRACT(DAY FROM full_date)::INTEGER,
            EXTRACT(MONTH FROM full_date)::INTEGER,
            TO_CHAR(full_date, 'Month'),
            EXTRACT(QUARTER FROM full_date)::INTEGER,
            EXTRACT(YEAR FROM full_date)::INTEGER,
            EXTRACT(ISODOW FROM full_date) IN (6, 7)
        FROM calendar
        ON CONFLICT (date_key) DO NOTHING;

        -- 7. Load and refresh policy facts.
        INSERT INTO warehouse.fact_policy (
            policy_id,
            policy_number,
            customer_key,
            policy_type_key,
            policy_status_key,
            start_date_key,
            end_date_key,
            annual_premium,
            insured_amount,
            loaded_at
        )
        SELECT
            source.policy_id,
            source.policy_number,
            customer.customer_key,
            policy_type.policy_type_key,
            policy_status.policy_status_key,
            start_date.date_key,
            end_date.date_key,
            source.annual_premium,
            source.insured_amount,
            CURRENT_TIMESTAMP
        FROM staging.vw_policies AS source
        INNER JOIN warehouse.dim_customer AS customer
            ON customer.customer_id = source.customer_id
           AND source.start_date
               BETWEEN customer.effective_from AND customer.effective_to
        INNER JOIN warehouse.dim_policy_type AS policy_type
            ON policy_type.policy_type = source.policy_type
        INNER JOIN warehouse.dim_policy_status AS policy_status
            ON policy_status.status = source.status
        INNER JOIN warehouse.dim_date AS start_date
            ON start_date.full_date = source.start_date
        LEFT JOIN warehouse.dim_date AS end_date
            ON end_date.full_date = source.end_date
        ON CONFLICT (policy_id)
        DO UPDATE SET
            policy_number = EXCLUDED.policy_number,
            customer_key = EXCLUDED.customer_key,
            policy_type_key = EXCLUDED.policy_type_key,
            policy_status_key = EXCLUDED.policy_status_key,
            start_date_key = EXCLUDED.start_date_key,
            end_date_key = EXCLUDED.end_date_key,
            annual_premium = EXCLUDED.annual_premium,
            insured_amount = EXCLUDED.insured_amount,
            loaded_at = CURRENT_TIMESTAMP;

        GET DIAGNOSTICS v_rows = ROW_COUNT;
        v_rows_loaded := v_rows_loaded + v_rows;

        UPDATE warehouse.etl_run_log
        SET
            completed_at = CURRENT_TIMESTAMP,
            status = 'SUCCESS',
            rows_loaded = v_rows_loaded
        WHERE run_id = v_run_id;

    EXCEPTION WHEN OTHERS THEN
        GET STACKED DIAGNOSTICS v_error = MESSAGE_TEXT;

        UPDATE warehouse.etl_run_log
        SET
            completed_at = CURRENT_TIMESTAMP,
            status = 'FAILED',
            error_message = v_error,
            rows_loaded = v_rows_loaded
        WHERE run_id = v_run_id;

        RAISE;
    END;
END;
$$;

COMMENT ON PROCEDURE warehouse.run_production_etl() IS
    'Runs the production warehouse ETL process with execution logging.';