-- Insert data into Category table
INSERT INTO Category (CategoryID, Name, EmergencyLevel) VALUES (1, 'heart', 5);
INSERT INTO Category (CategoryID, Name, EmergencyLevel) VALUES (2, 'general', 3);

-- Insert data into Operator table
INSERT INTO Operator (OperatorID, Name, ExpirationDate) VALUES (1, 'John Doe', TO_DATE('2025-12-31', 'YYYY-MM-DD'));
INSERT INTO Operator (OperatorID, Name, ExpirationDate) VALUES (2, 'Jane Smith', TO_DATE('2024-06-30', 'YYYY-MM-DD'));

-- Insert data into Donor table
INSERT INTO Donor (DonorID, Name, isActive, Designation) VALUES (1, 'ACME Corp', 'Y', 'For the memory of Moshe');
INSERT INTO Donor (DonorID, Name, isActive, Designation) VALUES (2, 'Global Fund', 'N', 'For the memory of Yehuda and Rachel levi);

-- Insert data into Location table
INSERT INTO Location (PhoneNumber, Address, Instructions) VALUES (1234567890, '123 Main St', 'ID is required');
INSERT INTO Location (PhoneNumber, Address, Instructions) VALUES (9876543210, '456 Elm St', 'Only with certificate');

-- Insert data into Item table
INSERT INTO Item (ItemID, Name, Description, Quantity, Status, CategoryID, PhoneNumber) VALUES (1, 'Bandages', 'Sterile bandages', 100, 1, 2, 1234567890);
INSERT INTO Item (ItemID, Name, Description, Quantity, Status, CategoryID, PhoneNumber) VALUES (2, 'Defibrillator', 'For heart attack', 200, 1, 1, 9876543210);

-- Insert data into Maintenance table
INSERT INTO Maintenance (MaintenanceID, MaintenanceDate, Description, ItemID) VALUES (1, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'Checked expiry date', 1);
INSERT INTO Maintenance (MaintenanceID, MaintenanceDate, Description, ItemID) VALUES (2, TO_DATE('2023-02-20', 'YYYY-MM-DD'), 'clean', 2);

-- Insert data into Operation table
INSERT INTO Operation (ItemID, OperatorID) VALUES (1, 1);
INSERT INTO Operation (ItemID, OperatorID) VALUES (2, 2);

-- Insert data into Donation table
INSERT INTO Donation (DonationID, DonationDate, ItemID, DonorID) VALUES (1, TO_DATE('2023-03-10', 'YYYY-MM-DD'), 1, 1);
INSERT INTO Donation (DonationID, DonationDate, ItemID, DonorID) VALUES (2, TO_DATE('2023-04-05', 'YYYY-MM-DD'), 2, 2);
