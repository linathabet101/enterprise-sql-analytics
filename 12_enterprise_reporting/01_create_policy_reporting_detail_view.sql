CREATE OR REPLACE VIEW warehouse.vw_policy_reporting_detail AS
SELECT
    fact.policy_id,
    fact.policy_number,

    customer.customer_key,
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    CONCAT(customer.first_name, ' ', customer.last_name)
        AS customer_name,

    policy_type.policy_type,
    policy_status.status,

    start_date.full_date AS policy_start_date,
    end_date.full_date AS policy_end_date,

    fact.annual_premium,
    fact.insured_amount,
    fact.loaded_at

FROM warehouse.fact_policy AS fact

INNER JOIN warehouse.dim_customer AS customer
    ON customer.customer_key = fact.customer_key

INNER JOIN warehouse.dim_policy_type AS policy_type
    ON policy_type.policy_type_key = fact.policy_type_key

INNER JOIN warehouse.dim_policy_status AS policy_status
    ON policy_status.policy_status_key = fact.policy_status_key

INNER JOIN warehouse.dim_date AS start_date
    ON start_date.date_key = fact.start_date_key

LEFT JOIN warehouse.dim_date AS end_date
    ON end_date.date_key = fact.end_date_key;

COMMENT ON VIEW warehouse.vw_policy_reporting_detail IS
    'Detailed policy reporting view combining facts and descriptive dimensions.';