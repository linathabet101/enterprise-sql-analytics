-- Lesson: Running Totals
-- Business question: How does each customer's cumulative
-- annual premium develop across their policies?

SELECT
    customer_id,
    policy_number,
    start_date,
    annual_premium,
    SUM(annual_premium) OVER (
        PARTITION BY customer_id
        ORDER BY start_date, policy_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_customer_premium
FROM public.policies
ORDER BY customer_id, start_date;