CREATE OR REPLACE VIEW warehouse.vw_monthly_production_report AS
SELECT
    EXTRACT(YEAR FROM policy_start_date)::INTEGER AS production_year,

    EXTRACT(MONTH FROM policy_start_date)::INTEGER AS production_month,

    TO_CHAR(policy_start_date, 'Month') AS month_name,

    COUNT(*) AS total_policies,

    SUM(annual_premium) AS total_annual_premium,

    AVG(annual_premium) AS average_annual_premium,

    SUM(insured_amount) AS total_insured_amount

FROM warehouse.vw_policy_reporting_detail

GROUP BY
    EXTRACT(YEAR FROM policy_start_date),
    EXTRACT(MONTH FROM policy_start_date),
    TO_CHAR(policy_start_date, 'Month');

COMMENT ON VIEW warehouse.vw_monthly_production_report IS
    'Monthly policy production and premium performance.';