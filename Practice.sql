DROP DATABASE IF EXISTS `testDB`;
CREATE DATABASE `testDB`;
USE `testDB`;
CREATE TABLE `tblFinanceNew` (
  `StudentID` int NOT NULL PRIMARY KEY,
  `Tuition_Fee` varchar(50) NOT NULL,
  `Administration_Fee` varchar(50) NOT NULL,
  `Exams_Fee` int NOT NULL,
  `Medical_Fee` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `tblFinanceNew` VALUES (235,'30,000','5,000',3000,4000);
INSERT INTO `tblFinanceNew` VALUES (26,'40,000','5,000',2000,4000);
INSERT INTO `tblFinanceNew` VALUES (1,'34,000','5,000',3000,4000);
INSERT INTO `tblFinanceNew` VALUES (2,'23,000','5,000',3000,4000);
INSERT INTO `tblFinanceNew` VALUES (3,'20,000','5,000',3000,4000);
INSERT INTO `tblFinanceNew` VALUES (29,'35,000','5,000',2000,4000);
INSERT INTO `tblFinanceNew` VALUES (127,'28,000','5,000',3000,4000);

CREATE TABLE `tblstudent` (
  `StudentName` varchar(50) NOT NUll,
  `StudentID` int NOT NULL,
  `Birthdate` varchar(50) NOT NULL,
  `Year` varchar(50) NOT NULL,
  `MobileNo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `tblstudent` VALUES ('Jane',235,'12/1/1987','Y1S2',0722245321);
INSERT INTO `tblstudent` VALUES ('Nicholas',26,'22/7/2002','Y1S1',072045867);
INSERT INTO `tblstudent` VALUES ('Cyrus',1,'15/6/1989','Y2S1',0733765987);
INSERT INTO `tblstudent` VALUES ('Neema',2,'29/11/2008','Y2S1',0732568448);
INSERT INTO `tblstudent` VALUES ('Caroline',3,'18/10/2002','Y1S1',0782569360);
INSERT INTO `tblstudent` VALUES ('Judith',29,'19/6/2003','Y1S2',0722245321);
INSERT INTO `tblstudent` VALUES ('Grace',127,'14/1/2000','Y1S2',0733765987);






