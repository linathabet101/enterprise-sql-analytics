-- Module 07: Dimensional Modeling
-- Exercise 01: Identify the Business Process
--
-- Business purpose:
-- Explore the policy issuance process before designing a warehouse.
--
-- Source table:
--   public.policies
--
-- This query is read-only.

SELECT
    COUNT(*) AS total_policy_records,

    COUNT(DISTINCT policy_id) AS distinct_policy_ids,

    COUNT(DISTINCT policy_number) AS distinct_policy_numbers,

    COUNT(DISTINCT customer_id) AS distinct_customers,

    COUNT(DISTINCT policy_type) AS distinct_policy_types,

    MIN(start_date) AS earliest_policy_start,

    MAX(start_date) AS latest_policy_start,

    SUM(annual_premium) AS total_annual_premium,

    SUM(insured_amount) AS total_insured_amount

FROM public.policies;