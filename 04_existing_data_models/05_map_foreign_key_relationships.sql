-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: Foreign Key Relationships
-- Objective: Map relationships between tables.
-- ============================================================

SELECT
    tc.constraint_name,
    tc.table_name AS referencing_table,
    kcu.column_name AS referencing_column,
    ccu.table_name AS referenced_table,
    ccu.column_name AS referenced_column,
    kcu.ordinal_position
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_catalog = kcu.constraint_catalog
    AND tc.constraint_schema = kcu.constraint_schema
    AND tc.constraint_name = kcu.constraint_name
    AND tc.table_name = kcu.table_name
JOIN information_schema.constraint_column_usage AS ccu
    ON tc.constraint_catalog = ccu.constraint_catalog
    AND tc.constraint_schema = ccu.constraint_schema
    AND tc.constraint_name = ccu.constraint_name
WHERE tc.constraint_schema = 'public'
    AND tc.constraint_type = 'FOREIGN KEY'
ORDER BY
    tc.table_name,
    tc.constraint_name,
    kcu.ordinal_position;