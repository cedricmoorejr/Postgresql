-- Procedure: Place Order
-- Description: Allows a user to place an order for a specific smartwatch.
-- Parameters:
--    user_id - The ID of the user
--    watch_id - The ID of the smartwatch to order
--    quantity - The quantity of the smartwatch to order
CREATE OR REPLACE PROCEDURE place_order(user_id INT, watch_id INT, quantity INT)
AS $$
BEGIN
    -- Insert the order into the orders table
    INSERT INTO orders (user_id, watch_id, quantity)
    VALUES (user_id, watch_id, quantity);
    
    -- Reduce the stock quantity of the smartwatch
    UPDATE smartwatches
    SET stock = stock - quantity
    WHERE id = watch_id;
END;
$$ LANGUAGE plpgsql;
