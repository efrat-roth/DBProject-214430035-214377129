-- Find Locations by adress and return amount of items
SELECT 
    l.Address AS LocationAddress,
    COUNT(i.ItemID) AS ItemCount
FROM 
    Location l
LEFT JOIN 
    Item i ON l.phonenumber = i.phonenumber
WHERE 
  l.address = '32 Peter Road'
  AND l.phoneNumber = '999999008'
GROUP BY 
    l.Address
ORDER BY 
    ItemCount DESC;


