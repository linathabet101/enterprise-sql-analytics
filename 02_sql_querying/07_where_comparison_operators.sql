-- Lesson: Comparison Operators
-- Business question: Which policies have an annual premium
-- greater than or equal to 700?

SELECT
    policy_number,
    customer_id,
    annual_premium
FROM public.policies
WHERE annual_premium >= 700
ORDER BY annual_premium DESC;