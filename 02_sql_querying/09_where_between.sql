-- Lesson: BETWEEN
-- Business question: Which policies have annual premiums
-- between 400 and 800, inclusive?

SELECT
    policy_number,
    annual_premium
FROM public.policies
WHERE annual_premium BETWEEN 400 AND 800
ORDER BY annual_premium;