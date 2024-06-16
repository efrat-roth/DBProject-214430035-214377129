--Find Donations by Donor Name and Date Range

SELECT 
  d.DonorID, 
  d.Name AS DonorName, 
  dn.DonationID, 
  dn.DonationDate
FROM 
  Donor d
  JOIN Donation dn ON d.DonorID = dn.DonorID
WHERE 
  d.Name = 'MekhiCobbs'
  AND dn.DonationDate BETWEEN TO_DATE('2021-05-02', 'YYYY-MM-DD') AND TO_DATE('2021-06-02', 'YYYY-MM-DD')
ORDER BY 
  dn.DonationDate;
