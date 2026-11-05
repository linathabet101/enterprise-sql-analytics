-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: 01.1 - Understanding Relational Databases
-- Purpose: Inspect the schemas available in the database
-- ============================================================

SELECT
    schema_name
FROM information_schema.schemata
ORDER BY schema_name;