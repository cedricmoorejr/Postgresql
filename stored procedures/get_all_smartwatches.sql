-- Procedure: Get All Smartwatches
-- Description: Retrieves all the smartwatches from the smartwatches table.
CREATE OR REPLACE PROCEDURE get_all_smartwatches()
AS $$
BEGIN
    -- Select all smartwatches
    SELECT * FROM smartwatches;
END;
$$ LANGUAGE plpgsql;
