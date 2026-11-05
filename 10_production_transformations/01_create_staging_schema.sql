CREATE SCHEMA IF NOT EXISTS staging;

COMMENT ON SCHEMA staging IS
    'Contains standardized source views used by production warehouse transformations.';