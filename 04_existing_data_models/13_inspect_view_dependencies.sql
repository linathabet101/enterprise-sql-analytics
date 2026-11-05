-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: View Dependencies
-- Objective: Identify objects referenced by existing views.
-- ============================================================

SELECT DISTINCT
    dependent_ns.nspname AS dependent_schema,
    dependent_view.relname AS dependent_view,
    referenced_ns.nspname AS referenced_schema,
    referenced_object.relname AS referenced_object
FROM pg_depend AS dependency
JOIN pg_rewrite AS rewrite_rule
    ON dependency.objid = rewrite_rule.oid
JOIN pg_class AS dependent_view
    ON rewrite_rule.ev_class = dependent_view.oid
JOIN pg_namespace AS dependent_ns
    ON dependent_view.relnamespace = dependent_ns.oid
JOIN pg_class AS referenced_object
    ON dependency.refobjid = referenced_object.oid
JOIN pg_namespace AS referenced_ns
    ON referenced_object.relnamespace = referenced_ns.oid
WHERE dependent_ns.nspname = 'public'
    AND dependent_view.relkind = 'v'
    AND referenced_object.relkind IN ('r', 'v', 'm')
    AND dependent_view.oid <> referenced_object.oid
ORDER BY
    dependent_view.relname,
    referenced_object.relname;