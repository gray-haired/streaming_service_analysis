SELECT
    user_id,
    SUM(monthly_price) AS total_revenue
FROM
    subscriptions
GROUP BY
    user_id;

