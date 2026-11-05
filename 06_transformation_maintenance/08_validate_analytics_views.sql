-- Module 06: Transformation Maintenance
-- Exercise 08: Validate All Analytical Views
--
-- Business purpose:
-- Confirm that analytical views exist and return expected data structures.
--
-- This query is read-only.

SELECT
    table_schema,
    table_name,
    view_definition

FROM information_schema.views

WHERE
    table_schema = 'analytics'

ORDER BY
    table_name;