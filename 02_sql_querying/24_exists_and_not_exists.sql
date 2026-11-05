-- Lesson: EXISTS and NOT EXISTS
-- Business question: Which customers own at least one policy?

SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM public.customers AS c
WHERE EXISTS (
    SELECT 1
    FROM public.policies AS p
    WHERE p.customer_id = c.customer_id
)
ORDER BY c.customer_id;


-- Business question: Which customers do not own any policies?

SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM public.customers AS c
WHERE NOT EXISTS (
    SELECT 1
    FROM public.policies AS p
    WHERE p.customer_id = c.customer_id
)
ORDER BY c.customer_id;