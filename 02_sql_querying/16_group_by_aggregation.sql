-- Lesson: GROUP BY
-- Business question: How many policies and how much premium
-- does each policy type represent?

SELECT
    policy_type,
    COUNT(*) AS total_policies,
    SUM(annual_premium) AS total_annual_premium,
    ROUND(AVG(annual_premium), 2) AS average_annual_premium
FROM public.policies
GROUP BY policy_type
ORDER BY total_annual_premium DESC;