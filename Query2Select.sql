--Find all items that need maintenance, 
--grouped by their status, and list the latest maintenance date for each item
SELECT 
  i.ItemID, 
  i.Name AS ItemName, 
  i.Status, 
  (
    SELECT 
      MAX(m.MaintenanceDate)
    FROM 
      Maintenance m
    WHERE 
      m.ItemID = i.ItemID
  ) AS LastMaintenanceDate
FROM 
  Item i
WHERE 
  i.Status IN (
    SELECT DISTINCT Status 
    FROM Item 
    WHERE Quantity < 10
  )
ORDER BY 
  LastMaintenanceDate DESC;
