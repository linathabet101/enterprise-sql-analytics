-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: Database Object Inventory
-- Objective: Identify existing tables and views.
-- ============================================================

SELECT
    table_schema,
    table_name,
    table_type
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY
    table_type,
    table_name;