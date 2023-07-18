# Flappy Database

The Flappy Database is a sample database designed for a fictitious tech company called "Flappy" that specializes in selling smartwatches. It provides a structured and organized way to store and manage customer information, smartwatch details, orders, reviews, categories, promotions, and more.

## Table of Contents

1. [Description](#description)
2. [Tables](#tables)
3. [Database Schema](#database-schema)
4. [Usage](#usage)

## Description

The Flappy Database serves as a backbone for the Flappy tech company, facilitating efficient management of customer data, product details, sales, and promotions. By leveraging this database, the company can effectively track orders, maintain inventory, collect customer reviews, associate smartwatches with categories, manage shopping carts and wishlists, process payments, and administer promotional offers.

With the Flappy Database, the company can enhance customer experiences by providing personalized recommendations based on previous purchases, tracking order history, and enabling customers to express their opinions through reviews. The database also enables Flappy to categorize smartwatches into various categories, making it easier for customers to find products based on their preferences.

Additionally, the database supports essential e-commerce features such as shopping carts and wishlists. Customers can add desired smartwatches to their wishlist for future reference and convenience. They can also create and manage their shopping carts, allowing them to add or remove items while shopping.

To encourage customer engagement and increase sales, Flappy utilizes promotions. The database includes a promotions table where the company can define promotional offers with a name, description, start and end dates, and a discount percentage. The promotions can be associated with specific smartwatches, allowing Flappy to apply discounts on selected products during a specified period.

## Tables

The Flappy Database consists of the following tables:

1. `users`: Stores customer information, including their name, email, password, and account creation date.
2. `smartwatches`: Stores details about the smartwatches available for sale, such as name, description, price, stock quantity, and creation date.
3. `orders`: Stores customer orders, including references to the user, smartwatch, quantity, and order date.
4. `reviews`: Stores customer reviews for smartwatches, including the user who wrote the review, the smartwatch being reviewed, rating, comment, and creation date.
5. `categories`: Stores different categories of smartwatches, such as "Fitness," "Luxury," "Health," etc.
6. `watch_categories`: Associates smartwatches with categories using a many-to-many relationship.
7. `wishlist`: Stores a customer's wishlist, allowing them to save smartwatches for later.
8. `cart`: Stores a customer's shopping cart, allowing them to add and remove items while shopping.
9. `cart_items`: Stores the items in the shopping cart, associating them with the cart and the corresponding smartwatch.
10. `payments`: Stores customer payments, including the user who made the payment, the payment amount, and the payment date.
11. `promotions`: Stores promotional offers, including name, description, start and end dates, and discount percentage.
12. `promotions_smartwatches`: Associates smartwatches with promotions using a many-to-many relationship.

## Database Schema

The Flappy Database is structured as depicted in the database schema diagram, which provides an overview of the relationships and connections between the tables.

1. `users` table:
   - `user_id` (primary key): Unique identifier for each user.
   - `name`: Customer's name.
   - `email`: Customer's email address (unique).
   - `password`: Customer's password.
   - `created_at`: Date and time when the user account was created.

2. `smartwatches` table:
   - `watch_id` (primary key): Unique identifier for each smartwatch.
   - `name`: Name of the smartwatch.
   - `description`: Description of the smartwatch.
   - `price`: Price of the smartwatch.
   - `stock`: Quantity of the smartwatch available in stock.
   - `created_at`: Date and time when the smartwatch was added to the system.

3. `orders` table:
   - `order_id` (primary key): Unique identifier for each order.
   - `user_id` (foreign key): References the user who placed the order.
   - `watch_id` (foreign key): References the smartwatch in the order.
   - `quantity`: Quantity of the smartwatch ordered.
   - `order_date`: Date and time when the order was placed.

4. `reviews` table:
   - `review_id` (primary key): Unique identifier for each review.
   - `user_id` (foreign key): References the user who wrote the review.
   - `watch_id` (foreign key): References the smartwatch being reviewed.
   - `rating`: Rating given by the user (on a scale of 1 to 5).
   - `comment`: Comment provided by the user in the review.
   - `created_at`: Date and time when the review was created.

5. `categories` table:
   - `category_id` (primary key): Unique identifier for each category.
   - `name`: Name of the category.

6. `watch_categories` table:
   - `watch_id` (foreign key): References the smartwatch associated with a category.
   - `category_id` (foreign key): References the category associated with a smartwatch.
   - Primary key: Combination of `watch_id` and `category_id`.

With this schema, you can store and manage customer information, smartwatch details, orders, reviews, and categories. The relationships between the tables allow you to associate users with their orders, smartwatches with their reviews, and smartwatches with their categories.

## Usage

To use the Flappy Database:

1. Create a PostgreSQL database using the provided SQL script: `create_db.sql`.
2. Connect to the created "flappy" database.
3. Run the `create_tables.sql` script included to add tables to the database.
4. Run the `add_sample_data.sql` script to add sample data to the database or add your own.
5. Utilize the scripts in the folders to play around with the data.


