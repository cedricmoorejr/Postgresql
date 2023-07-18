-- Create a function to retrieve the average rating of a smartwatch
CREATE OR REPLACE FUNCTION get_average_rating(watch_id INT)
RETURNS DECIMAL(3, 2) AS $$
DECLARE
    average_rating DECIMAL(3, 2);
BEGIN
    SELECT AVG(rating)
    INTO average_rating
    FROM reviews
    WHERE watch_id = watch_id;

    RETURN average_rating;
END;
$$ LANGUAGE plpgsql;
