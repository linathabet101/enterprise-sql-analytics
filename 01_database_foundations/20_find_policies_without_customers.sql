-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: Referential Integrity Validation
-- File: 20_find_policies_without_customers.sql
--
-- Purpose:
-- Identify policies that reference nonexistent customers.
-- This query helps validate relationships between tables.
-- ============================================================

SELECT
    p.policy_id,
    p.policy_number,
    p.customer_id
FROM public.policies AS p
LEFT JOIN public.customers AS c
    ON p.customer_id = c.customer_id
WHERE c.customer_id IS NULL
ORDER BY
    p.policy_id;