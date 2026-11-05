-- Module 07: Dimensional Modeling
-- Exercise 02: Define the Fact Table Grain
--
-- Business purpose:
-- Validate whether policy_id represents a unique policy-level grain.
--
-- Proposed fact grain:
--   One row per policy.
--
-- This query is read-only.

SELECT
    COUNT(*) AS source_rows,

    COUNT(DISTINCT policy_id) AS distinct_policy_ids,

    COUNT(*) - COUNT(DISTINCT policy_id)
        AS duplicate_policy_id_rows,

    COUNT(*) FILTER (
        WHERE policy_id IS NULL
    ) AS missing_policy_ids,

    CASE
        WHEN COUNT(*) = COUNT(DISTINCT policy_id)
             AND COUNT(*) FILTER (
                 WHERE policy_id IS NULL
             ) = 0
        THEN 'GRAIN VALIDATED'
        ELSE 'GRAIN REQUIRES INVESTIGATION'
    END AS grain_validation

FROM public.policies;