-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: INNER JOIN
-- Purpose: Combine customer and insurance policy information
-- ============================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    p.policy_id,
    p.policy_number,
    p.policy_type,
    p.status,
    p.annual_premium,
    p.insured_amount,
    p.start_date,
    p.end_date

FROM public.customers AS c

INNER JOIN public.policies AS p
    ON c.customer_id = p.customer_id

ORDER BY
    c.customer_id,
    p.policy_id;