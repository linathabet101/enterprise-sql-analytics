-- Module 09: Slowly Changing Dimensions
-- Exercise 04: Insert New Customer Versions
--
-- Business purpose:
-- Create a new historical version when customer attributes
-- have changed.
--
-- Same-day changes are updated in place because the
-- dimension uses DATE-level validity.

-- 1. Update the current version if it was created today.
-- This avoids creating multiple versions with the same
-- effective start date.

UPDATE warehouse.dim_customer AS dimension

SET
    first_name = source.first_name,
    last_name = source.last_name,
    email = source.email,
    created_at = source.created_at

FROM public.customers AS source

WHERE dimension.customer_id = source.customer_id

  AND dimension.is_current = TRUE

  AND dimension.effective_from = CURRENT_DATE

  AND (
        dimension.first_name IS DISTINCT FROM source.first_name
     OR dimension.last_name IS DISTINCT FROM source.last_name
     OR dimension.email IS DISTINCT FROM source.email
  );


-- 2. Insert a new version for customers without a current record.

INSERT INTO warehouse.dim_customer (
    customer_id,
    first_name,
    last_name,
    email,
    created_at,
    effective_from,
    effective_to,
    is_current
)

SELECT
    source.customer_id,
    source.first_name,
    source.last_name,
    source.email,
    source.created_at,
    CURRENT_DATE,
    DATE '9999-12-31',
    TRUE

FROM public.customers AS source

WHERE NOT EXISTS (
    SELECT 1
    FROM warehouse.dim_customer AS dimension
    WHERE dimension.customer_id = source.customer_id
      AND dimension.is_current = TRUE
);