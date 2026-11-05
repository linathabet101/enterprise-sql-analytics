-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: Scalar Subqueries
-- File: 23_subquery_policies_above_average.sql
--
-- Purpose:
-- Identify insurance policies with an annual premium
-- higher than the average annual premium of all policies.
-- ============================================================

SELECT
    policy_id,
    policy_number,
    customer_id,
    policy_type,
    annual_premium

FROM public.policies

WHERE annual_premium > (
    SELECT AVG(annual_premium)
    FROM public.policies
)

ORDER BY annual_premium DESC;