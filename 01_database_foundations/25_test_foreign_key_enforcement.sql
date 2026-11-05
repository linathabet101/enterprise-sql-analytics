-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: Foreign Key Enforcement
-- File: 25_test_foreign_key_enforcement.sql
--
-- Purpose:
-- Verify that policies cannot reference nonexistent customers.
-- ============================================================

DO $$
BEGIN
    INSERT INTO public.policies (
        policy_number,
        customer_id,
        policy_type,
        annual_premium,
        insured_amount,
        start_date,
        end_date
    )
    VALUES (
        'TEST-FK-999',
        -999999,
        'AUTO',
        500.00,
        20000.00,
        DATE '2026-01-01',
        DATE '2026-12-31'
    );

    RAISE EXCEPTION
        'TEST FAILED: Invalid customer reference was accepted.';

EXCEPTION
    WHEN foreign_key_violation THEN
        RAISE NOTICE
            'TEST PASSED: Invalid customer reference was rejected.';
END;
$$;

-- Verify that the test policy was not inserted.
SELECT COUNT(*) AS test_policy_count
FROM public.policies
WHERE policy_number = 'TEST-FK-999';