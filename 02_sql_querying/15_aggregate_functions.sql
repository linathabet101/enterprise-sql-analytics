-- Lesson: Aggregate Functions
-- Business question: What is the overall premium performance?

SELECT
    COUNT(*) AS total_policies,
    COUNT(DISTINCT customer_id) AS insured_customers,
    SUM(annual_premium) AS total_annual_premiums,
    ROUND(AVG(annual_premium), 2) AS average_annual_premium,
    MIN(annual_premium) AS minimum_annual_premium,
    MAX(annual_premium) AS maximum_annual_premium
FROM public.policies;