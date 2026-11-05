-- Lesson: Correlated Subqueries
-- Business question: Which policies have premiums above
-- the average premium for their own customer?

SELECT
    p.policy_number,
    p.customer_id,
    p.annual_premium
FROM public.policies AS p
WHERE p.annual_premium > (
    SELECT AVG(p2.annual_premium)
    FROM public.policies AS p2
    WHERE p2.customer_id = p.customer_id
)
ORDER BY p.customer_id, p.annual_premium DESC;