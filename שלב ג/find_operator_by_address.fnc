--Find Operator for New Event by Address
CREATE OR REPLACE FUNCTION find_operator_by_address(p_address IN VARCHAR2)
RETURN NUMBER
IS
    v_operator_id NUMBER;
    v_max_expiration_date DATE := TO_DATE('1900-01-01', 'YYYY-MM-DD');
    v_temp_operator_id NUMBER;
    v_temp_expiration_date DATE;

    CURSOR operators_cursor IS
        SELECT o.OperatorID, o.ExpirationDate
        FROM Operator o
        JOIN Location l ON o.phoneNumber = l.phoneNumber
        WHERE l.Address = p_address;
BEGIN
    -- Open the cursor to find the operator with the farthest expiration date
    OPEN operators_cursor;

    LOOP
        FETCH operators_cursor INTO v_temp_operator_id, v_temp_expiration_date;
        EXIT WHEN operators_cursor%NOTFOUND;

        IF v_temp_expiration_date > v_max_expiration_date THEN
            v_max_expiration_date := v_temp_expiration_date;
            v_operator_id := v_temp_operator_id;
        END IF;
    END LOOP;

    CLOSE operators_cursor;

    RETURN v_operator_id;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        RETURN NULL;
END find_operator_by_address;
/
/
