-- Module 07: Dimensional Modeling
-- Exercise 03: Identify Dimension Candidates
--
-- Business purpose:
-- Identify descriptive attributes that can support analytical dimensions.
--
-- This query is read-only.

SELECT
    'CUSTOMER' AS dimension_candidate,
    COUNT(*) AS source_records,
    COUNT(DISTINCT customer_id) AS distinct_business_keys
FROM public.customers

UNION ALL

SELECT
    'POLICY TYPE',
    COUNT(*),
    COUNT(DISTINCT policy_type)
FROM public.policies

UNION ALL

SELECT
    'POLICY STATUS',
    COUNT(*),
    COUNT(DISTINCT status)
FROM public.policies

ORDER BY
    dimension_candidate;