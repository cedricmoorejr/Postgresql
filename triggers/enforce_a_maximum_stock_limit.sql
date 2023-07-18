-- Trigger to enforce a maximum stock limit for smartwatches:
CREATE OR REPLACE FUNCTION enforce_stock_limit()
    RETURNS TRIGGER AS $$
BEGIN
    IF NEW.stock > 100 THEN
        RAISE EXCEPTION 'Stock limit exceeded. Maximum stock limit is 100.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create the trigger
CREATE TRIGGER before_smartwatch_update
BEFORE INSERT OR UPDATE ON smartwatches
FOR EACH ROW
EXECUTE FUNCTION enforce_stock_limit();
