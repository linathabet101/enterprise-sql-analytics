-- Lesson: LIMIT and OFFSET
-- Business question: Show the three highest-premium policies,
-- skipping the highest-premium policy.

SELECT
    policy_number,
    customer_id,
    annual_premium
FROM public.policies
ORDER BY annual_premium DESC, policy_id
LIMIT 3
OFFSET 1;