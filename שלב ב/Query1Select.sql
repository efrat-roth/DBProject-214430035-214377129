-- List items that have never been operated on, along with their category
-- and location details in order to operate them
SELECT 
  i.ItemID, 
  i.Name AS ItemName, 
  c.Name AS CategoryName, 
  l.Address AS LocationAddress
FROM 
  Item i
  JOIN Category c ON i.CategoryID = c.CategoryID
  JOIN Location l ON i.phoneNumber = l.phoneNumber
WHERE 
  i.ItemID NOT IN (
    SELECT DISTINCT ItemID 
    FROM Operation
  )
ORDER BY 
  i.Name;
