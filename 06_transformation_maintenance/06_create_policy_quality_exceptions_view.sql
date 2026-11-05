-- Module 06: Transformation Maintenance
-- Exercise 06: Create a Policy Quality Exceptions View
--
-- Business purpose:
-- Centralize detection of policy records with suspicious values.
--
-- Source table:
--   public.policies
--
-- Transformation grain:
--   One row per policy with at least one detected exception.

CREATE OR REPLACE VIEW analytics.vw_policy_quality_exceptions AS

SELECT
    policy_id,
    policy_number,
    customer_id,
    policy_type,
    status,
    annual_premium,
    insured_amount,
    start_date,
    end_date,

    CASE
        WHEN annual_premium < 0
            THEN 'NEGATIVE_PREMIUM'

        WHEN insured_amount <= 0
            THEN 'INVALID_INSURED_AMOUNT'

        WHEN end_date < start_date
            THEN 'INVALID_POLICY_DATES'

        WHEN policy_number IS NULL
            THEN 'MISSING_POLICY_NUMBER'

        ELSE 'OTHER'
    END AS exception_type

FROM public.policies

WHERE
    annual_premium < 0
    OR insured_amount <= 0
    OR end_date < start_date
    OR policy_number IS NULL;