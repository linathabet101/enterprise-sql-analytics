-- Lesson: LEAD
-- Business question: What is the premium of each customer's
-- next policy?

SELECT
    customer_id,
    policy_number,
    start_date,
    annual_premium,
    LEAD(annual_premium) OVER (
        PARTITION BY customer_id
        ORDER BY start_date, policy_id
    ) AS next_policy_premium
FROM public.policies
ORDER BY customer_id, start_date;