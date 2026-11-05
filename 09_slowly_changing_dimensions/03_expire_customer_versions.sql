-- Module 09: Slowly Changing Dimensions
-- Exercise 03: Expire Previous Customer Versions
--
-- Business purpose:
-- Close the validity period of customer records
-- whose attributes have changed.
--
-- The previous version becomes historical.
-- A replacement version is inserted in File 04.

UPDATE warehouse.dim_customer AS dimension

SET
    effective_to = CURRENT_DATE - 1,
    is_current = FALSE

FROM public.customers AS source

WHERE dimension.customer_id = source.customer_id

  AND dimension.is_current = TRUE

  AND dimension.effective_from < CURRENT_DATE

  AND (
        dimension.first_name IS DISTINCT FROM source.first_name
     OR dimension.last_name IS DISTINCT FROM source.last_name
     OR dimension.email IS DISTINCT FROM source.email
  );