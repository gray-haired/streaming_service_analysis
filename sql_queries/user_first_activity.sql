SELECT
    u.user_id,
    u.registration_date,
    u.device_type,
    u.country,
    u.age_group,
    MIN(e.event_date) AS first_event_date
FROM
    users u
LEFT JOIN
    events e ON u.user_id = e.user_id
GROUP BY
    u.user_id,
    u.registration_date,
    u.device_type,
    u.country,
    u.age_group;

