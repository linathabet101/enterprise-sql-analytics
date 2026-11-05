-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: Customer Data Profiling
-- Objective: Assess the completeness and distribution
--            of customer information.
-- ============================================================

SELECT
    COUNT(*) AS total_customers,
    COUNT(DISTINCT customer_id) AS unique_customer_ids,
    COUNT(DISTINCT email) AS unique_emails,
    COUNT(*) FILTER (
        WHERE email IS NULL
    ) AS missing_emails,
    COUNT(*) FILTER (
        WHERE date_of_birth IS NULL
    ) AS missing_birth_dates,
    MIN(date_of_birth) AS earliest_birth_date,
    MAX(date_of_birth) AS latest_birth_date,
    MIN(created_at) AS first_customer_created,
    MAX(created_at) AS last_customer_created
FROM public.customers;

