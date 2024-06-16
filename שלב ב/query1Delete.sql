--Delete Donors with No Donations in the Last Five Years and No Linked Items
DELETE FROM Donor
WHERE DonorID IN (
    SELECT d.DonorID
    FROM Donor d
    LEFT JOIN Donation do ON d.DonorID = do.DonorID AND do.DonationDate >= ADD_MONTHS(SYSDATE, -60)
    LEFT JOIN Item i ON i.ItemID = do.ItemID
    GROUP BY d.DonorID
    HAVING COUNT(do.DonationID) = 0 AND COUNT(i.ItemID) = 0
);
