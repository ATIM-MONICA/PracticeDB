DROP DATABASE IF EXISTS testDB;
CREATE DATABASE testDB;
USE testDB;
CREATE TABLE tblstudent (
    StudentName VARCHAR(100) NOT NULL,
    StudentID INT NOT NULL PRIMARY KEY,
    BirthDate DATE NOT NULL,
    Year VARCHAR(10) NOT NULL,
    MobileNo VARCHAR(10) NOT NULL UNIQUE
);
INSERT INTO tblstudent VALUES ('Jane',    235, '1987/01/12', 'Y1S2',  '0722245321');
INSERT INTO tblstudent VALUES ('Nicholas', 26, '2002/07/22', 'Y1S1',  '072045867');
INSERT INTO tblstudent VALUES ('Cyrus',     1, '1989/06/15', 'Y2S1',  '0704231345');
INSERT INTO tblstudent VALUES ('Neema',     2, '2008/11/29', 'Y2S1',  '0733876987');
INSERT INTO tblstudent VALUES ('Caroline',  3, '2002/10/18', 'Y1S1',  '0732568448');
INSERT INTO tblstudent VALUES ('Judith',   29, '2003/06/19', 'Y1S2',  '0711234567');
INSERT INTO tblstudent VALUES ('Grace',   127, '2000/01/14', 'Y1S2',  '0733765987');

CREATE TABLE tblfinance (
    StudentID INT NOT NULL PRIMARY KEY,
    Tuition_Fee INT NOT NULL,
    Administration_Fee INT NOT NULL DEFAULT 5000,
    Exams_Fee INT NOT NULL,
    Medical_Fee INT NOT NULL DEFAULT 4000,
      FOREIGN KEY (StudentID) REFERENCES tblstudent(StudentID)
);

-- Administration_Fee and Medical_Fee are omitted from these INSERT statements.
-- MySQL will automatically apply their DEFAULT values (5000 and 4000 respectively)
INSERT INTO tblfinance (StudentID, Tuition_Fee, Exams_Fee) VALUES (235,  30000, 3000);
INSERT INTO tblfinance (StudentID, Tuition_Fee, Exams_Fee) VALUES (26,  40000, 2000);
INSERT INTO tblfinance (StudentID, Tuition_Fee, Exams_Fee) VALUES (1,  34000, 3000);
INSERT INTO tblfinance (StudentID, Tuition_Fee, Exams_Fee) VALUES(2,  23000, 3000);
INSERT INTO tblfinance (StudentID, Tuition_Fee, Exams_Fee) VALUES (3,  20000, 3000);
INSERT INTO tblfinance (StudentID, Tuition_Fee, Exams_Fee) VALUES (29, 35000, 2000);
INSERT INTO tblfinance (StudentID, Tuition_Fee, Exams_Fee) VALUES (127, 28000, 3000);

-- a)ii)Extracting all students in Y1S1 with the tuition fee they have paid
SELECT 
    s.StudentName,
    s.StudentID,
    s.Year,
    FORMAT(f.Tuition_Fee, 0) AS Tuition_Fee
FROM tblstudent s
JOIN tblfinance f ON s.StudentID = f.StudentID
WHERE s.Year = 'Y1S1';

-- a)iii)All students with paid tuition fee >=30,000
SELECT 
    s.StudentName,
    s.StudentID,
    s.Year,
    FORMAT(f.Tuition_Fee, 0) AS Tuition_Fee
FROM tblstudent AS s
JOIN tblfinance AS f 
  ON s.StudentID = f.StudentID
WHERE f.Tuition_Fee >= 30000;

-- a)iv)
-- Adding new record 

INSERT INTO tblstudent (
  StudentName,
  StudentID,
  BirthDate,
  Year,
  MobileNo
) VALUES (
  'Dan',
  236, -- Assumption that Dan's StudentID is 236 coz must satisfy NOT NULL constraint
  STR_TO_DATE('20/4/2001', '%d/%m/%Y'),
  'Y1S2',
  '0723456123'
);

-- a)v)
-- Changing the student name with ID 26 to Nelson
UPDATE tblstudent
SET StudentName = 'Nelson'
WHERE StudentID = 26;

-- a)vi) Calculation of both highest and lowest tuition fees
SELECT
    FORMAT(MAX(Tuition_Fee), 0) AS `Highest Amount`,
    FORMAT(MIN(Tuition_Fee), 0) AS `Lowest Amount`
FROM tblfinance;








