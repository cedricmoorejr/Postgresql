-- Script: Advanced Date and Time Operations for "Flappy" Database
-- Description: This script contains various examples of advanced date and time operations
--              that can be performed on the "Flappy" database.



-- Retrieve orders placed in the last 7 days
SELECT *
FROM orders
WHERE order_date >= NOW() - INTERVAL '7 days';

-- Calculate the total sales for each day of the week
SELECT
    EXTRACT(DOW FROM order_date) AS day_of_week,
    SUM(quantity * price) AS total_sales
FROM orders
JOIN smartwatches ON orders.watch_id = smartwatches.id
GROUP BY day_of_week
ORDER BY day_of_week;

-- Find the average time taken between placing an order and payment
SELECT AVG(payment_date - order_date) AS average_processing_time
FROM orders
JOIN payments ON orders.user_id = payments.user_id
WHERE payment_date > order_date;

-- Identify the top-selling smartwatch of the month
SELECT
    watch_id,
    SUM(quantity) AS total_sold
FROM orders
WHERE EXTRACT(MONTH FROM order_date) = EXTRACT(MONTH FROM NOW())
GROUP BY watch_id
ORDER BY total_sold DESC
LIMIT 1;

-- Calculate the number of days since the last review for each smartwatch
SELECT
    smartwatches.id,
    smartwatches.name,
    MAX(reviews.created_at) AS last_review_date,
    CURRENT_DATE - MAX(reviews.created_at) AS days_since_last_review
FROM smartwatches
LEFT JOIN reviews ON smartwatches.id = reviews.watch_id
GROUP BY smartwatches.id
ORDER BY days_since_last_review;

-- Calculate the average time between consecutive orders for each user
SELECT
    user_id,
    AVG(order_date - LAG(order_date) OVER (PARTITION BY user_id ORDER BY order_date)) AS avg_time_between_orders
FROM orders
GROUP BY user_id;

-- Determine the month with the highest number of orders
SELECT
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(*) AS order_count
FROM orders
GROUP BY month
ORDER BY order_count DESC
LIMIT 1;

-- Find the users who registered and placed their first order on the same day
SELECT u.*
FROM users u
JOIN (
    SELECT user_id, MIN(order_date) AS first_order_date
    FROM orders
    GROUP BY user_id
) o ON u.id = o.user_id
WHERE u.created_at::DATE = o.first_order_date::DATE;

-- Calculate the average order quantity for each hour of the day
SELECT
    EXTRACT(HOUR FROM order_date) AS hour_of_day,
    AVG(quantity) AS avg_order_quantity
FROM orders
GROUP BY hour_of_day
ORDER BY hour_of_day;

-- Determine the users who have placed orders in three consecutive months
SELECT user_id
FROM (
    SELECT
        user_id,
        EXTRACT(MONTH FROM order_date) AS month,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY EXTRACT(MONTH FROM order_date)) AS rn
    FROM orders
) sub
GROUP BY user_id
HAVING MAX(rn) >= 3 AND MAX(month) - MIN(month) = MAX(rn) - 1;
