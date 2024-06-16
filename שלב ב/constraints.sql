ALTER TABLE Item
ADD CONSTRAINT CK_Item_Quantity CHECK (Quantity >= 0);


ALTER TABLE Donation
ADD CONSTRAINT Defualt_date_donation
modify donationDate Date Default (sysdate);

ALTER TABLE category
ADD CONSTRAINT category_name_not_null
modify name VARCHAR2(100) not null;

