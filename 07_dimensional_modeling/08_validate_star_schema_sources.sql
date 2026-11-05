-- Module 07: Dimensional Modeling
-- Exercise 08: Validate Star Schema Sources
--
-- Business purpose:
-- Check that all source entities required by the proposed star schema exist.
--
-- Proposed warehouse objects:
--   warehouse.dim_customer
--   warehouse.dim_policy_type
--   warehouse.dim_date
--   warehouse.fact_policy
--
-- This query validates the operational source tables only.
-- It does not create warehouse objects.
--
-- This query is read-only.

WITH required_sources AS (
    SELECT
        'public.customers' AS source_table

    UNION ALL

    SELECT
        'public.policies'
)

SELECT
    rs.source_table,

    CASE
        WHEN to_regclass(rs.source_table) IS NOT NULL
            THEN 'AVAILABLE'
        ELSE 'MISSING'
    END AS source_status

FROM required_sources AS rs

ORDER BY
    rs.source_table;