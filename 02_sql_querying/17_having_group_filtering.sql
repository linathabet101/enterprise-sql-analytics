-- Lesson: HAVING
-- Business question: Which customers own at least two policies?

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(p.policy_id) AS total_policies,
    SUM(p.annual_premium) AS total_annual_premium
FROM public.customers AS c
INNER JOIN public.policies AS p
    ON c.customer_id = p.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(p.policy_id) >= 2
ORDER BY total_annual_premium DESC;