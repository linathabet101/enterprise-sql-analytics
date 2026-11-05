-- ============================================================
-- Module: 03 - Advanced SQL
-- Lesson: Integrated Customer Analysis
-- Business question:
-- How can we combine CTEs, aggregation, ranking,
-- and window functions to analyze the insurance portfolio?
-- ============================================================

WITH customer_metrics AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        COUNT(p.policy_id) AS total_policies,
        COALESCE(SUM(p.annual_premium), 0) AS total_annual_premium,
        COALESCE(AVG(p.annual_premium), 0) AS average_policy_premium
    FROM public.customers AS c
    LEFT JOIN public.policies AS p
        ON c.customer_id = p.customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name
),
ranked_customers AS (
    SELECT
        customer_id,
        first_name,
        last_name,
        total_policies,
        total_annual_premium,
        average_policy_premium,
        RANK() OVER (
            ORDER BY total_annual_premium DESC
        ) AS premium_rank,
        SUM(total_annual_premium) OVER () AS portfolio_premium
    FROM customer_metrics
)
SELECT
    customer_id,
    first_name,
    last_name,
    total_policies,
    total_annual_premium,
    ROUND(average_policy_premium, 2) AS average_policy_premium,
    premium_rank,
    ROUND(
        100.0 * total_annual_premium
        / NULLIF(portfolio_premium, 0),
        2
    ) AS portfolio_share_percentage
FROM ranked_customers
ORDER BY premium_rank, customer_id;