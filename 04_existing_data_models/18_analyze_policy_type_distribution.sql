-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: Policy Type Distribution
-- Objective: Segment the insurance portfolio by policy type.
-- ============================================================

SELECT
    policy_type,
    COUNT(*) AS policy_count,
    COUNT(DISTINCT customer_id) AS customer_count,
    SUM(annual_premium) AS total_annual_premium,
    ROUND(AVG(annual_premium), 2) AS average_annual_premium,
    SUM(insured_amount) AS total_insured_amount
FROM public.policies
GROUP BY policy_type
ORDER BY
    total_annual_premium DESC,
    policy_type;