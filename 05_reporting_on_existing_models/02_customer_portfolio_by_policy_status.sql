-- Module 05: Reporting on Existing Models
-- Exercise 02: Customer Portfolio by Policy Status
--
-- Business purpose:
-- Analyze each customer's portfolio composition by policy status.
--
-- Source tables:
--   public.customers
--   public.policies
--
-- Reporting grain:
--   One row per customer and policy status.
--
-- This query is read-only.

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    p.status,

    COUNT(p.policy_id) AS total_policies,

    COALESCE(
        SUM(p.annual_premium),
        0
    ) AS total_annual_premium,

    ROUND(
        100.0 * COUNT(p.policy_id)
        / NULLIF(
            SUM(COUNT(p.policy_id)) OVER (
                PARTITION BY c.customer_id
            ),
            0
        ),
        2
    ) AS percentage_of_customer_policies

FROM public.customers AS c

LEFT JOIN public.policies AS p
    ON c.customer_id = p.customer_id

GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    p.status

ORDER BY
    c.customer_id,
    p.status;