-- Module 08: Facts and Dimensions
-- Exercise 09: Load the Policy Fact Table
--
-- Business purpose:
-- Connect source policies to their corresponding
-- customer, policy type, policy status and date dimensions.
--
-- Fact grain:
-- One row per policy.

INSERT INTO warehouse.fact_policy (
    policy_id,
    policy_number,
    customer_key,
    policy_type_key,
    policy_status_key,
    start_date_key,
    end_date_key,
    annual_premium,
    insured_amount
)
SELECT
    p.policy_id,
    p.policy_number,

    dc.customer_key,
    dpt.policy_type_key,
    dps.policy_status_key,

    start_date.date_key,
    end_date.date_key,

    p.annual_premium,
    p.insured_amount

FROM public.policies AS p

INNER JOIN warehouse.dim_customer AS dc
    ON p.customer_id = dc.customer_id

INNER JOIN warehouse.dim_policy_type AS dpt
    ON p.policy_type = dpt.policy_type

INNER JOIN warehouse.dim_policy_status AS dps
    ON p.status = dps.status

INNER JOIN warehouse.dim_date AS start_date
    ON p.start_date = start_date.full_date

LEFT JOIN warehouse.dim_date AS end_date
    ON p.end_date = end_date.full_date

ON CONFLICT (policy_id)
DO UPDATE SET
    policy_number = EXCLUDED.policy_number,
    customer_key = EXCLUDED.customer_key,
    policy_type_key = EXCLUDED.policy_type_key,
    policy_status_key = EXCLUDED.policy_status_key,
    start_date_key = EXCLUDED.start_date_key,
    end_date_key = EXCLUDED.end_date_key,
    annual_premium = EXCLUDED.annual_premium,
    insured_amount = EXCLUDED.insured_amount,
    loaded_at = CURRENT_TIMESTAMP;