-- Module 06: Transformation Maintenance
-- Exercise 04: Create the Monthly Production View
--
-- Business purpose:
-- Provide reusable monthly production metrics.
--
-- Source table:
--   public.policies
--
-- Transformation grain:
--   One row per production month.

CREATE OR REPLACE VIEW analytics.vw_monthly_policy_production AS

SELECT
    DATE_TRUNC('month', start_date)::DATE AS production_month,

    COUNT(*) AS policies_issued,

    COUNT(DISTINCT customer_id) AS unique_customers,

    SUM(annual_premium) AS total_annual_premium,

    ROUND(
        AVG(annual_premium),
        2
    ) AS average_annual_premium,

    SUM(insured_amount) AS total_insured_amount

FROM public.policies

GROUP BY
    DATE_TRUNC('month', start_date);