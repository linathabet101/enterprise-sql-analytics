-- Lesson: COALESCE
-- Business question: Display a default value when a customer's
-- date of birth is missing.

SELECT
    customer_id,
    first_name,
    last_name,
    COALESCE(
        date_of_birth::TEXT,
        'Not provided'
    ) AS date_of_birth_display
FROM public.customers
ORDER BY customer_id;