--Add Operation Entity
CREATE OR REPLACE PROCEDURE add_operation(p_operator_id IN NUMBER, p_item_id IN NUMBER)
IS
BEGIN
    INSERT INTO Operation ( ItemID,OperatorID)
    VALUES ( p_item_id,p_operator_id);
    
    COMMIT;
END add_operation;
/
