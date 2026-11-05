EXPLAIN (ANALYZE, BUFFERS)
SELECT
    policy_type.policy_type,
    policy_status.status,
    COUNT(*) AS total_policies,
    SUM(fact.annual_premium) AS total_annual_premium
FROM warehouse.fact_policy AS fact
INNER JOIN warehouse.dim_policy_type AS policy_type
    ON policy_type.policy_type_key = fact.policy_type_key
INNER JOIN warehouse.dim_policy_status AS policy_status
    ON policy_status.policy_status_key = fact.policy_status_key
GROUP BY
    policy_type.policy_type,
    policy_status.status
ORDER BY
    total_annual_premium DESC;