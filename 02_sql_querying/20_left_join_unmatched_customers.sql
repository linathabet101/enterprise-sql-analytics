-- Lesson: LEFT JOIN
-- Business question: Identify customers who do not own
-- any insurance policies.

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    p.policy_number
FROM public.customers AS c
LEFT JOIN public.policies AS p
    ON c.customer_id = p.customer_id
WHERE p.policy_id IS NULL
ORDER BY c.customer_id;