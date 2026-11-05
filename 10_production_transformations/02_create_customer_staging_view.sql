CREATE OR REPLACE VIEW staging.vw_customers AS
SELECT
    customer_id,
    first_name,
    last_name,
    email,
    created_at
FROM public.customers;

COMMENT ON VIEW staging.vw_customers IS
    'Standardized source customer records for warehouse loading.';