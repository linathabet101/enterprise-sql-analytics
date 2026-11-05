-- Module 07: Dimensional Modeling
-- Exercise 07: Analyze Date Dimension Requirements
--
-- Business purpose:
-- Determine the calendar coverage required by the date dimension.
--
-- Source table:
--   public.policies
--
-- This query is read-only.

SELECT
    MIN(start_date) AS earliest_start_date,

    MAX(start_date) AS latest_start_date,

    MIN(end_date) AS earliest_end_date,

    MAX(end_date) AS latest_end_date,

    COUNT(DISTINCT start_date) AS distinct_start_dates,

    COUNT(DISTINCT end_date) AS distinct_end_dates,

    COUNT(DISTINCT EXTRACT(YEAR FROM start_date))
        AS distinct_production_years

FROM public.policies;