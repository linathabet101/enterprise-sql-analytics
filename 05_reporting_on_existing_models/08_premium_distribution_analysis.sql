-- Module 05: Reporting on Existing Models
-- Exercise 08: Premium Distribution Analysis
--
-- Business purpose:
-- Analyze the distribution of policies across premium bands.
--
-- Source table:
--   public.policies
--
-- Reporting grain:
--   One row per premium band.
--
-- This query is read-only.

WITH classified_policies AS (
    SELECT
        policy_id,
        annual_premium,

        CASE
            WHEN annual_premium < 500
                THEN 'Low Premium'
            WHEN annual_premium < 1000
                THEN 'Medium Premium'
            ELSE 'High Premium'
        END AS premium_band

    FROM public.policies
)

SELECT
    premium_band,

    COUNT(*) AS total_policies,

    SUM(annual_premium) AS total_annual_premium,

    ROUND(
        AVG(annual_premium),
        2
    ) AS average_annual_premium,

    MIN(annual_premium) AS minimum_annual_premium,

    MAX(annual_premium) AS maximum_annual_premium,

    ROUND(
        100.0 * COUNT(*)
        / NULLIF(SUM(COUNT(*)) OVER (), 0),
        2
    ) AS policy_percentage

FROM classified_policies

GROUP BY premium_band

ORDER BY
    CASE premium_band
        WHEN 'Low Premium' THEN 1
        WHEN 'Medium Premium' THEN 2
        WHEN 'High Premium' THEN 3
    END;