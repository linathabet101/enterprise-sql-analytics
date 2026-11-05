-- Module 05: Reporting on Existing Models
-- Exercise 06: Top Customers by Premium
--
-- Business purpose:
-- Identify the highest-value customers based on annual premium.
--
-- Source tables:
--   public.customers
--   public.policies
--
-- Reporting grain:
--   One row per customer with at least one policy.
--
-- This query is read-only.

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,

    COUNT(p.policy_id) AS total_policies,

    SUM(p.annual_premium) AS total_annual_premium,

    SUM(p.insured_amount) AS total_insured_amount,

    ROUND(
        AVG(p.annual_premium),
        2
    ) AS average_policy_premium,

    RANK() OVER (
        ORDER BY SUM(p.annual_premium) DESC
    ) AS premium_rank

FROM public.customers AS c

INNER JOIN public.policies AS p
    ON c.customer_id = p.customer_id

GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name

ORDER BY
    premium_rank,
    c.customer_id;