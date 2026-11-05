-- ============================================================
-- Project: Enterprise SQL Analytics Engineering
-- Module: 01 - Database Foundations
-- Lesson: PostgreSQL Data Types
-- Purpose: Explore PostgreSQL data types and their behavior
-- ============================================================

-- EXAMPLE 1: Identify the data types of sample values.

SELECT
    pg_typeof(100) AS integer_type,
    pg_typeof(10000000000::BIGINT) AS bigint_type,
    pg_typeof(1250.75::NUMERIC(12, 2)) AS financial_type,
    pg_typeof('2026-11-05'::DATE) AS date_type,
    pg_typeof(CURRENT_TIMESTAMP) AS timestamp_type,
    pg_typeof(TRUE) AS boolean_type;


-- EXAMPLE 2: Compare exact and approximate decimal values.

SELECT
    0.1::NUMERIC + 0.2::NUMERIC AS exact_result,
    0.1::DOUBLE PRECISION + 0.2::DOUBLE PRECISION
        AS approximate_result;


-- EXAMPLE 3: Examine the actual types of our customer columns.

SELECT
    column_name,
    data_type,
    character_maximum_length,
    numeric_precision,
    numeric_scale,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'customers'
ORDER BY ordinal_position;


-- EXAMPLE 4: Demonstrate financial precision.

SELECT
    1250.75::NUMERIC(12, 2) AS annual_premium,
    350.25::NUMERIC(12, 2) AS claim_amount,
    1250.75::NUMERIC(12, 2)
        - 350.25::NUMERIC(12, 2) AS remaining_amount;