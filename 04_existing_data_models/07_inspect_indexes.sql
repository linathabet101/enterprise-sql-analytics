-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: Index Inventory
-- Objective: Inspect existing indexes.
-- ============================================================

SELECT
    schemaname,
    tablename,
    indexname,
    indexdef
FROM pg_indexes
WHERE schemaname = 'public'
ORDER BY
    tablename,
    indexname;