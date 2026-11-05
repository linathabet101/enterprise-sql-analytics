-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: Data Integrity and Constraints
-- Purpose: Verify customer table constraints
-- ============================================================

-- TEST 1: Verify that customer IDs are unique.
SELECT
    customer_id,
    COUNT(*) AS occurrences
FROM public.customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- TEST 2: Verify that required names are never NULL.
SELECT *
FROM public.customers
WHERE first_name IS NULL
   OR last_name IS NULL;

-- TEST 3: Verify that email addresses are unique.
SELECT
    email,
    COUNT(*) AS occurrences
FROM public.customers
WHERE email IS NOT NULL
GROUP BY email
HAVING COUNT(*) > 1;

-- TEST 4: Count records and check the number of unique IDs.
SELECT
    COUNT(*) AS total_customers,
    COUNT(DISTINCT customer_id) AS unique_customer_ids,
    COUNT(email) AS customers_with_email
FROM public.customers;