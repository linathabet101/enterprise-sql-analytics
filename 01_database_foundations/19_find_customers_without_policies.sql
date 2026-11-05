-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: Anti-Join Using LEFT JOIN and IS NULL
-- File: 19_find_customers_without_policies.sql
--
-- Purpose:
-- Identify customers who have no associated insurance policy.
-- ============================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email
FROM public.customers AS c
LEFT JOIN public.policies AS p
    ON c.customer_id = p.customer_id
WHERE p.policy_id IS NULL
ORDER BY
    c.customer_id;