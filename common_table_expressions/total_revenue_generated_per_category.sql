-- CTE to calculate the total revenue generated from each category
, category_revenue AS (
    SELECT
        c.name AS category_name,
        SUM(s.price * o.quantity) AS total_revenue
    FROM
        categories c
    JOIN
        watch_categories wc ON c.id = wc.category_id
    JOIN
        smartwatches s ON wc.watch_id = s.id
    JOIN
        orders o ON s.id = o.watch_id
    GROUP BY
        c.name
)


-- Retrieving information using the CTEs
SELECT
    cr.category_name,
    cr.total_revenue
FROM
    category_revenue cr;
