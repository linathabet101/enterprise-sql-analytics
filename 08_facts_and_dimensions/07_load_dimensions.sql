-- Module 08: Facts and Dimensions
-- Exercise 07: Load the Reference Dimensions
--
-- Business purpose:
-- Populate customer, policy type and policy status dimensions.
--
-- This initial load uses Type 1 customer attributes.
-- Historical customer tracking is introduced in Module 09.

-- 1. Load customers without creating duplicates.

INSERT INTO warehouse.dim_customer (
    customer_id,
    first_name,
    last_name,
    email,
    created_at
)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.created_at
FROM public.customers AS c
WHERE NOT EXISTS (
    SELECT 1
    FROM warehouse.dim_customer AS d
    WHERE d.customer_id = c.customer_id
);

-- 2. Load policy types.

INSERT INTO warehouse.dim_policy_type (
    policy_type
)
SELECT DISTINCT
    p.policy_type
FROM public.policies AS p
WHERE p.policy_type IS NOT NULL
ON CONFLICT (policy_type) DO NOTHING;

-- 3. Load policy statuses.

INSERT INTO warehouse.dim_policy_status (
    status
)
SELECT DISTINCT
    p.status
FROM public.policies AS p
WHERE p.status IS NOT NULL
ON CONFLICT (status) DO NOTHING;