-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: Table Statistics
-- Objective: Inspect estimated table row counts.
-- ============================================================

SELECT
    schemaname,
    relname AS table_name,
    n_live_tup AS estimated_live_rows,
    n_dead_tup AS estimated_dead_rows,
    last_analyze,
    last_autoanalyze,
    last_vacuum,
    last_autovacuum
FROM pg_stat_user_tables
WHERE schemaname = 'public'
ORDER BY relname;