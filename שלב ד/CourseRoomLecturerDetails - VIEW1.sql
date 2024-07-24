--קורסים שנערכים בחדרים עם קיבולת של לפחות 20 מקומות.
CREATE VIEW CourseRoomLecturerDetails AS
SELECT 
    C.C_name AS CourseName,
    C.categories AS CourseCategory,
    C.presence AS CoursePresence,
    R.r_id AS RoomID,          
    R.numplace AS RoomCapacity, 
    R.r_type AS RoomType,       
    L.l_name AS LecturerName,
    L.seniority AS LecturerSeniority,
    L.training AS LecturerTraining
FROM 
    Courses C
    JOIN StudentsGroup S ON C.c_Id = S.c_Id
    JOIN Room R ON S.r_id = R.r_id
    JOIN teaches_the T ON C.c_Id = T.c_Id
    JOIN lecturers L ON T.l_Id = L.l_Id
WHERE 
    R.numplace >= 20; 


SELECT * FROM CourseRoomLecturerDetails;

--מספר הקורסים והכיתות עבור כל דרגת סניוריות
SELECT C.LecturerSeniority,
       COUNT(DISTINCT C.CourseName) AS NumberOfCourses,
       COUNT(DISTINCT R.r_id) AS NumberOfRooms
FROM CourseRoomLecturerDetails C
    JOIN lecturers L ON C.LecturerName = L.l_name
    JOIN Room R ON C.RoomID = R.r_id
GROUP BY C.LecturerSeniority
ORDER BY C.LecturerSeniority;


--מידע על קורסים שבהם נוכחות הקורס היא "Optional"
SELECT 
    C.CourseName,
    C.RoomID,
    C.RoomType,
    c.RoomCapacity,
    c.CoursePresence
FROM 
    CourseRoomLecturerDetails C
WHERE 
    C.CoursePresence = 'Optional'
ORDER BY 
    C.CourseName;





