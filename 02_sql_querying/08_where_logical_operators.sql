-- Lesson: Logical Operators
-- Business question: Find active policies with premiums
-- above 500, or policies with insured amounts above 100000.

SELECT
    policy_number,
    policy_type,
    status,
    annual_premium,
    insured_amount
FROM public.policies
WHERE
    (status = 'ACTIVE' AND annual_premium > 500)
    OR insured_amount > 100000
ORDER BY policy_number;