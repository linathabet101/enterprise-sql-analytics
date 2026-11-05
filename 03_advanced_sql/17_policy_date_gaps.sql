-- Lesson: Date Comparisons with LAG
-- Business question: How many days separate consecutive
-- policy start dates for each customer?

WITH policy_dates AS (
    SELECT
        customer_id,
        policy_number,
        start_date,
        LAG(start_date) OVER (
            PARTITION BY customer_id
            ORDER BY start_date, policy_id
        ) AS previous_start_date
    FROM public.policies
)
SELECT
    customer_id,
    policy_number,
    start_date,
    previous_start_date,
    start_date - previous_start_date AS days_since_previous_policy
FROM policy_dates
ORDER BY customer_id, start_date;