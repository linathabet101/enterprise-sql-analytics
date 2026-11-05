-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: Constraint Enforcement
-- Purpose: Test PostgreSQL constraint enforcement
-- ============================================================

-- TEST 1: Attempt to insert a duplicate email address.
DO $$
DECLARE
    existing_email VARCHAR(255);
BEGIN
    SELECT email
    INTO existing_email
    FROM public.customers
    WHERE email IS NOT NULL
    LIMIT 1;

    INSERT INTO public.customers (
        first_name,
        last_name,
        email
    )
    VALUES (
        'Test',
        'Duplicate',
        existing_email
    );

    RAISE EXCEPTION 'TEST FAILED: Duplicate email was accepted.';

EXCEPTION
    WHEN unique_violation THEN
        RAISE NOTICE 'TEST PASSED: Duplicate email rejected. %', SQLERRM;
END;
$$;


-- TEST 2: Attempt to insert a customer without a first name.
DO $$
BEGIN
    INSERT INTO public.customers (
        first_name,
        last_name,
        email
    )
    VALUES (
        NULL,
        'MissingFirstName',
        'test.first@example.com'
    );

    RAISE EXCEPTION 'TEST FAILED: NULL first name was accepted.';

EXCEPTION
    WHEN not_null_violation THEN
        RAISE NOTICE 'TEST PASSED: NULL first name rejected. %', SQLERRM;
END;
$$;


-- TEST 3: Attempt to insert a customer without a last name.
DO $$
BEGIN
    INSERT INTO public.customers (
        first_name,
        last_name,
        email
    )
    VALUES (
        'Missing',
        NULL,
        'test.last@example.com'
    );

    RAISE EXCEPTION 'TEST FAILED: NULL last name was accepted.';

EXCEPTION
    WHEN not_null_violation THEN
        RAISE NOTICE 'TEST PASSED: NULL last name rejected. %', SQLERRM;
END;
$$;


-- FINAL CHECK: Verify that the original five records remain.
SELECT
    COUNT(*) AS total_customers,
    COUNT(DISTINCT customer_id) AS unique_customer_ids
FROM public.customers;