-- Lesson: Recursive CTE
-- Business question: How can we generate a monthly calendar
-- covering the policy start-date period?

WITH RECURSIVE monthly_calendar AS (
    SELECT
        DATE_TRUNC('month', MIN(start_date))::DATE AS month_start
    FROM public.policies

    UNION ALL

    SELECT
        (month_start + INTERVAL '1 month')::DATE
    FROM monthly_calendar
    WHERE month_start < (
        SELECT DATE_TRUNC('month', MAX(start_date))::DATE
        FROM public.policies
    )
)
SELECT
    mc.month_start,
    COUNT(p.policy_id) AS policies_started
FROM monthly_calendar AS mc
LEFT JOIN public.policies AS p
    ON DATE_TRUNC('month', p.start_date)::DATE = mc.month_start
GROUP BY mc.month_start
ORDER BY mc.month_start;