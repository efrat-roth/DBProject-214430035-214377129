-- Find items with the most maintenance records in the last year
-- including their category name and location address
-- This can help identify items that require frequent maintenance.
SELECT 
  i.ItemID, 
  i.Name AS ItemName, 
  c.Name AS CategoryName, 
  l.Address AS LocationAddress,
  COUNT(m.MaintenanceID) AS MaintenanceCount
FROM 
  Item i
JOIN 
  Category c ON i.CategoryID = c.CategoryID
JOIN 
  Location l ON i.phoneNumber = l.phoneNumber
JOIN 
  Maintenance m ON i.ItemID = m.ItemID
WHERE 
  m.MaintenanceDate >= ADD_MONTHS(SYSDATE, -12)
GROUP BY 
  i.ItemID, 
  i.Name, 
  c.Name, 
  l.Address
HAVING 
  COUNT(m.MaintenanceID) > 0
ORDER BY 
  MaintenanceCount DESC;
