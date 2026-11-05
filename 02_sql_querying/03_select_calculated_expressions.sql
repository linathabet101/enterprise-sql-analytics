-- Lesson: Calculated Expressions
-- Business question: What is the monthly equivalent of each annual premium?

SELECT
    policy_number,
    annual_premium,
    ROUND(annual_premium / 12, 2) AS monthly_premium,
    insured_amount,
    ROUND(
        annual_premium / insured_amount * 100,
        4
    ) AS premium_to_insured_amount_percentage
FROM public.policies
ORDER BY policy_number;