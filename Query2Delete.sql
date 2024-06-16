--Delete Locations That Have No Items and No Donations in the Last Two Years
DELETE FROM Location
WHERE phoneNumber IN (
    SELECT l.phoneNumber
    FROM Location l
    LEFT JOIN Item i ON l.phoneNumber = i.phoneNumber
    LEFT JOIN Donation d ON i.itemID = d.itemID AND d.DonationDate >= ADD_MONTHS(SYSDATE, -24)
    GROUP BY l.phoneNumber
    HAVING COUNT(i.ItemID) = 0 AND COUNT(d.DonationID) = 0
);
