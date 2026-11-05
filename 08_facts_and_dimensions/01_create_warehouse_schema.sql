-- Module 08: Facts and Dimensions
-- Exercise 01: Create Warehouse Schema
--
-- Business purpose:
-- Establish a dedicated schema for analytical warehouse objects.

CREATE SCHEMA IF NOT EXISTS warehouse;

COMMENT ON SCHEMA warehouse IS
    'Contains dimensional models and analytical fact tables.';



SELECT
    schema_name
FROM information_schema.schemata
WHERE schema_name = 'warehouse';