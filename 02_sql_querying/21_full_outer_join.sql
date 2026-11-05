-- Lesson: FULL OUTER JOIN
-- Business question: Compare customers and policies,
-- retaining unmatched records from both sides.

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    p.policy_id,
    p.policy_number,
    p.annual_premium
FROM public.customers AS c
FULL OUTER JOIN public.policies AS p
    ON c.customer_id = p.customer_id
ORDER BY
    COALESCE(c.customer_id, p.customer_id),
    p.policy_id;