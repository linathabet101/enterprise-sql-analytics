-- Module 09: Slowly Changing Dimensions
-- Exercise 06: Validate SCD Type 2 History
--
-- Business purpose:
-- Check that each source customer has exactly
-- one current warehouse version.

SELECT
    source.customer_id,

    COUNT(dimension.customer_key) FILTER (
        WHERE dimension.is_current = TRUE
    ) AS current_version_count,

    COUNT(dimension.customer_key) AS total_historical_versions,

    CASE
        WHEN COUNT(dimension.customer_key) FILTER (
            WHERE dimension.is_current = TRUE
        ) = 1
        THEN 'VALID'

        ELSE 'REVIEW REQUIRED'
    END AS validation_status

FROM public.customers AS source

LEFT JOIN warehouse.dim_customer AS dimension
    ON source.customer_id = dimension.customer_id

GROUP BY source.customer_id

ORDER BY source.customer_id;