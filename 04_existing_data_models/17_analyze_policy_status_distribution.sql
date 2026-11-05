-- ============================================================
-- Module: 04 - Understanding Existing Data Models
-- Lesson: Policy Status Distribution
-- Objective: Analyze the distribution of policy statuses.
-- ============================================================

SELECT
    status,
    COUNT(*) AS policy_count,
    ROUND(
        100.0 * COUNT(*) /
        NULLIF(SUM(COUNT(*)) OVER (), 0),
        2
    ) AS percentage_of_policies
FROM public.policies
GROUP BY status
ORDER BY
    policy_count DESC,
    status;