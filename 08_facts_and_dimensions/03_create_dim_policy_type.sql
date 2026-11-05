-- Module 08: Facts and Dimensions
-- Exercise 03: Create the Policy Type Dimension
--
-- Business purpose:
-- Organize insurance policies by product category.
--
-- Dimension grain:
-- One row per policy type.

CREATE TABLE IF NOT EXISTS warehouse.dim_policy_type (
    policy_type_key BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    policy_type VARCHAR(100) NOT NULL UNIQUE
);

COMMENT ON TABLE warehouse.dim_policy_type IS
    'Reference dimension containing distinct insurance policy types.';