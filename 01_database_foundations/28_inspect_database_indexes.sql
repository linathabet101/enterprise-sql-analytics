-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: Database Indexes
-- File: 28_inspect_database_indexes.sql
--
-- Purpose:
-- Inspect indexes created on the project's public tables.
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