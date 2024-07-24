CREATE OR REPLACE PROCEDURE Main_fund_operator
IS
--DECLARE
    v_address VARCHAR2(255) := '36 Josh Ave';
    v_item_id NUMBER := 218; -- This should be the ID of the item associated with the new operation
    v_operator_id NUMBER;
BEGIN
    -- Call the function to find the operator by address
    v_operator_id := find_operator_by_address(v_address);
    
    IF v_operator_id IS NOT NULL THEN
        -- Call the procedure to add a new operation
        add_operation(p_operator_id => v_operator_id, p_item_id => v_item_id);
        DBMS_OUTPUT.PUT_LINE('Operation added successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No suitable operator found for the given address.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
