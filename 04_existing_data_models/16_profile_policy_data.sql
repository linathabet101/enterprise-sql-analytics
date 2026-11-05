-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: Policy Data Profiling
-- Objective: Understand the insurance portfolio.
-- ============================================================

SELECT
    COUNT(*) AS total_policies,
    COUNT(DISTINCT policy_number) AS unique_policy_numbers,
    COUNT(DISTINCT customer_id) AS customers_with_policies,
    SUM(annual_premium) AS total_annual_premium,
    ROUND(AVG(annual_premium), 2) AS average_annual_premium,
    MIN(annual_premium) AS minimum_annual_premium,
    MAX(annual_premium) AS maximum_annual_premium,
    SUM(insured_amount) AS total_insured_amount,
    ROUND(AVG(insured_amount), 2) AS average_insured_amount,
    MIN(start_date) AS earliest_policy_start,
    MAX(start_date) AS latest_policy_start
FROM public.policies;