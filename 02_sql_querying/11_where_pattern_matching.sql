-- Lesson: Pattern Matching
-- Business question: Find customers whose first name
-- starts with the letter A.

SELECT
    customer_id,
    first_name,
    last_name,
    email
FROM public.customers
WHERE first_name ILIKE 'A%'
ORDER BY first_name;