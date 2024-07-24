-- Main program for: Procedure to calculate and update location capacity and then distribute items.
CREATE OR REPLACE PROCEDURE Main_distribution
IS
--DECLARE
    v_total_quantity NUMBER;

BEGIN
    -- Call the procedure to calculate and update location capacity
    update_location_capacity();

    DBMS_OUTPUT.PUT_LINE('Location capacity updated successfully.');

    -- Call the procedure to distribute items based on updated capacity
    distribute_items();

    DBMS_OUTPUT.PUT_LINE('Items distributed successfully.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
