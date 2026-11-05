-- Lesson: LAG
-- Business question: How does each customer's current policy
-- premium compare with their previous policy premium?

WITH policy_comparison AS (
    SELECT
        customer_id,
        policy_number,
        start_date,
        annual_premium,
        LAG(annual_premium) OVER (
            PARTITION BY customer_id
            ORDER BY start_date, policy_id
        ) AS previous_policy_premium
    FROM public.policies
)
SELECT
    customer_id,
    policy_number,
    annual_premium,
    previous_policy_premium,
    annual_premium - previous_policy_premium AS premium_difference
FROM policy_comparison
ORDER BY customer_id, start_date;