# SQL Execution Report — Module 11

**Module:** Quality and Optimization
**SQL file:** `11_quality_and_optimization/08_inspect_warehouse_indexes.sql`
**Generated:** 2026-11-06 06:33:29 UTC
**Rows returned:** 20
**Execution time:** 0.086676 seconds

## Query Results

| schemaname | tablename | indexname | indexdef |
| --- | --- | --- | --- |
| warehouse | dim_customer | dim_customer_pkey | CREATE UNIQUE INDEX dim_customer_pkey ON warehouse.dim_customer USING btree (customer_key) |
| warehouse | dim_customer | idx_dim_customer_customer_id | CREATE INDEX idx_dim_customer_customer_id ON warehouse.dim_customer USING btree (customer_id) |
| warehouse | dim_customer | idx_dim_customer_history | CREATE INDEX idx_dim_customer_history ON warehouse.dim_customer USING btree (customer_id, effective_from, effective_to) |
| warehouse | dim_customer | uq_dim_customer_current_version | CREATE UNIQUE INDEX uq_dim_customer_current_version ON warehouse.dim_customer USING btree (customer_id) WHERE (is_current = true) |
| warehouse | dim_date | dim_date_full_date_key | CREATE UNIQUE INDEX dim_date_full_date_key ON warehouse.dim_date USING btree (full_date) |
| warehouse | dim_date | dim_date_pkey | CREATE UNIQUE INDEX dim_date_pkey ON warehouse.dim_date USING btree (date_key) |
| warehouse | dim_date | idx_dim_date_year_month | CREATE INDEX idx_dim_date_year_month ON warehouse.dim_date USING btree (year_number, month_number) |
| warehouse | dim_policy_status | dim_policy_status_pkey | CREATE UNIQUE INDEX dim_policy_status_pkey ON warehouse.dim_policy_status USING btree (policy_status_key) |
| warehouse | dim_policy_status | dim_policy_status_status_key | CREATE UNIQUE INDEX dim_policy_status_status_key ON warehouse.dim_policy_status USING btree (status) |
| warehouse | dim_policy_type | dim_policy_type_pkey | CREATE UNIQUE INDEX dim_policy_type_pkey ON warehouse.dim_policy_type USING btree (policy_type_key) |
| warehouse | dim_policy_type | dim_policy_type_policy_type_key | CREATE UNIQUE INDEX dim_policy_type_policy_type_key ON warehouse.dim_policy_type USING btree (policy_type) |
| warehouse | etl_run_log | etl_run_log_pkey | CREATE UNIQUE INDEX etl_run_log_pkey ON warehouse.etl_run_log USING btree (run_id) |
| warehouse | etl_run_log | idx_etl_run_log_started_at | CREATE INDEX idx_etl_run_log_started_at ON warehouse.etl_run_log USING btree (started_at DESC) |
| warehouse | fact_policy | fact_policy_pkey | CREATE UNIQUE INDEX fact_policy_pkey ON warehouse.fact_policy USING btree (fact_policy_key) |
| warehouse | fact_policy | fact_policy_policy_id_key | CREATE UNIQUE INDEX fact_policy_policy_id_key ON warehouse.fact_policy USING btree (policy_id) |
| warehouse | fact_policy | idx_fact_policy_customer_key | CREATE INDEX idx_fact_policy_customer_key ON warehouse.fact_policy USING btree (customer_key) |
| warehouse | fact_policy | idx_fact_policy_end_date_key | CREATE INDEX idx_fact_policy_end_date_key ON warehouse.fact_policy USING btree (end_date_key) |
| warehouse | fact_policy | idx_fact_policy_start_date | CREATE INDEX idx_fact_policy_start_date ON warehouse.fact_policy USING btree (start_date_key) |
| warehouse | fact_policy | idx_fact_policy_status_key | CREATE INDEX idx_fact_policy_status_key ON warehouse.fact_policy USING btree (policy_status_key) |
| warehouse | fact_policy | idx_fact_policy_type_key | CREATE INDEX idx_fact_policy_type_key ON warehouse.fact_policy USING btree (policy_type_key) |

---

*Generated automatically by the Enterprise SQL Analytics reporting engine.*
