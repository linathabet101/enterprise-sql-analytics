-- Lesson: FIRST_VALUE and LAST_VALUE
-- Business question: What are each customer's earliest
-- and latest policy premiums?

SELECT
    customer_id,
    policy_number,
    start_date,
    annual_premium,
    FIRST_VALUE(annual_premium) OVER (
        PARTITION BY customer_id
        ORDER BY start_date, policy_id
    ) AS first_policy_premium,
    LAST_VALUE(annual_premium) OVER (
        PARTITION BY customer_id
        ORDER BY start_date, policy_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS last_policy_premium
FROM public.policies
ORDER BY customer_id, start_date;