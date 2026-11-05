-- Lesson: Basic Common Table Expressions (CTEs)
-- Business question: What is the total premium paid by each customer?

WITH customer_premiums AS (
    SELECT
        customer_id,
        COUNT(*) AS total_policies,
        SUM(annual_premium) AS total_annual_premium
    FROM public.policies
    GROUP BY customer_id
)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COALESCE(cp.total_policies, 0) AS total_policies,
    COALESCE(cp.total_annual_premium, 0) AS total_annual_premium
FROM public.customers AS c
LEFT JOIN customer_premiums AS cp
    ON c.customer_id = cp.customer_id
ORDER BY c.customer_id;