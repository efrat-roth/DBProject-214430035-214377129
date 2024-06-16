--Find the donors that don't have a donation in the last five years and change
-- them isActice field to no
UPDATE Donor
SET isActive = 'n'
WHERE DonorID IN (
    SELECT d.DonorID
    FROM Donor d
    LEFT JOIN Donation do ON d.DonorID = do.DonorID AND do.DonationDate >= ADD_MONTHS(SYSDATE, -60)
    GROUP BY d.DonorID
    HAVING COUNT(do.DonationID) = 0
);

