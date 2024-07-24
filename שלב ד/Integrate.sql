--כל ציוד יהיה פריט ברשימת פריטים, כלומר ציוד הוא ישות חלשה כלפי Item.
-- Step 1: Add ItemID column to Equipment table
ALTER TABLE Equipment
ADD ItemID NUMBER;

--מחיקת שמות מקבילים של שדות מציוד
ALTER TABLE Equipment
DROP COLUMN e_name;

-- Step 2: Add foreign key constraint to Equipment table referencing Item table
ALTER TABLE Equipment
ADD CONSTRAINT fk_equipment_item
FOREIGN KEY (Item_ID)
REFERENCES Item(ItemID);

-- Step 3: Drop existing primary key constraint

-- Step 3: Drop existing primary key constraint
--מחיקת מפתח זר ב-uses
ALTER TABLE uses
DROP CONSTRAINT SYS_C00725912;

--מחיקת מפתח ראשי ב-uses
ALTER TABLE uses
DROP CONSTRAINT SYS_C00725910

ALTER TABLE Equipment
DROP CONSTRAINT SYS_C00725901;

-- Step 4: Add new primary key constraint that includes ItemID and e_id

ALTER TABLE Equipment
ADD CONSTRAINT Equipment_pk
PRIMARY KEY (Item_ID, e_id);



-- Step 4: Add new primary key constraint that includes ItemID and e_id
ALTER TABLE Equipment
ADD CONSTRAINT Equipment_pk
PRIMARY KEY (ItemID, e_id);


--כל תורם יכול לתרום איזה קורס שירצה, וכל קורס יכול להתרם ע"י כמה תורמים
-- Step 1: Create the junction table
CREATE TABLE Donor_Courses (
    donation_id NUMBER PRIMARY KEY,
    DonorID NUMBER,
    CourseID NUMBER,
    CONSTRAINT fk_donor FOREIGN KEY (DonorID) REFERENCES Donor(DonorID),
    CONSTRAINT fk_course FOREIGN KEY (CourseID) REFERENCES Courses(c_id)
);

-- Step 2: Add foreign key constraint to Donor_Courses table referencing Donor table
ALTER TABLE Donor_Courses
ADD CONSTRAINT fk_donor_courses_donor
FOREIGN KEY (DonorID)
REFERENCES Donor(DonorID);

-- Step 3: Add foreign key constraint to Donor_Courses table referencing Courses table
ALTER TABLE Donor_Courses
ADD CONSTRAINT fk_donor_courses_courses
FOREIGN KEY (CourseID)
REFERENCES Courses(c_id);



-- לדעת באיזה מיקום כל חדר.
-- Adding the LocationID column to room table

-- Dropping the r_location column from Room table
ALTER TABLE Room
DROP COLUMN r_location;

ALTER TABLE room
ADD PHONEnUMBER NUMBER;

-- Adding the foreign key constraint to link room to Location
ALTER TABLE room
ADD CONSTRAINT fk_room_location
FOREIGN KEY (PHONEnUMBER) REFERENCES Location(PHONEnUMBER);


--כל Operator יוכל להשתתף בקורסים
-- Create the OperatorCourse table
CREATE TABLE OperatorCourse (
    OperatorID NUMBER,
    g_id NUMBER,
    PRIMARY KEY (OperatorID, g_id),
    FOREIGN KEY (OperatorID) REFERENCES Operator(OperatorID),
    FOREIGN KEY (g_id) REFERENCES studentsGroup(g_id)
);





