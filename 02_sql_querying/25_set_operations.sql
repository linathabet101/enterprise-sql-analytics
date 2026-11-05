-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 02 - SQL Querying and Relational Operations
-- Lesson: Set Operations
-- File: 25_set_operations.sql
-- ============================================================


-- 1. UNION

SELECT customer_id
FROM (
    SELECT customer_id
    FROM public.customers

    UNION

    SELECT customer_id
    FROM public.policies
) AS union_result
ORDER BY customer_id;


-- 2. INTERSECT

SELECT customer_id
FROM (
    SELECT customer_id
    FROM public.customers

    INTERSECT

    SELECT customer_id
    FROM public.policies
) AS intersect_result
ORDER BY customer_id;


-- 3. EXCEPT

SELECT customer_id
FROM (
    SELECT customer_id
    FROM public.customers

    EXCEPT

    SELECT customer_id
    FROM public.policies
) AS except_result
ORDER BY customer_id;