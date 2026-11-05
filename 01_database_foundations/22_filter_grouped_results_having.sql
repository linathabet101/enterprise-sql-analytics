-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: Filtering Aggregated Results with HAVING
-- File: 22_filter_grouped_results_having.sql
--
-- Purpose:
-- Identify customers who own at least two insurance policies.
-- ============================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(p.policy_id) AS total_policies,
    COALESCE(SUM(p.annual_premium), 0) AS total_annual_premium

FROM public.customers AS c

LEFT JOIN public.policies AS p
    ON c.customer_id = p.customer_id

GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name

HAVING COUNT(p.policy_id) >= 2

ORDER BY
    total_annual_premium DESC;