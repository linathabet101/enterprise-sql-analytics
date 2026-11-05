-- Create indexes to support common warehouse reporting queries.

CREATE INDEX IF NOT EXISTS idx_fact_policy_type_key
    ON warehouse.fact_policy (policy_type_key);

CREATE INDEX IF NOT EXISTS idx_fact_policy_status_key
    ON warehouse.fact_policy (policy_status_key);

CREATE INDEX IF NOT EXISTS idx_fact_policy_end_date_key
    ON warehouse.fact_policy (end_date_key);

CREATE INDEX IF NOT EXISTS idx_dim_date_year_month
    ON warehouse.dim_date (year_number, month_number);

COMMENT ON INDEX warehouse.idx_fact_policy_type_key IS
    'Supports policy type reporting and aggregation.';

COMMENT ON INDEX warehouse.idx_fact_policy_status_key IS
    'Supports policy status reporting and aggregation.';