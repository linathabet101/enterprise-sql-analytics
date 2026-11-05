CREATE OR REPLACE VIEW warehouse.vw_customer_portfolio_report AS
SELECT
    customer_key,
    customer_id,
    customer_name,

    COUNT(*) AS total_policies,

    SUM(annual_premium) AS total_annual_premium,

    AVG(annual_premium) AS average_annual_premium,

    SUM(insured_amount) AS total_insured_amount,

    MIN(policy_start_date) AS first_policy_start_date,

    MAX(policy_start_date) AS latest_policy_start_date

FROM warehouse.vw_policy_reporting_detail

GROUP BY
    customer_key,
    customer_id,
    customer_name;

COMMENT ON VIEW warehouse.vw_customer_portfolio_report IS
    'Customer-level policy portfolio and premium summary.';