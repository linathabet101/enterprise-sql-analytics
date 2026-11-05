-- Lesson: Window Aggregates
-- Business question: How does each policy compare with
-- the average and total premium of its policy type?

SELECT
    policy_number,
    policy_type,
    annual_premium,
    COUNT(*) OVER (
        PARTITION BY policy_type
    ) AS policies_in_type,
    ROUND(
        AVG(annual_premium) OVER (
            PARTITION BY policy_type
        ),
        2
    ) AS average_type_premium,
    SUM(annual_premium) OVER (
        PARTITION BY policy_type
    ) AS total_type_premium
FROM public.policies
ORDER BY policy_type, annual_premium DESC;