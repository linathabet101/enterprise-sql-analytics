-- Module 07: Dimensional Modeling
-- Exercise 04: Identify Fact Measures
--
-- Business purpose:
-- Evaluate numeric measures available for the policy fact table.
--
-- Proposed fact grain:
--   One row per policy.
--
-- This query is read-only.

SELECT
    COUNT(*) AS policy_count,

    SUM(annual_premium) AS total_annual_premium,

    AVG(annual_premium) AS average_annual_premium,

    MIN(annual_premium) AS minimum_annual_premium,

    MAX(annual_premium) AS maximum_annual_premium,

    SUM(insured_amount) AS total_insured_amount,

    AVG(insured_amount) AS average_insured_amount,

    MIN(insured_amount) AS minimum_insured_amount,

    MAX(insured_amount) AS maximum_insured_amount

FROM public.policies;