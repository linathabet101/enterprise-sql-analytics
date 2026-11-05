-- Module 08: Facts and Dimensions
-- Exercise 08: Populate the Date Dimension
--
-- Business purpose:
-- Generate a continuous calendar between the earliest
-- and latest policy dates.

WITH all_policy_dates AS (
    SELECT start_date AS policy_date
    FROM public.policies
    WHERE start_date IS NOT NULL

    UNION ALL

    SELECT end_date AS policy_date
    FROM public.policies
    WHERE end_date IS NOT NULL
),

date_bounds AS (
    SELECT
        MIN(policy_date) AS minimum_date,
        MAX(policy_date) AS maximum_date
    FROM all_policy_dates
),

calendar AS (
    SELECT
        generated_dates.calendar_date::DATE AS full_date
    FROM date_bounds
    CROSS JOIN LATERAL GENERATE_SERIES(
        minimum_date::TIMESTAMP,
        maximum_date::TIMESTAMP,
        INTERVAL '1 day'
    ) AS generated_dates(calendar_date)
    WHERE minimum_date IS NOT NULL
      AND maximum_date IS NOT NULL
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
    TO_CHAR(full_date, 'FMMonth'),
    EXTRACT(QUARTER FROM full_date)::INTEGER,
    EXTRACT(YEAR FROM full_date)::INTEGER,
    EXTRACT(ISODOW FROM full_date) IN (6, 7)
FROM calendar
ON CONFLICT (date_key) DO NOTHING;