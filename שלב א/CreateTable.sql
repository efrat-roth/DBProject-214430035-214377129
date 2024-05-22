-- Create Category table first as it's referenced by Item
CREATE TABLE Category
(
  CategoryID NUMBER(10) NOT NULL,
  Name VARCHAR2(20) NOT NULL,
  EmergencyLevel NUMBER NOT NULL,
  PRIMARY KEY (CategoryID)
);

-- Create Operator table as it's referenced by Operation
CREATE TABLE Operator
(
  OperatorID NUMBER(10) NOT NULL,
  Name VARCHAR2(20) NOT NULL,
  ExpirationDate DATE NOT NULL,
  PRIMARY KEY (OperatorID)
);

-- Create Donor table as it's referenced by Donation
CREATE TABLE Donor
(
  DonorID NUMBER(10) NOT NULL,
  Name VARCHAR2(20) NOT NULL,
  isActive CHAR(1) NOT NULL,
  Designation VARCHAR2(20),
  PRIMARY KEY (DonorID)
);

-- Create Location table as it's referenced by Item
CREATE TABLE Location
(
  PhoneNumber NUMBER(10) NOT NULL,
  Address VARCHAR2(20) NOT NULL,
  Instructions VARCHAR2(100),
  PRIMARY KEY (PhoneNumber)
);

-- Create Item table which references Category and Location
CREATE TABLE Item
(
  ItemID NUMBER NOT NULL,
  Name VARCHAR2(20) NOT NULL,
  Description VARCHAR2(100),
  Quantity NUMBER NOT NULL,
  Status NUMBER NOT NULL,
  CategoryID NUMBER NOT NULL,
  PhoneNumber NUMBER(10) NOT NULL,
  PRIMARY KEY (ItemID),
  FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
  FOREIGN KEY (PhoneNumber) REFERENCES Location(PhoneNumber)
);

-- Create Maintenance table which references Item
CREATE TABLE Maintenance
(
  MaintenanceID NUMBER(10) NOT NULL,
  MaintenanceDate DATE NOT NULL,
  Description VARCHAR2(100),
  ItemID NUMBER NOT NULL,
  PRIMARY KEY (MaintenanceID),
  FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
);

-- Create Operation table which references Item and Operator
CREATE TABLE Operation
(
  ItemID NUMBER NOT NULL,
  OperatorID NUMBER NOT NULL,
  PRIMARY KEY (ItemID, OperatorID),
  FOREIGN KEY (ItemID) REFERENCES Item(ItemID),
  FOREIGN KEY (OperatorID) REFERENCES Operator(OperatorID)
);

-- Create Donation table which references Item and Donor
CREATE TABLE Donation
(
  DonationID NUMBER NOT NULL,
  DonationDate DATE NOT NULL,
  ItemID NUMBER NOT NULL,
  DonorID NUMBER NOT NULL,
  PRIMARY KEY (DonationID),
  FOREIGN KEY (ItemID) REFERENCES Item(ItemID),
  FOREIGN KEY (DonorID) REFERENCES Donor(DonorID)
);
