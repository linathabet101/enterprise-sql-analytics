-- Lesson: Scalar Subqueries
-- Business question: Which policies have premiums above
-- the average premium of all policies?

SELECT
    policy_number,
    customer_id,
    annual_premium
FROM public.policies
WHERE annual_premium > (
    SELECT AVG(annual_premium)
    FROM public.policies
)
ORDER BY annual_premium DESC;