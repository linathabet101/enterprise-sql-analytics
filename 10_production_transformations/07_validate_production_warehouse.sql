SELECT
    'Source customers' AS metric,
    COUNT(*) AS total_rows
FROM staging.vw_customers

UNION ALL

SELECT
    'Current customer versions',
    COUNT(*)
FROM warehouse.dim_customer
WHERE is_current = TRUE

UNION ALL

SELECT
    'Source policies',
    COUNT(*)
FROM staging.vw_policies

UNION ALL

SELECT
    'Warehouse policy facts',
    COUNT(*)
FROM warehouse.fact_policy;