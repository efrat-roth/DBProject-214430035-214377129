--Distribute Donated Items to Locations
--This procedure distributes items to different locations based on their quantity and location capacity.
CREATE OR REPLACE PROCEDURE distribute_items 
IS
    CURSOR item_cursor IS 
        SELECT ItemID, Quantity 
        FROM Item
        WHERE Quantity > 0;
        
    CURSOR location_cursor IS 
        SELECT phoneNumber, Capacity 
        FROM Location
        ORDER BY Capacity DESC;
        
    TYPE location_tab IS TABLE OF Location%ROWTYPE;
    location_data location_tab;
BEGIN
    OPEN location_cursor;
    FETCH location_cursor BULK COLLECT INTO location_data;
    CLOSE location_cursor;
    
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
                    
                    INSERT INTO Distribution (ItemID, phoneNumber, Quantity) 
                    VALUES (item_record.ItemID, location_data(i).phoneNumber, distribute_qty);
                    
                    UPDATE Location
                    SET Capacity = Capacity - distribute_qty 
                    WHERE phoneNumber = location_data(i).phoneNumber;
                    
                    item_record.Quantity := item_record.Quantity - distribute_qty;
                EXCEPTION
                    WHEN OTHERS THEN
                        DBMS_OUTPUT.PUT_LINE('Error distributing item ID ' || item_record.ItemID || ': ' || SQLERRM);
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
