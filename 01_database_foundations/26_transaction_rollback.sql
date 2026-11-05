-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: Transactions - ROLLBACK
-- File: 26_transaction_rollback.sql
--
-- Purpose:
-- Demonstrate how ROLLBACK reverses a database modification.
-- ============================================================

BEGIN;

-- Inspect the original premium.
SELECT
    policy_id,
    policy_number,
    annual_premium
FROM public.policies
WHERE policy_id = (
    SELECT MIN(policy_id)
    FROM public.policies
);

-- Temporarily increase the premium.
UPDATE public.policies
SET annual_premium = annual_premium + 100
WHERE policy_id = (
    SELECT MIN(policy_id)
    FROM public.policies
);

-- Inspect the temporary change.
SELECT
    policy_id,
    policy_number,
    annual_premium
FROM public.policies
WHERE policy_id = (
    SELECT MIN(policy_id)
    FROM public.policies
);

-- Cancel the modification.
ROLLBACK;

-- Verify that the original premium has been restored.
SELECT
    policy_id,
    policy_number,
    annual_premium
FROM public.policies
WHERE policy_id = (
    SELECT MIN(policy_id)
    FROM public.policies
);