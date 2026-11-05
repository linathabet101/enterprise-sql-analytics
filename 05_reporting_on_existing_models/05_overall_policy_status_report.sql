-- Module 05: Reporting on Existing Models
-- Exercise 05: Overall Policy Status Report
--
-- Business purpose:
-- Monitor the operational distribution of insurance policies.
--
-- Source table:
--   public.policies
--
-- Reporting grain:
--   One row per policy status.
--
-- This query is read-only.

WITH status_metrics AS (
    SELECT
        status,
        COUNT(*) AS total_policies,
        SUM(annual_premium) AS total_annual_premium,
        AVG(annual_premium) AS average_annual_premium,
        SUM(insured_amount) AS total_insured_amount
    FROM public.policies
    GROUP BY status
)

SELECT
    status,
    total_policies,
    total_annual_premium,
    ROUND(average_annual_premium, 2) AS average_annual_premium,
    total_insured_amount,

    ROUND(
        100.0 * total_policies
        / NULLIF(SUM(total_policies) OVER (), 0),
        2
    ) AS policy_percentage

FROM status_metrics

ORDER BY
    total_policies DESC,
    status;