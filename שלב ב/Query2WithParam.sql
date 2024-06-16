--select Old Operators by expirationDate
select operatorid, name, expirationDate FROM Operator o
WHERE 
  o.expirationDate<=ADD_MONTHS(SYSDATE, -2)
