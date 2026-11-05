-- Module 09: Slowly Changing Dimensions
-- Exercise 08: Enforce Current Customer Uniqueness
--
-- Business purpose:
-- Prevent multiple current records for the same customer.
--
-- Historical records remain permitted.
-- Only one record per customer can be marked current.

CREATE UNIQUE INDEX IF NOT EXISTS
    uq_dim_customer_current_version

ON warehouse.dim_customer(customer_id)

WHERE is_current = TRUE;