-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: Policy Data Quality Profiling
-- Objective: Identify missing and potentially invalid values.
-- ============================================================

SELECT
    COUNT(*) AS total_policies,

    COUNT(*) FILTER (
        WHERE policy_number IS NULL
    ) AS missing_policy_numbers,

    COUNT(*) FILTER (
        WHERE customer_id IS NULL
    ) AS missing_customer_ids,

    COUNT(*) FILTER (
        WHERE policy_type IS NULL
    ) AS missing_policy_types,

    COUNT(*) FILTER (
        WHERE status IS NULL
    ) AS missing_statuses,

    COUNT(*) FILTER (
        WHERE annual_premium IS NULL
    ) AS missing_premiums,

    COUNT(*) FILTER (
        WHERE insured_amount IS NULL
    ) AS missing_insured_amounts,

    COUNT(*) FILTER (
        WHERE start_date IS NULL
    ) AS missing_start_dates,

    COUNT(*) FILTER (
        WHERE end_date IS NULL
    ) AS missing_end_dates,

    COUNT(*) FILTER (
        WHERE annual_premium < 0
    ) AS negative_premiums,

    COUNT(*) FILTER (
        WHERE insured_amount <= 0
    ) AS nonpositive_insured_amounts,

    COUNT(*) FILTER (
        WHERE end_date < start_date
    ) AS invalid_policy_date_ranges

FROM public.policies;