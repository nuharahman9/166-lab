DROP TABLE IF EXISTS Students;
CREATE TABLE Students (SID numeric (9, 0), Name text, Grade float);
\dt
INSERT INTO Students VALUES (860507041, 'John Anderson', 3.67); 
INSERT INTO Students VALUES (860309067, 'Tom Kamber', 3.12); 
SELECT SID, Name, Grade FROM Students WHERE SID = 860507041; 
INSERT INTO Students VALUES (86070403, 'George Haggerty', 3.67);
SELECT * FROM Students WHERE Grade = 3.67; 