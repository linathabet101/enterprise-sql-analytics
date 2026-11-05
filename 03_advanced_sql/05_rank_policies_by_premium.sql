-- ============================================================
-- Module: 03 - Advanced SQL
-- Lesson: RANK() Window Function
-- Business question:
-- How do policies rank by annual premium?
-- ============================================================

SELECT
    policy_id,
    policy_number,
    customer_id,
    policy_type,
    annual_premium,
    RANK() OVER (
        ORDER BY annual_premium DESC
    ) AS premium_rank
FROM public.policies
ORDER BY premium_rank, policy_id;