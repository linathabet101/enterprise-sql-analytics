-- Module 07: Dimensional Modeling
-- Exercise 05: Analyze Dimension Cardinality
--
-- Business purpose:
-- Measure the number of distinct values available for descriptive attributes.
--
-- This query is read-only.

SELECT
    'CUSTOMER' AS attribute_name,
    COUNT(DISTINCT customer_id) AS distinct_values
FROM public.customers

UNION ALL

SELECT
    'POLICY TYPE',
    COUNT(DISTINCT policy_type)
FROM public.policies

UNION ALL

SELECT
    'POLICY STATUS',
    COUNT(DISTINCT status)
FROM public.policies

UNION ALL

SELECT
    'PRODUCTION YEAR',
    COUNT(DISTINCT EXTRACT(YEAR FROM start_date))
FROM public.policies

ORDER BY
    attribute_name;