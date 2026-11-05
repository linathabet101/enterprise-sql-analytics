-- Lesson: ORDER BY
-- Business question: Which policies have the highest annual premiums?

SELECT
    policy_number,
    policy_type,
    annual_premium,
    insured_amount
FROM public.policies
ORDER BY
    annual_premium DESC,
    insured_amount DESC;