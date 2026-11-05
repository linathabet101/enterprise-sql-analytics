-- Lesson: IN and NOT IN
-- Business question: Retrieve policies belonging to selected
-- insurance categories.

SELECT
    policy_number,
    policy_type,
    annual_premium
FROM public.policies
WHERE policy_type IN ('AUTO', 'HOME')
ORDER BY policy_type, policy_number;

-- Exclude the selected categories.

SELECT
    policy_number,
    policy_type,
    annual_premium
FROM public.policies
WHERE policy_type NOT IN ('AUTO', 'HOME')
ORDER BY policy_type, policy_number;