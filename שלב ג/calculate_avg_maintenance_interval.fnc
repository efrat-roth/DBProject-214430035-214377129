--Calculate Average Maintenance Interval for an Item
--This function calculates the average interval (in days) between maintenance dates for a given item.


CREATE OR REPLACE FUNCTION calculate_avg_maintenance_interval(item_id IN INT) 
RETURN NUMBER 
IS
    TYPE date_tab IS TABLE OF DATE;
    maintenance_dates date_tab;
    avg_interval NUMBER;
BEGIN
    SELECT MaintenanceDate BULK COLLECT INTO maintenance_dates 
    FROM Maintenance 
    WHERE ItemID = item_id 
    ORDER BY MaintenanceDate;
    
    IF maintenance_dates.COUNT < 2 THEN
        RETURN NULL; -- Not enough data to calculate average
    END IF;
    
    avg_interval := 0;
    FOR i IN 2..maintenance_dates.COUNT LOOP
        avg_interval := avg_interval + (maintenance_dates(i) - maintenance_dates(i-1));
    END LOOP;
    
    RETURN avg_interval / (maintenance_dates.COUNT - 1);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    WHEN OTHERS THEN
        RETURN -1;
END;
/
