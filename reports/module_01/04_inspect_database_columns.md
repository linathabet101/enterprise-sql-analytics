# SQL Execution Report — Module 01

**Module:** Database Foundations
**SQL file:** `01_database_foundations/04_inspect_database_columns.sql`
**Generated:** 2026-11-05 11:59:51 UTC
**Rows returned:** 18
**Execution time:** 0.120753 seconds

## Query Results

| table_schema | table_name | column_name | ordinal_position | data_type | is_nullable |
| --- | --- | --- | --- | --- | --- |
| public | customers | customer_id | 1 | integer | NO |
| public | customers | first_name | 2 | character varying | NO |
| public | customers | last_name | 3 | character varying | NO |
| public | customers | email | 4 | character varying | YES |
| public | customers | date_of_birth | 5 | date | YES |
| public | customers | created_at | 6 | timestamp with time zone | YES |
| public | policies | policy_id | 1 | integer | NO |
| public | policies | policy_number | 2 | character varying | NO |
| public | policies | customer_id | 3 | integer | NO |
| public | policies | policy_type | 4 | character varying | NO |
| public | policies | status | 5 | character varying | NO |
| public | policies | annual_premium | 6 | numeric | NO |
| public | policies | insured_amount | 7 | numeric | NO |
| public | policies | start_date | 8 | date | NO |
| public | policies | end_date | 9 | date | NO |
| public | policies | created_at | 10 | timestamp with time zone | NO |
| public | transaction_demo | demo_id | 1 | integer | NO |
| public | transaction_demo | description | 2 | character varying | YES |

---

*Generated automatically by the Enterprise SQL Analytics reporting engine.*
