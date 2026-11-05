CREATE OR REPLACE VIEW warehouse.vw_annual_production_report AS
SELECT
    EXTRACT(YEAR FROM policy_start_date)::INTEGER AS production_year,

    COUNT(*) AS total_policies,

    COUNT(DISTINCT customer_id) AS unique_customers,

    SUM(annual_premium) AS total_annual_premium,

    AVG(annual_premium) AS average_annual_premium,

    SUM(insured_amount) AS total_insured_amount

FROM warehouse.vw_policy_reporting_detail

GROUP BY
    EXTRACT(YEAR FROM policy_start_date);

COMMENT ON VIEW warehouse.vw_annual_production_report IS
    'Annual policy production, customer and premium KPIs.';