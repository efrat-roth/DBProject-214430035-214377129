--כל הפריטים עם שמות המפעילים והפרטים שלהם
CREATE VIEW ItemOperatorV AS
SELECT 
  i.ItemID, 
  i.Name AS ItemName, 
  i.Description AS ItemDescription, 
  i.Quantity, 
  i.Status, 
  o.OperatorID, 
  o.Name AS OperatorName, 
  o.ExpirationDate
FROM 
  Item i
JOIN 
  Operation op ON i.ItemID = op.ItemID
JOIN 
  Operator o ON op.OperatorID = o.OperatorID;

select * from ItemOperatorV;

--הצגת כל הפריטים עם מלאי ומפעילים שתוקף הרישיון שלהם יפוג בחודש הבא או שתוקף הרישיון שלהם כבר פג
SELECT 
  ItemID, 
  ItemName, 
  ItemDescription, 
  Quantity, 
  Status, 
  OperatorID, 
  OperatorName, 
  ExpirationDate
FROM 
  ItemOperatorV
WHERE 
  ExpirationDate BETWEEN SYSDATE AND ADD_MONTHS(SYSDATE, 1)
  OR ExpirationDate < SYSDATE;

--ספירת מספר הפריטים שכל מפעיל אחראי עליהם
SELECT 
  o.OperatorID, 
  o.OperatorName, 
  COUNT(o.ItemID) AS ItemCount
FROM 
  ItemOperatorV o
GROUP BY 
  o.OperatorID, 
  o.OperatorName
ORDER BY 
  ItemCount DESC;
