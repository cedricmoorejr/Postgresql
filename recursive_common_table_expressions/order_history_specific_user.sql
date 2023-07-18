-- Recursive CTE to retrieve the complete order history of a specific user, including their own orders and orders placed by users they referred:
WITH RECURSIVE user_order_history AS (
    SELECT user_id, id, order_date
    FROM orders
    WHERE user_id = 1 -- Replace 1 with the desired user ID
    UNION ALL
    SELECT o.user_id, o.id, o.order_date
    FROM orders o
    JOIN user_order_history uoh ON o.user_id = uoh.id
)
SELECT user_id, id, order_date
FROM user_order_history;

