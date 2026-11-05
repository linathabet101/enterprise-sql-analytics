-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: Referential Actions
-- Objective: Inspect foreign-key update and delete behavior.
-- ============================================================

SELECT
    constraint_schema,
    constraint_name,
    unique_constraint_schema,
    unique_constraint_name,
    match_option,
    update_rule,
    delete_rule
FROM information_schema.referential_constraints
WHERE constraint_schema = 'public'
ORDER BY constraint_name;