-- CTE to calculate the average rating for each smartwatch
, smartwatch_avg_ratings AS (
    SELECT
        watch_id,
        AVG(rating) AS average_rating
    FROM
        reviews
    GROUP BY
        watch_id
)



-- Retrieving information using the CTEs
SELECT
    s.name,
    s.avg_rating
FROM
    smartwatches s
JOIN
    smartwatch_avg_ratings srr ON s.id = srr.watch_id;
