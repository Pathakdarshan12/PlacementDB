CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FName VARCHAR(50),
    LName VARCHAR(50),
    Gender ENUM('Male','Female'),
    Department VARCHAR(30),
    DateOfBirth DATE,
    Email VARCHAR(100),
    Phone BIGINT
);