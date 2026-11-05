-- Module 05: Reporting on Existing Models
-- Exercise 07: Monthly Production by Policy Type
--
-- Business purpose:
-- Analyze monthly policy production by insurance product.
--
-- Source table:
--   public.policies
--
-- Reporting grain:
--   One row per production month and policy type.
--
-- This query is read-only.

SELECT
    DATE_TRUNC('month', start_date)::DATE AS production_month,
    policy_type,

    COUNT(*) AS policies_issued,

    COUNT(DISTINCT customer_id) AS unique_customers,

    SUM(annual_premium) AS total_annual_premium,

    ROUND(
        AVG(annual_premium),
        2
    ) AS average_annual_premium

FROM public.policies

GROUP BY
    DATE_TRUNC('month', start_date),
    policy_type

ORDER BY
    production_month,
    policy_type;