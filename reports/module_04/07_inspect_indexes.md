# SQL Execution Report — Module 04

**Module:** Understanding Existing Data Models
**SQL file:** `04_existing_data_models/07_inspect_indexes.sql`
**Generated:** 2026-11-05 13:28:37 UTC
**Rows returned:** 5
**Execution time:** 0.073581 seconds

## Query Results

| schemaname | tablename | indexname | indexdef |
| --- | --- | --- | --- |
| public | customers | customers_email_key | CREATE UNIQUE INDEX customers_email_key ON public.customers USING btree (email) |
| public | customers | pk_customers | CREATE UNIQUE INDEX pk_customers ON public.customers USING btree (customer_id) |
| public | policies | pk_policies | CREATE UNIQUE INDEX pk_policies ON public.policies USING btree (policy_id) |
| public | policies | uq_policies_policy_number | CREATE UNIQUE INDEX uq_policies_policy_number ON public.policies USING btree (policy_number) |
| public | transaction_demo | transaction_demo_pkey | CREATE UNIQUE INDEX transaction_demo_pkey ON public.transaction_demo USING btree (demo_id) |

---

*Generated automatically by the Enterprise SQL Analytics reporting engine.*
