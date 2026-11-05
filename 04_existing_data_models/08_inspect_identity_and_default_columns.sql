-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: Identity and Default Values
-- Objective: Inspect automatic column generation.
-- ============================================================

SELECT
    table_name,
    column_name,
    data_type,
    is_nullable,
    column_default,
    is_identity,
    identity_generation,
    identity_start,
    identity_increment
FROM information_schema.columns
WHERE table_schema = 'public'
    AND (
        is_identity = 'YES'
        OR column_default IS NOT NULL
    )
ORDER BY
    table_name,
    ordinal_position;