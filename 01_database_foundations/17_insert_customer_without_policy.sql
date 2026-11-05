-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Purpose: Insert a customer without an insurance policy
-- ============================================================

INSERT INTO public.customers (
    first_name,
    last_name,
    email,
    date_of_birth
)
VALUES (
    'Elena',
    'Petrova',
    'elena.petrova@example.com',
    '1993-08-17'
);