-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: Customer-Policy Relationship Analysis
-- Objective: Assess relationship cardinality and integrity.
-- ============================================================

WITH customer_policy_counts AS (
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
        COUNT(*) AS total_customers,
        COUNT(*) FILTER (
            WHERE policy_count = 0
        ) AS customers_without_policies,
        COUNT(*) FILTER (
            WHERE policy_count = 1
        ) AS customers_with_one_policy,
        COUNT(*) FILTER (
            WHERE policy_count > 1
        ) AS customers_with_multiple_policies,
        SUM(policy_count) AS policies_linked_to_customers
    FROM customer_policy_counts
),
policy_integrity AS (
    SELECT
        COUNT(*) AS total_policies,
        COUNT(*) FILTER (
            WHERE c.customer_id IS NULL
        ) AS policies_without_customers
    FROM public.policies AS p
    LEFT JOIN public.customers AS c
        ON p.customer_id = c.customer_id
)
SELECT
    rs.total_customers,
    pi.total_policies,
    rs.customers_without_policies,
    rs.customers_with_one_policy,
    rs.customers_with_multiple_policies,
    rs.policies_linked_to_customers,
    pi.policies_without_customers
FROM relationship_summary AS rs
CROSS JOIN policy_integrity AS pi;