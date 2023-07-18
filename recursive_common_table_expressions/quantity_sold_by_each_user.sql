-- Recursive CTE to calculate the total quantity of smartwatches sold by each user:
WITH RECURSIVE user_sales AS (
    SELECT user_id, SUM(quantity) AS total_sales
    FROM orders
    GROUP BY user_id
    UNION ALL
    SELECT o.user_id, us.total_sales + o.quantity
    FROM orders o
    JOIN user_sales us ON o.user_id = us.user_id
)
SELECT user_id, total_sales
FROM user_sales;


