-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: Constraint Discovery
-- Objective: Inventory all table constraints.
-- ============================================================

SELECT
    tc.table_schema,
    tc.table_name,
    tc.constraint_name,
    tc.constraint_type
FROM information_schema.table_constraints AS tc
WHERE tc.table_schema = 'public'
ORDER BY
    tc.table_name,
    tc.constraint_type,
    tc.constraint_name;