-- Index on the `users` table to speed up searches by email
CREATE INDEX idx_users_email ON users (email);

-- Index on the `smartwatches` table to improve filtering by price
CREATE INDEX idx_smartwatches_price ON smartwatches (price);

-- Index on the `orders` table to optimize join operations
CREATE INDEX idx_orders_user_id ON orders (user_id);
CREATE INDEX idx_orders_watch_id ON orders (watch_id);

-- Index on the `reviews` table to enhance search performance by user and watch
CREATE INDEX idx_reviews_user_id ON reviews (user_id);
CREATE INDEX idx_reviews_watch_id ON reviews (watch_id);

-- Index on the `categories` table for efficient lookups by name
CREATE INDEX idx_categories_name ON categories (name);

-- Index on the `wishlist` table to speed up queries by user
CREATE INDEX idx_wishlist_user_id ON wishlist (user_id);

-- Index on the `cart_items` table to improve join and filtering operations
CREATE INDEX idx_cart_items_cart_id ON cart_items (cart_id);
CREATE INDEX idx_cart_items_watch_id ON cart_items (watch_id);

-- Index on the `payments` table for efficient searches by user
CREATE INDEX idx_payments_user_id ON payments (user_id);

-- Index on the `promotions` table to optimize queries by start and end dates
CREATE INDEX idx_promotions_start_date ON promotions (start_date);
CREATE INDEX idx_promotions_end_date ON promotions (end_date);
