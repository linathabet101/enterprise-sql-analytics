CREATE OR REPLACE VIEW warehouse.vw_data_quality_issues AS

-- Source customers without a current dimension version.
SELECT
    'ERROR'::VARCHAR(10) AS severity,
    'MISSING_CURRENT_CUSTOMER'::VARCHAR(100) AS issue_code,
    'CUSTOMER'::VARCHAR(50) AS entity_type,
    source.customer_id::VARCHAR(100) AS entity_id,
    'Source customer has no current dimension version.'::TEXT
        AS issue_description
FROM staging.vw_customers AS source
LEFT JOIN warehouse.dim_customer AS dimension
    ON dimension.customer_id = source.customer_id
   AND dimension.is_current = TRUE
WHERE dimension.customer_key IS NULL

UNION ALL

-- Customers with multiple current versions.
SELECT
    'ERROR',
    'MULTIPLE_CURRENT_VERSIONS',
    'CUSTOMER',
    customer_id::VARCHAR(100),
    'Customer has more than one current dimension version.'
FROM warehouse.dim_customer
GROUP BY customer_id
HAVING COUNT(*) FILTER (WHERE is_current = TRUE) > 1

UNION ALL

-- Source policies without warehouse facts.
SELECT
    'ERROR',
    'MISSING_POLICY_FACT',
    'POLICY',
    source.policy_id::VARCHAR(100),
    'Source policy has no corresponding warehouse fact.'
FROM staging.vw_policies AS source
LEFT JOIN warehouse.fact_policy AS fact
    ON fact.policy_id = source.policy_id
WHERE fact.policy_id IS NULL

UNION ALL

-- Facts without corresponding source policies.
SELECT
    'ERROR',
    'ORPHANED_POLICY_FACT',
    'POLICY',
    fact.policy_id::VARCHAR(100),
    'Warehouse fact has no corresponding source policy.'
FROM warehouse.fact_policy AS fact
LEFT JOIN staging.vw_policies AS source
    ON source.policy_id = fact.policy_id
WHERE source.policy_id IS NULL

UNION ALL

-- Facts with an invalid customer version for the policy start date.
SELECT
    'ERROR',
    'INVALID_CUSTOMER_VERSION',
    'POLICY',
    fact.policy_id::VARCHAR(100),
    'Fact references a customer version that does not match the source customer or policy start date.'
FROM warehouse.fact_policy AS fact
INNER JOIN staging.vw_policies AS source
    ON source.policy_id = fact.policy_id
INNER JOIN warehouse.dim_customer AS customer
    ON customer.customer_key = fact.customer_key
INNER JOIN warehouse.dim_date AS policy_date
    ON policy_date.date_key = fact.start_date_key
WHERE customer.customer_id <> source.customer_id
   OR policy_date.full_date NOT BETWEEN
        customer.effective_from AND customer.effective_to

UNION ALL

-- Facts with missing dimension references.
SELECT
    'ERROR',
    'MISSING_DIMENSION_REFERENCE',
    'POLICY',
    fact.policy_id::VARCHAR(100),
    'One or more required dimension references cannot be resolved.'
FROM warehouse.fact_policy AS fact
LEFT JOIN warehouse.dim_customer AS customer
    ON customer.customer_key = fact.customer_key
LEFT JOIN warehouse.dim_policy_type AS policy_type
    ON policy_type.policy_type_key = fact.policy_type_key
LEFT JOIN warehouse.dim_policy_status AS policy_status
    ON policy_status.policy_status_key = fact.policy_status_key
LEFT JOIN warehouse.dim_date AS policy_date
    ON policy_date.date_key = fact.start_date_key
WHERE customer.customer_key IS NULL
   OR policy_type.policy_type_key IS NULL
   OR policy_status.policy_status_key IS NULL
   OR policy_date.date_key IS NULL;

COMMENT ON VIEW warehouse.vw_data_quality_issues IS
    'Centralized data-quality exceptions for customer history and policy facts.';