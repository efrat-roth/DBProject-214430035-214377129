--Main program for the procedure-Add New Maintenance Record for Donor's Items
DECLARE
    v_donor_id NUMBER;
    v_maintenance_date DATE;
BEGIN
    -- Assume that v_donor_id is provided or calculated from some other logic
    v_donor_id := 1; 
    -- Set the maintenance date to today's date
    v_maintenance_date := SYSDATE;
    -- Call the procedure to add new maintenance records for the donor's items
    add_maintenance_for_donor_items(v_donor_id,v_Maintenance_Date);

    DBMS_OUTPUT.PUT_LINE('New maintenance records added successfully for donor ID: ' || v_donor_id);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
/
