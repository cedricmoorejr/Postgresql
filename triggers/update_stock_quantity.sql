-- Trigger to update stock quantity in "smartwatches" table after an order is placed:
CREATE OR REPLACE FUNCTION update_stock_quantity()
    RETURNS TRIGGER AS $$
BEGIN
    UPDATE smartwatches
    SET stock = stock - NEW.quantity
    WHERE id = NEW.watch_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create the trigger
CREATE TRIGGER after_order_placed
AFTER INSERT ON orders
FOR EACH ROW
EXECUTE FUNCTION update_stock_quantity();
