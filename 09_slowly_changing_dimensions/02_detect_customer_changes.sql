-- Module 09: Slowly Changing Dimensions
-- Exercise 02: Detect Customer Attribute Changes
--
-- Business purpose:
-- Compare source customer attributes with current
-- warehouse dimension records.
--
-- The query identifies customers requiring a new version.

SELECT
    source.customer_id,

    dimension.customer_key,

    dimension.first_name AS old_first_name,
    source.first_name AS new_first_name,

    dimension.last_name AS old_last_name,
    source.last_name AS new_last_name,

    dimension.email AS old_email,
    source.email AS new_email,

    CASE
        WHEN dimension.customer_key IS NULL
            THEN 'NEW CUSTOMER'

        WHEN dimension.first_name IS DISTINCT FROM source.first_name
          OR dimension.last_name IS DISTINCT FROM source.last_name
          OR dimension.email IS DISTINCT FROM source.email
            THEN 'ATTRIBUTE CHANGED'

        ELSE 'NO CHANGE'
    END AS change_status

FROM public.customers AS source

LEFT JOIN warehouse.dim_customer AS dimension
    ON source.customer_id = dimension.customer_id
   AND dimension.is_current = TRUE

ORDER BY source.customer_id;