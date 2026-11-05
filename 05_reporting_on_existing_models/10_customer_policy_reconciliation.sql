-- Module 05: Reporting on Existing Models
-- Exercise 10: Customer and Policy Reconciliation
--
-- Business purpose:
-- Reconcile customer and policy records and identify
-- missing relationships or orphan policy records.
--
-- Source tables:
--   public.customers
--   public.policies
--
-- Reporting grain:
--   One summary row for the complete portfolio.
--
-- This query is read-only.

WITH customer_metrics AS (
    SELECT
        COUNT(*) AS total_customers
    FROM public.customers
),

policy_metrics AS (
    SELECT
        COUNT(*) AS total_policies,
        COUNT(DISTINCT customer_id) AS customers_with_policies
    FROM public.policies
),

customer_relationships AS (
    SELECT
        c.customer_id,
        COUNT(p.policy_id) AS policy_count
    FROM public.customers AS c
    LEFT JOIN public.policies AS p
        ON c.customer_id = p.customer_id
    GROUP BY c.customer_id
),

relationship_summary AS (
    SELECT
        COUNT(*) FILTER (
            WHERE policy_count = 0
        ) AS customers_without_policies,

        COUNT(*) FILTER (
            WHERE policy_count = 1
        ) AS customers_with_one_policy,

        COUNT(*) FILTER (
            WHERE policy_count > 1
        ) AS customers_with_multiple_policies

    FROM customer_relationships
),

orphan_policy_summary AS (
    SELECT
        COUNT(*) AS orphan_policy_count
    FROM public.policies AS p
    LEFT JOIN public.customers AS c
        ON p.customer_id = c.customer_id
    WHERE c.customer_id IS NULL
)

SELECT
    cm.total_customers,
    pm.total_policies,
    pm.customers_with_policies,

    rs.customers_without_policies,
    rs.customers_with_one_policy,
    rs.customers_with_multiple_policies,

    ops.orphan_policy_count,

    cm.total_customers
        - rs.customers_without_policies
        AS customers_with_at_least_one_policy

FROM customer_metrics AS cm
CROSS JOIN policy_metrics AS pm
CROSS JOIN relationship_summary AS rs
CROSS JOIN orphan_policy_summary AS ops;