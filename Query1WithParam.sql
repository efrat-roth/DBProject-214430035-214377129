--List all items along with their category name and location address, 
--ordered by category emergency level and then by item name 
--to find the items with high emergency level and quantiy less than 50
--for next level in order to order new items)
SELECT 
  ItemID,
  ItemName,
  CategoryName,
  EmergencyLevel,
  Quantity,
  LocationAddress
FROM (
   SELECT 
    i.ItemID,
    i.Name AS ItemName,
    c.Name AS CategoryName,
    c.EmergencyLevel,
    i.Quantity,
    l.Address AS LocationAddress
  FROM 
    Item i
    JOIN Category c ON i.CategoryID = c.CategoryID
    JOIN Location l ON i.phoneNumber = l.phoneNumber
  WHERE 
    c.EmergencyLevel > 7
    AND i.Quantity < 30)  HighEmergencyItems
ORDER BY 
  EmergencyLevel DESC, 
  ItemName;
