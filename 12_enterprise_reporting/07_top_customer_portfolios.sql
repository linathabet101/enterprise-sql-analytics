SELECT
    customer_id,
    customer_name,
    total_policies,
    total_annual_premium,
    average_annual_premium,
    total_insured_amount
FROM warehouse.vw_customer_portfolio_report
ORDER BY
    total_annual_premium DESC,
    total_policies DESC
LIMIT 10;