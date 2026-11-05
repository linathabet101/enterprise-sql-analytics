-- Module 06: Transformation Maintenance
-- Exercise 02: Create the Policy Details View
--
-- Business purpose:
-- Provide a reusable policy-level dataset enriched with customer details.
--
-- Source tables:
--   public.customers
--   public.policies
--
-- Transformation grain:
--   One row per policy.

CREATE OR REPLACE VIEW analytics.vw_policy_details AS

SELECT
    p.policy_id,
    p.policy_number,
    p.customer_id,

    c.first_name,
    c.last_name,
    c.email,

    p.policy_type,
    p.status,

    p.annual_premium,
    p.insured_amount,

    p.start_date,
    p.end_date,

    p.created_at

FROM public.policies AS p

INNER JOIN public.customers AS c
    ON p.customer_id = c.customer_id;

