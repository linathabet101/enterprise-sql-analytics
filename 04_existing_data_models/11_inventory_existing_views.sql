-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: View Inventory
-- Objective: Discover existing database views.
-- ============================================================

SELECT
    table_schema,
    table_name AS view_name,
    view_definition,
    check_option,
    is_updatable
FROM information_schema.views
WHERE table_schema = 'public'
ORDER BY table_name;