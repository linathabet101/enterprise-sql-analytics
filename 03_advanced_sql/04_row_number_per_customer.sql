-- Lesson: ROW_NUMBER
-- Business question: What is the sequential policy number
-- for each customer?

SELECT
    customer_id,
    policy_number,
    policy_type,
    annual_premium,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY start_date, policy_id
    ) AS policy_sequence
FROM public.policies
ORDER BY customer_id, policy_sequence;