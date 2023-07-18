-- Procedure: Get User's Wishlist
-- Description: Retrieves the wishlist of a specific user based on their user_id.
-- Parameters:
--    user_id - The ID of the user
CREATE OR REPLACE PROCEDURE get_user_wishlist(user_id INT)
AS $$
BEGIN
    -- Select smartwatches from the user's wishlist
    SELECT s.* FROM smartwatches s
    INNER JOIN wishlist w ON w.watch_id = s.id
    WHERE w.user_id = user_id;
END;
$$ LANGUAGE plpgsql;
