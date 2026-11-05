-- Module 05: Reporting on Existing Models
-- Exercise 04: Policy Type Performance
--
-- Business purpose:
-- Compare policy types by production volume and premium contribution.
--
-- Source table:
--   public.policies
--
-- Reporting grain:
--   One row per policy type.
--
-- This query is read-only.

WITH policy_type_metrics AS (
    SELECT
        policy_type,
        COUNT(*) AS total_policies,
        COUNT(DISTINCT customer_id) AS unique_customers,
        SUM(annual_premium) AS total_annual_premium,
        AVG(annual_premium) AS average_annual_premium,
        SUM(insured_amount) AS total_insured_amount
    FROM public.policies
    GROUP BY policy_type
)

SELECT
    policy_type,
    total_policies,
    unique_customers,
    total_annual_premium,
    ROUND(average_annual_premium, 2) AS average_annual_premium,
    total_insured_amount,

    ROUND(
        100.0 * total_annual_premium
        / NULLIF(SUM(total_annual_premium) OVER (), 0),
        2
    ) AS premium_contribution_percentage

FROM policy_type_metrics

ORDER BY
    total_annual_premium DESC;