# SQL Execution Report — Module 04

**Module:** Understanding Existing Data Models
**SQL file:** `04_existing_data_models/04_identify_primary_and_unique_keys.sql`
**Generated:** 2026-11-05 13:28:36 UTC
**Rows returned:** 5
**Execution time:** 0.085208 seconds

## Query Results

| table_name | constraint_name | constraint_type | column_name | ordinal_position |
| --- | --- | --- | --- | --- |
| customers | pk_customers | PRIMARY KEY | customer_id | 1 |
| customers | customers_email_key | UNIQUE | email | 1 |
| policies | pk_policies | PRIMARY KEY | policy_id | 1 |
| policies | uq_policies_policy_number | UNIQUE | policy_number | 1 |
| transaction_demo | transaction_demo_pkey | PRIMARY KEY | demo_id | 1 |

---

*Generated automatically by the Enterprise SQL Analytics reporting engine.*
