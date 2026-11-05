SELECT
    'Policy reporting detail' AS report_name,
    COUNT(*) AS total_rows
FROM warehouse.vw_policy_reporting_detail

UNION ALL

SELECT
    'Customer portfolio',
    COUNT(*)
FROM warehouse.vw_customer_portfolio_report

UNION ALL

SELECT
    'Monthly production',
    COUNT(*)
FROM warehouse.vw_monthly_production_report

UNION ALL

SELECT
    'Annual production',
    COUNT(*)
FROM warehouse.vw_annual_production_report

UNION ALL

SELECT
    'Policy type performance',
    COUNT(*)
FROM warehouse.vw_policy_type_performance

UNION ALL

SELECT
    'Policy status report',
    COUNT(*)
FROM warehouse.vw_policy_status_report;