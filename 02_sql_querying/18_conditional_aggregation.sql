-- Lesson: Conditional Aggregation
-- Business question: How many policies are active, expired,
-- or cancelled, and what are their premium totals?

SELECT
    COUNT(*) AS total_policies,

    COUNT(
        CASE WHEN status = 'ACTIVE' THEN 1 END
    ) AS active_policies,

    COUNT(
        CASE WHEN status = 'EXPIRED' THEN 1 END
    ) AS expired_policies,

    COUNT(
        CASE WHEN status = 'CANCELLED' THEN 1 END
    ) AS cancelled_policies,

    SUM(
        CASE
            WHEN status = 'ACTIVE' THEN annual_premium
            ELSE 0
        END
    ) AS active_annual_premium

FROM public.policies;