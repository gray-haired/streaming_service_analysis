WITH UserActivity AS (
    SELECT
        user_id,
        DATE_TRUNC('month', registration_date) AS cohort_month,
        DATE_TRUNC('month', event_date) AS event_month
    FROM
        users u
    JOIN
        events e ON u.user_id = e.user_id
),
MonthlyActiveUsers AS (
    SELECT
        cohort_month,
        event_month,
        COUNT(DISTINCT user_id) AS active_users
    FROM
        UserActivity
    GROUP BY
        cohort_month,
        event_month
)
SELECT
    mau.cohort_month,
    (EXTRACT(YEAR FROM mau.event_month) - EXTRACT(YEAR FROM mau.cohort_month)) * 12 +
    (EXTRACT(MONTH FROM mau.event_month) - EXTRACT(MONTH FROM mau.cohort_month)) AS cohort_period,
    mau.active_users
FROM
    MonthlyActiveUsers mau
ORDER BY
    mau.cohort_month, cohort_period;

