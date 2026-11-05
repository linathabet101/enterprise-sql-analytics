-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: 01.2 - Table Constraints
-- Purpose: Inspect constraints on the customers table
-- ============================================================

SELECT
    constraint_name,
    constraint_type
FROM information_schema.table_constraints
WHERE table_schema = 'public'
  AND table_name = 'customers'
ORDER BY constraint_type, constraint_name;