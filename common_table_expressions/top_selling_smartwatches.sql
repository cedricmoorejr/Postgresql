-- CTE to retrieve the top-selling smartwatches
, top_selling_smartwatches AS (
    SELECT
        s.id,
        s.name,
        SUM(o.quantity) AS total_sales
    FROM
        smartwatches s
    JOIN
        orders o ON s.id = o.watch_id
    GROUP BY
        s.id,
        s.name
    ORDER BY
        total_sales DESC
    LIMIT 5
)




-- Retrieving information using the CTEs
SELECT
    ts.name,
    ts.total_sales
FROM
    top_selling_smartwatches ts;
