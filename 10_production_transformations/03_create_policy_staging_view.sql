CREATE OR REPLACE VIEW staging.vw_policies AS
SELECT
    policy_id,
    policy_number,
    customer_id,
    policy_type,
    status,
    start_date,
    end_date,
    annual_premium,
    insured_amount
FROM public.policies;

COMMENT ON VIEW staging.vw_policies IS
    'Standardized source policy records for warehouse loading.';