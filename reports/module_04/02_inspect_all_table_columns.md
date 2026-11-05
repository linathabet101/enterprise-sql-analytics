# SQL Execution Report — Module 04

**Module:** Understanding Existing Data Models
**SQL file:** `04_existing_data_models/02_inspect_all_table_columns.sql`
**Generated:** 2026-11-05 13:28:36 UTC
**Rows returned:** 18
**Execution time:** 0.204009 seconds

## Query Results

| table_schema | table_name | ordinal_position | column_name | data_type | character_maximum_length | numeric_precision | numeric_scale | is_nullable | column_default |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| public | customers | 1 | customer_id | integer | NULL | 32 | 0 | NO | NULL |
| public | customers | 2 | first_name | character varying | 50 | NULL | NULL | NO | NULL |
| public | customers | 3 | last_name | character varying | 50 | NULL | NULL | NO | NULL |
| public | customers | 4 | email | character varying | 255 | NULL | NULL | YES | NULL |
| public | customers | 5 | date_of_birth | date | NULL | NULL | NULL | YES | NULL |
| public | customers | 6 | created_at | timestamp with time zone | NULL | NULL | NULL | YES | CURRENT_TIMESTAMP |
| public | policies | 1 | policy_id | integer | NULL | 32 | 0 | NO | NULL |
| public | policies | 2 | policy_number | character varying | 30 | NULL | NULL | NO | NULL |
| public | policies | 3 | customer_id | integer | NULL | 32 | 0 | NO | NULL |
| public | policies | 4 | policy_type | character varying | 30 | NULL | NULL | NO | NULL |
| public | policies | 5 | status | character varying | 20 | NULL | NULL | NO | 'ACTIVE'::character varying |
| public | policies | 6 | annual_premium | numeric | NULL | 12 | 2 | NO | NULL |
| public | policies | 7 | insured_amount | numeric | NULL | 14 | 2 | NO | NULL |
| public | policies | 8 | start_date | date | NULL | NULL | NULL | NO | NULL |
| public | policies | 9 | end_date | date | NULL | NULL | NULL | NO | NULL |
| public | policies | 10 | created_at | timestamp with time zone | NULL | NULL | NULL | NO | CURRENT_TIMESTAMP |
| public | transaction_demo | 1 | demo_id | integer | NULL | 32 | 0 | NO | NULL |
| public | transaction_demo | 2 | description | character varying | 100 | NULL | NULL | YES | NULL |

---

*Generated automatically by the Enterprise SQL Analytics reporting engine.*
