--Helping procedure
--This procedure calculate the capacity of a location by the items that belongs to this location
CREATE OR REPLACE PROCEDURE update_location_capacity
IS
    -- Cursor to select all locations
    CURSOR location_cursor IS
        SELECT phoneNumber
        FROM Location;

    -- Variable to store total quantity of items for a location
    v_total_quantity INT;

BEGIN
    -- Loop through each location
    FOR loc_rec IN location_cursor LOOP
        -- Calculate total quantity of items for the current location
        SELECT NVL(SUM(Quantity), 0)
        INTO v_total_quantity
        FROM Item
        WHERE phoneNumber = loc_rec.phoneNumber;

        -- Update the Capacity field in the Location table
        UPDATE Location
        SET Capacity = v_total_quantity
        WHERE phoneNumber = loc_rec.phoneNumber;

        -- Output the result
        --DBMS_OUTPUT.PUT_LINE('Location Phone Number: ' || loc_rec.phoneNumber);
        --DBMS_OUTPUT.PUT_LINE( ' - Total Items: ' || v_total_quantity);
    END LOOP;
    -- Commit the transaction
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
        ROLLBACK;
END;
