CREATE OR REPLACE PROCEDURE Main_new_maintenance( date_1 IN DATE)
IS
--Main program for the procedure-Add New Maintenance Record for Donor's Items
--DECLARE
    v_donor_id NUMBER;
    v_maintenance_date DATE;
BEGIN
  -- ACCEPT user_name PROMPT 'הכנס את שמך: '
    v_donor_id := 95; 
    -- Set the maintenance date to today's date
    v_maintenance_date := date_1;
    -- Call the procedure to add new maintenance records for the donor's items
    add_new_maintenance_for_donor(v_donor_id,v_Maintenance_Date);

   -- DBMS_OUTPUT.PUT_LINE('New maintenance records added successfully for donor ID: ' || v_donor_id);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
