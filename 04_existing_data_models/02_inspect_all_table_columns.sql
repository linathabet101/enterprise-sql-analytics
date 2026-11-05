-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: Column Metadata
-- Objective: Build a basic data dictionary.
-- ============================================================

SELECT
    table_schema,
    table_name,
    ordinal_position,
    column_name,
    data_type,
    character_maximum_length,
    numeric_precision,
    numeric_scale,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
ORDER BY
    table_name,
    ordinal_position;