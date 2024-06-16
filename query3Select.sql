--Find Items that Have Never Been Donated and Their Associated Details
-- This can help the organization determine 
--which items are not being utilized through donations and possibly reallocate them.

SELECT 
  i.ItemID, 
  i.Name AS ItemName, 
  c.Name AS CategoryName, 
  l.Address AS LocationAddress
FROM 
  Item i
JOIN 
  Category c ON i.CategoryID = c.CategoryID
JOIN 
  Location l ON i.phoneNumber = l.phoneNumber
WHERE 
  i.ItemID NOT IN (
    SELECT DISTINCT d.ItemID 
    FROM Donation d
  )
ORDER BY 
  c.Name, 
  i.Name;
