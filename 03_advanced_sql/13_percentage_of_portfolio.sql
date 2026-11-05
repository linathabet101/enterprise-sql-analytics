-- Lesson: Window Aggregation and Portfolio Contribution
-- Business question: What percentage of total portfolio
-- premium does each policy represent?

SELECT
    policy_number,
    annual_premium,
    SUM(annual_premium) OVER () AS portfolio_total_premium,
    ROUND(
        100.0 * annual_premium
        / SUM(annual_premium) OVER (),
        2
    ) AS portfolio_premium_percentage
FROM public.policies
ORDER BY annual_premium DESC;