/*On which day - channel pair did the most events occur.*/
SELECT channel,
    ROUND(AVG(event_count), 2) AS avg_events_per_day
FROM (
        SELECT DATE_TRUNC('day', occurred_at) AS day,
            channel,
            COUNT(*) AS event_count
        FROM web_events
        GROUP BY 1,
            2
        ORDER BY event_count DESC
    ) sub
GROUP BY 1
ORDER BY 2 DESC