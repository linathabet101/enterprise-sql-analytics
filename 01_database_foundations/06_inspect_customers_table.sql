-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: 01.2 - Creating Relational Tables
-- Purpose: Inspect the customers table structure
-- ============================================================

SELECT
    column_name,
    data_type,
    character_maximum_length,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'customers'
ORDER BY ordinal_position;