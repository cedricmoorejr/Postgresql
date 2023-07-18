-- CTE to retrieve the total number of orders per user
WITH user_order_totals AS (
    SELECT
        user_id,
        COUNT(*) AS total_orders
    FROM
        orders
    GROUP BY
        user_id
)


-- Retrieving information using the CTEs
SELECT
    u.name,
    uo.total_orders
FROM
    users u
JOIN
    user_order_totals uo ON u.id = uo.user_id;


