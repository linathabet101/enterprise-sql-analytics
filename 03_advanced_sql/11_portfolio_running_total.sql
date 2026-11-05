-- Lesson: Portfolio-Level Running Total
-- Business question: How does total portfolio premium
-- accumulate across all policies?

SELECT
    policy_number,
    start_date,
    annual_premium,
    SUM(annual_premium) OVER (
        ORDER BY start_date, policy_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_portfolio_premium
FROM public.policies
ORDER BY start_date, policy_id;