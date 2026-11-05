-- Lesson: DISTINCT
-- Business question: Which different policy types exist?

SELECT DISTINCT
    policy_type
FROM public.policies
ORDER BY policy_type;