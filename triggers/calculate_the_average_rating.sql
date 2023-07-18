-- Trigger to calculate the average rating and update the rating in the "smartwatches" table after a new review is added:
CREATE OR REPLACE FUNCTION update_average_rating()
    RETURNS TRIGGER AS $$
BEGIN
    UPDATE smartwatches
    SET rating = (SELECT AVG(rating) FROM reviews WHERE watch_id = NEW.watch_id)
    WHERE id = NEW.watch_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create the trigger
CREATE TRIGGER after_review_added
AFTER INSERT ON reviews
FOR EACH ROW
EXECUTE FUNCTION update_average_rating();
