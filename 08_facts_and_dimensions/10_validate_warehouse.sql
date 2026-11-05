-- Module 08: Facts and Dimensions
-- Exercise 10: Validate the Initial Warehouse
--
-- Business purpose:
-- Compare source and warehouse record counts
-- and inspect the dimensional model.

SELECT
    'Source customers' AS metric,
    COUNT(*) AS record_count
FROM public.customers

UNION ALL

SELECT
    'Warehouse customers',
    COUNT(*)
FROM warehouse.dim_customer

UNION ALL

SELECT
    'Source policies',
    COUNT(*)
FROM public.policies

UNION ALL

SELECT
    'Warehouse policy facts',
    COUNT(*)
FROM warehouse.fact_policy

UNION ALL

SELECT
    'Policy types',
    COUNT(*)
FROM warehouse.dim_policy_type

UNION ALL

SELECT
    'Policy statuses',
    COUNT(*)
FROM warehouse.dim_policy_status

UNION ALL

SELECT
    'Calendar dates',
    COUNT(*)
FROM warehouse.dim_date;