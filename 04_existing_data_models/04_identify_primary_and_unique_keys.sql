-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: Primary and Unique Keys
-- Objective: Identify unique identifiers.
-- ============================================================

SELECT
    tc.table_name,
    tc.constraint_name,
    tc.constraint_type,
    kcu.column_name,
    kcu.ordinal_position
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_catalog = kcu.constraint_catalog
    AND tc.constraint_schema = kcu.constraint_schema
    AND tc.constraint_name = kcu.constraint_name
    AND tc.table_name = kcu.table_name
WHERE tc.table_schema = 'public'
    AND tc.constraint_type IN ('PRIMARY KEY', 'UNIQUE')
ORDER BY
    tc.table_name,
    tc.constraint_type,
    tc.constraint_name,
    kcu.ordinal_position;