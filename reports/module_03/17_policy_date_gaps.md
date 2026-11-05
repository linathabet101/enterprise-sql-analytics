# SQL Execution Report — Module 03

**Module:** Advanced SQL
**SQL file:** `03_advanced_sql/17_policy_date_gaps.sql`
**Generated:** 2026-11-05 12:07:31 UTC
**Rows returned:** 10
**Execution time:** 0.053987 seconds

## Query Results

| customer_id | policy_number | start_date | previous_start_date | days_since_previous_policy |
| --- | --- | --- | --- | --- |
| 1 | POL-2026-0001 | 2026-01-01 | NULL | NULL |
| 1 | POL-2026-0002 | 2026-02-01 | 2026-01-01 | 31 |
| 2 | POL-2026-0004 | 2025-01-01 | NULL | NULL |
| 2 | POL-2026-0003 | 2026-01-15 | 2025-01-01 | 379 |
| 3 | POL-2026-0005 | 2026-03-01 | NULL | NULL |
| 3 | POL-2026-0006 | 2026-04-01 | 2026-03-01 | 31 |
| 4 | POL-2026-0007 | 2026-02-01 | NULL | NULL |
| 4 | POL-2026-0008 | 2026-05-01 | 2026-02-01 | 89 |
| 5 | POL-2026-0009 | 2026-01-01 | NULL | NULL |
| 5 | POL-2026-0010 | 2026-06-01 | 2026-01-01 | 151 |

---

*Generated automatically by the Enterprise SQL Analytics reporting engine.*
