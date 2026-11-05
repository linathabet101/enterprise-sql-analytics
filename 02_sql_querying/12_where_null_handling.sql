-- Lesson: NULL Handling
-- Business question: Which customers have no recorded date of birth?

SELECT
    customer_id,
    first_name,
    last_name,
    date_of_birth
FROM public.customers
WHERE date_of_birth IS NULL
ORDER BY customer_id;

-- Business question: Which customers have a recorded date of birth?

SELECT
    customer_id,
    first_name,
    last_name,
    date_of_birth
FROM public.customers
WHERE date_of_birth IS NOT NULL
ORDER BY customer_id;