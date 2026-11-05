-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: Check Constraints
-- Objective: Discover database-enforced business rules.
-- ============================================================

SELECT
    tc.table_name,
    tc.constraint_name,
    cc.check_clause
FROM information_schema.table_constraints AS tc
JOIN information_schema.check_constraints AS cc
    ON tc.constraint_catalog = cc.constraint_catalog
    AND tc.constraint_schema = cc.constraint_schema
    AND tc.constraint_name = cc.constraint_name
WHERE tc.constraint_schema = 'public'
    AND tc.constraint_type = 'CHECK'
ORDER BY
    tc.table_name,
    tc.constraint_name;