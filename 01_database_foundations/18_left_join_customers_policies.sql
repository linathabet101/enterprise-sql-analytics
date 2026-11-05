-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: LEFT JOIN
-- File: 18_left_join_customers_policies.sql
--
-- Purpose:
-- Retrieve all customers and their associated policies.
-- Customers without policies must also appear in the result.
-- ============================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    p.policy_id,
    p.policy_number,
    p.policy_type,
    p.status,
    p.annual_premium
FROM public.customers AS c
LEFT JOIN public.policies AS p
    ON c.customer_id = p.customer_id
ORDER BY
    c.customer_id,
    p.policy_id;