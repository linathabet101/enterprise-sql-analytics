-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Purpose: Retrieve and inspect customer records
-- ============================================================

SELECT
    customer_id,
    first_name,
    last_name,
    email,
    date_of_birth,
    created_at
FROM public.customers
ORDER BY customer_id;