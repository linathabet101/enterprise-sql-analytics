-- Lesson: CASE Expressions
-- Business question: Classify policies by annual premium.

SELECT
    policy_number,
    annual_premium,
    CASE
        WHEN annual_premium >= 800 THEN 'High Premium'
        WHEN annual_premium >= 500 THEN 'Medium Premium'
        ELSE 'Low Premium'
    END AS premium_category
FROM public.policies
ORDER BY annual_premium DESC;