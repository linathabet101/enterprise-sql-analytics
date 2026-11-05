-- Lesson: Combining Multiple CTEs
-- Business question: Which customers have premiums above
-- the average customer-level premium?

WITH customer_premiums AS (
    SELECT
        customer_id,
        SUM(annual_premium) AS total_annual_premium
    FROM public.policies
    GROUP BY customer_id
),
portfolio_average AS (
    SELECT AVG(total_annual_premium) AS average_premium
    FROM customer_premiums
)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    cp.total_annual_premium,
    ROUND(pa.average_premium, 2) AS portfolio_average
FROM customer_premiums AS cp
INNER JOIN public.customers AS c
    ON cp.customer_id = c.customer_id
CROSS JOIN portfolio_average AS pa
WHERE cp.total_annual_premium > pa.average_premium
ORDER BY cp.total_annual_premium DESC;