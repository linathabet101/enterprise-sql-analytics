-- Module 06: Transformation Maintenance
-- Exercise 01: Create the Analytics Schema
--
-- Business purpose:
-- Separate analytical transformations from operational source tables.
--
-- This script creates a schema if it does not already exist.

CREATE SCHEMA IF NOT EXISTS analytics;

COMMENT ON SCHEMA analytics IS
    'Contains reusable analytical views and reporting transformations.';