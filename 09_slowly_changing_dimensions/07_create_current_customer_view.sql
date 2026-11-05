-- Module 09: Slowly Changing Dimensions
-- Exercise 07: Create the Current Customer View
--
-- Business purpose:
-- Provide a reusable view containing only current
-- customer dimension records.

CREATE OR REPLACE VIEW warehouse.vw_current_customers AS

SELECT
    customer_key,
    customer_id,
    first_name,
    last_name,
    email,
    created_at,
    effective_from,
    effective_to,
    is_current

FROM warehouse.dim_customer

WHERE is_current = TRUE;