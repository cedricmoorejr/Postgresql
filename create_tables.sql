-- Create the "users" table to store customer information
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Create the "smartwatches" table to store smart watch details
CREATE TABLE smartwatches (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    price DECIMAL(8, 2) NOT NULL,
    stock INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Create the "orders" table to store customer orders
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    watch_id INT REFERENCES smartwatches(id),
    quantity INT NOT NULL,
    order_date TIMESTAMP DEFAULT NOW()
);

-- Create the "reviews" table to store customer reviews for smartwatches
CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    watch_id INT REFERENCES smartwatches(id),
    rating INT NOT NULL,
    comment TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Create the "categories" table to store different categories of smartwatches
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Create the "watch_categories" table to associate smartwatches with categories
CREATE TABLE watch_categories (
    watch_id INT REFERENCES smartwatches(id),
    category_id INT REFERENCES categories(id),
    PRIMARY KEY (watch_id, category_id)
);

-- Create the "wishlist" table to store customer's wishlist
CREATE TABLE wishlist (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    watch_id INT REFERENCES smartwatches(id),
    created_at TIMESTAMP DEFAULT NOW()
);

-- Create the "cart" table to store customer's shopping cart
CREATE TABLE cart (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    created_at TIMESTAMP DEFAULT NOW()
);

-- Create the "cart_items" table to store items in the shopping cart
CREATE TABLE cart_items (
    id SERIAL PRIMARY KEY,
    cart_id INT REFERENCES cart(id),
    watch_id INT REFERENCES smartwatches(id),
    quantity INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Create the "payments" table to store customer payments
CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    amount DECIMAL(8, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT NOW()
);

-- Create the "promotions" table to store promotional offers
CREATE TABLE promotions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    discount DECIMAL(5, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Create the "promotions_smartwatches" table to associate smartwatches with promotions
CREATE TABLE promotions_smartwatches (
    promotion_id INT REFERENCES promotions(id),
    watch_id INT REFERENCES smartwatches(id),
    PRIMARY KEY (promotion_id, watch_id)
);
