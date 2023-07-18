-- Procedure: Add Smartwatch to Wishlist
-- Description: Allows a user to add a smartwatch to their wishlist.
-- Parameters:
--    user_id - The ID of the user
--    watch_id - The ID of the smartwatch to add
CREATE OR REPLACE PROCEDURE add_to_wishlist(user_id INT, watch_id INT)
AS $$
BEGIN
    -- Insert the smartwatch into the user's wishlist
    INSERT INTO wishlist (user_id, watch_id)
    VALUES (user_id, watch_id);
END;
$$ LANGUAGE plpgsql;
