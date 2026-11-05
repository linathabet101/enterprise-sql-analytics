-- Module 07: Dimensional Modeling
-- Exercise 06: Analyze Dimension Relationships
--
-- Business purpose:
-- Examine relationships between customers and policy types.
--
-- Proposed analytical grain:
--   One row per customer and policy type.
--
-- This query is read-only.

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,

    p.policy_type,

    COUNT(p.policy_id) AS policy_count,

    SUM(p.annual_premium) AS total_annual_premium,

    SUM(p.insured_amount) AS total_insured_amount

FROM public.customers AS c

INNER JOIN public.policies AS p
    ON c.customer_id = p.customer_id

GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    p.policy_type

ORDER BY
    c.customer_id,
    p.policy_type;