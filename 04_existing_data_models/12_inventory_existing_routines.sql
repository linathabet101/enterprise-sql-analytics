-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: Routine Inventory
-- Objective: Discover existing functions and procedures.
-- ============================================================

SELECT
    routine_schema,
    routine_name,
    routine_type,
    data_type AS return_data_type,
    external_language
FROM information_schema.routines
WHERE routine_schema = 'public'
ORDER BY
    routine_type,
    routine_name;