SELECT
    (SELECT COUNT(*)
     FROM staging.vw_policies) AS source_policy_count,

    (SELECT COUNT(*)
     FROM warehouse.fact_policy) AS warehouse_fact_count,

    (SELECT COUNT(*)
     FROM staging.vw_policies AS source
     LEFT JOIN warehouse.fact_policy AS fact
        ON fact.policy_id = source.policy_id
     WHERE fact.policy_id IS NULL) AS missing_policy_facts,

    (SELECT COUNT(*)
     FROM warehouse.fact_policy AS fact
     LEFT JOIN staging.vw_policies AS source
        ON source.policy_id = fact.policy_id
     WHERE source.policy_id IS NULL) AS orphaned_policy_facts;