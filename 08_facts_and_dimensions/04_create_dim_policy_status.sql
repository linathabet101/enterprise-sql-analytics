-- Module 08: Facts and Dimensions
-- Exercise 04: Create the Policy Status Dimension
--
-- Business purpose:
-- Standardize policy statuses for analytical reporting.
--
-- Dimension grain:
-- One row per policy status.

CREATE TABLE IF NOT EXISTS warehouse.dim_policy_status (
    policy_status_key BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    status VARCHAR(50) NOT NULL UNIQUE
);

COMMENT ON TABLE warehouse.dim_policy_status IS
    'Reference dimension containing distinct insurance policy statuses.';