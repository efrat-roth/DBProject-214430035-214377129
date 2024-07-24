CREATE OR REPLACE PROCEDURE distribute_items
IS
    CURSOR item_cursor IS 
        SELECT ItemID, Quantity 
        FROM Item
        WHERE Quantity > 0;
        
    TYPE location_rec IS RECORD (
        phoneNumber Location.phoneNumber%TYPE,
        Capacity Location.Capacity%TYPE
    );
    TYPE location_tab IS TABLE OF location_rec;
    location_data location_tab;
BEGIN
    update item 
    set quantity=itemID
    where itemID>300;
    -- Fetch location data into the PL/SQL table
    SELECT phoneNumber, Capacity
    BULK COLLECT INTO location_data
    FROM Location
    WHERE Capacity > 0;
    
    FOR item_record IN item_cursor LOOP
        FOR i IN 1..location_data.COUNT LOOP
            IF item_record.Quantity > 0 AND location_data(i).Capacity > 0 THEN
                DECLARE
                    distribute_qty INT;
                BEGIN
                    distribute_qty := LEAST(item_record.Quantity, location_data(i).Capacity);
                    
                    UPDATE Item
                    SET Quantity = Quantity - distribute_qty 
                    WHERE ItemID = item_record.ItemID;
                    
                    UPDATE Location
                    SET Capacity = Capacity - distribute_qty 
                    WHERE phoneNumber = location_data(i).phoneNumber;
                    
                    -- Update the PL/SQL table to reflect the change in capacity
                    location_data(i).Capacity := location_data(i).Capacity - distribute_qty;
                    
                    -- Update the item_record quantity
                    item_record.Quantity := item_record.Quantity - distribute_qty;
                EXCEPTION
                    WHEN OTHERS THEN
                        DBMS_OUTPUT.PUT_LINE('Error distributing item ID ' || item_record.ItemID || ' to location ' || location_data(i).phoneNumber || ': ' || SQLERRM);
                END;
            END IF;
        END LOOP;
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred during distribution: ' || SQLERRM);
        ROLLBACK;
END;
/
