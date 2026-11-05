-- Module 05: Reporting on Existing Models
-- Exercise 03: Monthly Policy Production
--
-- Business purpose:
-- Monitor monthly policy production and financial volume.
--
-- Source table:
--   public.policies
--
-- Reporting grain:
--   One row per policy start month.
--
-- This query is read-only.

SELECT
    DATE_TRUNC('month', start_date)::DATE AS production_month,

    COUNT(*) AS policies_issued,

    COUNT(DISTINCT customer_id) AS unique_customers,

    SUM(annual_premium) AS total_annual_premium,

    ROUND(AVG(annual_premium), 2) AS average_annual_premium,

    SUM(insured_amount) AS total_insured_amount

FROM public.policies

GROUP BY
    DATE_TRUNC('month', start_date)

ORDER BY
    production_month;