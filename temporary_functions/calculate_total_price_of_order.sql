-- Create a function to calculate the total price of an order
CREATE OR REPLACE FUNCTION calculate_order_total(order_id INT)
RETURNS DECIMAL(8, 2) AS $$
DECLARE
    total DECIMAL(8, 2);
BEGIN
    SELECT SUM(s.price * o.quantity)
    INTO total
    FROM orders o
    INNER JOIN smartwatches s ON o.watch_id = s.id
    WHERE o.id = order_id;

    RETURN total;
END;
$$ LANGUAGE plpgsql;

