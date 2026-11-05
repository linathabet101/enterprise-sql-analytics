-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: Correlated Subqueries
-- File: 24_correlated_subquery_customer_average.sql
--
-- Purpose:
-- Find policies whose annual premium is higher than the
-- average annual premium of policies owned by the same customer.
-- ============================================================

SELECT
    p.policy_id,
    p.policy_number,
    p.customer_id,
    p.policy_type,
    p.annual_premium
FROM public.policies AS p
WHERE p.annual_premium > (
    SELECT AVG(p2.annual_premium)
    FROM public.policies AS p2
    WHERE p2.customer_id = p.customer_id
)
ORDER BY
    p.customer_id,
    p.annual_premium DESC;