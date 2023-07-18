-- Insert sample data into the "users" table
INSERT INTO users (name, email, password)
VALUES
    ('John Doe', 'johndoe@example.com', 'password123'),
    ('Jane Smith', 'janesmith@example.com', 'password456'),
    ('Mike Johnson', 'mikejohnson@example.com', 'password789');


-- Insert sample data into the "smartwatches" table
INSERT INTO smartwatches (name, description, price, stock)
VALUES
    ('Flappy Watch 1', 'A stylish and advanced smartwatch with fitness tracking features.', 199.99, 10),
    ('Flappy Watch 2', 'A premium smartwatch with built-in GPS and heart rate monitor.', 299.99, 5),
    ('Flappy Watch 3', 'An elegant smartwatch with a customizable watch face.', 149.99, 8);


-- Insert sample data into the "orders" table
INSERT INTO orders (user_id, watch_id, quantity)
VALUES
    (1, 1, 2),
    (2, 2, 1),
    (3, 3, 3);


-- Insert sample data into the "reviews" table
INSERT INTO reviews (user_id, watch_id, rating, comment)
VALUES
    (1, 1, 5, 'Great smartwatch, highly recommended.'),
    (2, 2, 4, 'Good features and build quality.'),
    (3, 3, 3, 'Decent smartwatch for the price.');


-- Insert sample data into the "categories" table
INSERT INTO categories (name)
VALUES
    ('Fitness'),
    ('Luxury'),
    ('Health');


-- Insert sample data into the "watch_categories" table
INSERT INTO watch_categories (watch_id, category_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 1);


-- Insert sample data into the "wishlist" table
INSERT INTO wishlist (user_id, watch_id)
VALUES
    (1, 2),
    (1, 3),
    (2, 1);


-- Insert sample data into the "cart" table
INSERT INTO cart (user_id)
VALUES
    (1),
    (2);


-- Insert sample data into the "cart_items" table
INSERT INTO cart_items (cart_id, watch_id, quantity)
VALUES
    (1, 1, 2),
    (1, 3, 1),
    (2, 2, 3);


-- Insert sample data into the "payments" table
INSERT INTO payments (user_id, amount)
VALUES
    (1, 399.98),
    (2, 899.97);


-- Insert sample data into the "promotions" table
INSERT INTO promotions (name, description, start_date, end_date, discount)
VALUES
    ('Summer Sale', 'Enjoy discounts on select smartwatches this summer.', '2023-07-01', '2023-07-31', 0.15),
    ('New Year Special', 'Ring in the new year with special offers on smartwatches.', '2024-01-01', '2024-01-07', 0.2);


-- Insert sample data into the "promotions_smartwatches" table
INSERT INTO promotions_smartwatches (promotion_id, watch_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 3);
