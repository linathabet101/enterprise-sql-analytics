-- Module 05: Reporting on Existing Models
-- Exercise 01: Customer Portfolio Overview
--
-- Business purpose:
-- Provide a consolidated view of each customer's insurance portfolio.
--
-- Source tables:
--   public.customers
--   public.policies
--
-- Reporting grain:
--   One row per customer.
--
-- This query is read-only.

WITH customer_portfolio AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,

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
        ) AS total_insured_amount

    FROM public.customers AS c

    LEFT JOIN public.policies AS p
        ON c.customer_id = p.customer_id

    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name
)

SELECT
    customer_id,
    first_name,
    last_name,
    total_policies,
    active_policies,
    expired_policies,
    cancelled_policies,
    total_annual_premium,
    total_insured_amount

FROM customer_portfolio

ORDER BY
    total_annual_premium DESC,
    customer_id;