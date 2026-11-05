-- Module 06: Transformation Maintenance
-- Exercise 05: Update the Customer Portfolio View
--
-- Business purpose:
-- Extend an existing transformation without changing its grain.
--
-- Transformation grain:
--   One row per customer.

CREATE OR REPLACE VIEW analytics.vw_customer_portfolio AS

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,

    COUNT(p.policy_id) AS total_policies,

    COUNT(p.policy_id) FILTER (
        WHERE p.status = 'ACTIVE'
    ) AS active_policies,

    COUNT(p.policy_id) FILTER (
        WHERE p.status = 'EXPIRED'
    ) AS expired_policies,

    COUNT(p.policy_id) FILTER (
        WHERE p.status = 'CANCELLED'
    ) AS cancelled_policies,

    COALESCE(
        SUM(p.annual_premium),
        0
    ) AS total_annual_premium,

    COALESCE(
        SUM(p.insured_amount),
        0
    ) AS total_insured_amount,

    ROUND(
        AVG(p.annual_premium),
        2
    ) AS average_policy_premium

FROM public.customers AS c

LEFT JOIN public.policies AS p
    ON c.customer_id = p.customer_id

GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email;