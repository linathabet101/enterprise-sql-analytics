-- Lesson: INNER JOIN
-- Business question: Display each policy with its customer name.

SELECT
    p.policy_number,
    p.policy_type,
    p.annual_premium,
    c.customer_id,
    c.first_name,
    c.last_name
FROM public.policies AS p
INNER JOIN public.customers AS c
    ON p.customer_id = c.customer_id
ORDER BY c.customer_id, p.policy_number;