--�� ������� �� ���� �������� ������� ����
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

--���� �� ������� �� ���� �������� ����� ������� ���� ���� ����� ��� �� ����� ������� ���� ��� ��
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

--����� ���� ������� ��� ����� ����� �����
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
