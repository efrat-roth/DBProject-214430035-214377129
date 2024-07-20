--Add New Maintenance Record for Donor's Items
CREATE OR REPLACE PROCEDURE add_new_maintenance_for_donor(donor_id IN NUMBER, maintenance_date IN DATE)

IS

    -- Declare a cursor to select all items donated by the given donor
    CURSOR item_cursor IS
        SELECT i.ItemID
        FROM Donation d
        JOIN Item i ON d.ItemID = i.ItemID
        WHERE d.DonorID = donor_id;
     id number;
    -- Variable to store the current item ID from the cursor
    v_item_id Item.ItemID%TYPE;
BEGIN
    -- Open the cursor
    OPEN item_cursor;

    -- Loop through each item donated by the donor
    LOOP
        FETCH item_cursor INTO v_item_id;
        EXIT WHEN item_cursor%NOTFOUND;
        select max(MAINTENANCEId)
        into id
        from maintenance;
        id:=id+1;
        
        -- Insert a new maintenance record for the current item
        INSERT INTO Maintenance (maintenanceID,ItemID, MaintenanceDate,Description)
        VALUES (id,v_item_id, maintenance_date,'donor asked');
    END LOOP;

    -- Close the cursor
    CLOSE item_cursor;

    -- Commit the transaction
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('New maintenance records added successfully for donor ID ' || donor_id);
EXCEPTION
    WHEN OTHERS THEN
        -- Handle any other exceptions that may occur
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        ROLLBACK;
END;
