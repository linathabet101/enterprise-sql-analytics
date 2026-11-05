SELECT
    COUNT(*) AS total_policies,

    COUNT(DISTINCT customer_id) AS total_customers,

    SUM(annual_premium) AS total_annual_premium,

    AVG(annual_premium) AS average_annual_premium,

    SUM(insured_amount) AS total_insured_amount,

    MIN(policy_start_date) AS earliest_policy_date,

    MAX(policy_start_date) AS latest_policy_date

FROM warehouse.vw_policy_reporting_detail;