-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: Aggregation Across Related Tables
-- File: 21_customer_policy_summary.sql
--
-- Purpose:
-- Generate one summary row per customer, showing the number
-- of insurance policies and the total annual premium.
-- ============================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,

    COUNT(p.policy_id) AS total_policies,

    COALESCE(
        SUM(p.annual_premium),
        0
    ) AS total_annual_premium

FROM public.customers AS c

LEFT JOIN public.policies AS p
    ON c.customer_id = p.customer_id

GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name

ORDER BY
    c.customer_id;