--����� ����� �� ������ �� ��� ����� ����� (��� 5) ����� ������ �������

UPDATE Item
SET Quantity = Quantity * 2
WHERE ItemID IN (SELECT ItemID FROM (SELECT i.ItemID
                                     FROM Item i
                                     JOIN Category c ON i.CategoryID = c.CategoryID
                                     WHERE c.EmergencyLevel >= 5 and quantity<100));
