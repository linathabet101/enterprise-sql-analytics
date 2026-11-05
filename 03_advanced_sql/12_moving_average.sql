-- Lesson: Moving Average
-- Business question: What is the moving average premium
-- over the current and previous two policies?

SELECT
    policy_number,
    start_date,
    annual_premium,
    ROUND(
        AVG(annual_premium) OVER (
            ORDER BY start_date, policy_id
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS moving_average_premium
FROM public.policies
ORDER BY start_date, policy_id;