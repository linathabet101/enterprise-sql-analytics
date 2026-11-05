-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: Table Storage
-- Objective: Inspect table and index storage sizes.
-- ============================================================

SELECT
    schemaname,
    tablename,
    pg_size_pretty(
        pg_relation_size(
            FORMAT('%I.%I', schemaname, tablename)::regclass
        )
    ) AS table_size,
    pg_size_pretty(
        pg_indexes_size(
            FORMAT('%I.%I', schemaname, tablename)::regclass
        )
    ) AS indexes_size,
    pg_size_pretty(
        pg_total_relation_size(
            FORMAT('%I.%I', schemaname, tablename)::regclass
        )
    ) AS total_size
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY
    pg_total_relation_size(
        FORMAT('%I.%I', schemaname, tablename)::regclass
    ) DESC;