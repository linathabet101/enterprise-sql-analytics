-- ============================================================
-- Module: 03 - Advanced SQL
-- Lesson: Top Policy Per Customer
-- Business question:
-- What is each customer's highest-premium policy?
-- ============================================================

WITH ranked_policies AS (
    SELECT
        policy_id,
        policy_number,
        customer_id,
        policy_type,
        annual_premium,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY annual_premium DESC, policy_id
        ) AS policy_position
    FROM public.policies
)
SELECT
    policy_id,
    policy_number,
    customer_id,
    policy_type,
    annual_premium
FROM ranked_policies
WHERE policy_position = 1
ORDER BY customer_id;