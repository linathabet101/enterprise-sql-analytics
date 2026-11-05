-- Lesson: Column Aliases
-- Business question: How can we make query results easier to read?

SELECT
    customer_id AS customer_reference,
    first_name AS given_name,
    last_name AS family_name,
    email AS contact_email
FROM public.customers
ORDER BY customer_id;