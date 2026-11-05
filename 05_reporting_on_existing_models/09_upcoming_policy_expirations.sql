-- Module 05: Reporting on Existing Models
-- Exercise 09: Upcoming Policy Expirations
--
-- Business purpose:
-- Identify active policies approaching their expiration dates.
--
-- Source tables:
--   public.customers
--   public.policies
--
-- Reporting grain:
--   One row per qualifying policy.
--
-- This query is read-only.

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,

    p.policy_id,
    p.policy_number,
    p.policy_type,
    p.status,

    p.start_date,
    p.end_date,

    p.annual_premium,

    (p.end_date - CURRENT_DATE) AS days_until_expiration

FROM public.customers AS c

INNER JOIN public.policies AS p
    ON c.customer_id = p.customer_id

WHERE
    p.status = 'ACTIVE'
    AND p.end_date >= CURRENT_DATE
    AND p.end_date <= CURRENT_DATE + 90

ORDER BY
    p.end_date,
    c.customer_id;