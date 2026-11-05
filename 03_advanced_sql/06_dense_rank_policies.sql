-- ============================================================
-- Module: 03 - Advanced SQL
-- Lesson: DENSE_RANK() Window Function
-- Business question:
-- How can we rank policies by premium without gaps
-- between ranking positions when premiums are tied?
-- ============================================================

SELECT
    policy_id,
    policy_number,
    customer_id,
    policy_type,
    annual_premium,
    DENSE_RANK() OVER (
        ORDER BY annual_premium DESC
    ) AS premium_dense_rank
FROM public.policies
ORDER BY premium_dense_rank, policy_id;