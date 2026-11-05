-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: Identity Columns and Sequences
-- File: 29_inspect_identity_columns.sql
--
-- Purpose:
-- Inspect automatically generated identity columns.
-- ============================================================

SELECT
    table_name,
    column_name,
    data_type,
    is_identity,
    identity_generation,
    identity_start,
    identity_increment,
    pg_get_serial_sequence(
        FORMAT('%I.%I', table_schema, table_name),
        column_name
    ) AS associated_sequence
FROM information_schema.columns
WHERE table_schema = 'public'
  AND is_identity = 'YES'
ORDER BY table_name, ordinal_position;