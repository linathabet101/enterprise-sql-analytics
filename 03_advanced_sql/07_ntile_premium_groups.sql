-- Lesson: NTILE
-- Business question: How can we divide policies into
-- four premium groups?

SELECT
    policy_number,
    annual_premium,
    NTILE(4) OVER (
        ORDER BY annual_premium DESC
    ) AS premium_quartile
FROM public.policies
ORDER BY premium_quartile, annual_premium DESC;