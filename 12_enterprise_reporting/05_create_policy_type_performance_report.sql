CREATE OR REPLACE VIEW warehouse.vw_policy_type_performance AS
SELECT
    policy_type,

    COUNT(*) AS total_policies,

    COUNT(DISTINCT customer_id) AS unique_customers,

    SUM(annual_premium) AS total_annual_premium,

    AVG(annual_premium) AS average_annual_premium,

    SUM(insured_amount) AS total_insured_amount

FROM warehouse.vw_policy_reporting_detail

GROUP BY
    policy_type;

COMMENT ON VIEW warehouse.vw_policy_type_performance IS
    'Policy type distribution and financial performance.';