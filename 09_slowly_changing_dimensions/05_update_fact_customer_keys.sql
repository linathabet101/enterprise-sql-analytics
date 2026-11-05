-- Module 09: Slowly Changing Dimensions
-- Exercise 05: Update Fact Table Customer Keys
--
-- Business purpose:
-- Link each policy fact to the customer dimension version
-- valid on the policy start date.

UPDATE warehouse.fact_policy AS fact

SET customer_key = dimension.customer_key

FROM public.policies AS source

CROSS JOIN warehouse.dim_date AS policy_date

CROSS JOIN warehouse.dim_customer AS dimension

WHERE source.policy_id = fact.policy_id

  AND policy_date.date_key = fact.start_date_key

  AND dimension.customer_id = source.customer_id

  AND policy_date.full_date
      BETWEEN dimension.effective_from
          AND dimension.effective_to

  AND fact.customer_key <> dimension.customer_key;