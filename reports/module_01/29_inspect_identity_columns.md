# SQL Execution Report — Module 01

**Module:** Database Foundations
**SQL file:** `01_database_foundations/29_inspect_identity_columns.sql`
**Generated:** 2026-11-05 11:59:52 UTC
**Rows returned:** 2
**Execution time:** 0.066070 seconds

## Query Results

| table_name | column_name | data_type | is_identity | identity_generation | identity_start | identity_increment | associated_sequence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| customers | customer_id | integer | YES | ALWAYS | 1 | 1 | public.customers_customer_id_seq |
| policies | policy_id | integer | YES | ALWAYS | 1 | 1 | public.policies_policy_id_seq |

---

*Generated automatically by the Enterprise SQL Analytics reporting engine.*
