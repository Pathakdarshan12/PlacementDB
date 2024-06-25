CREATE TABLE Interviews (
	InterviewID INT PRIMARY KEY,
	StudentID INT,
	CompanyID INT,
	InterviewDate DATE,
	InterviewResult ENUM(’Selected’,’Rejected’,’To be determine
	FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID),
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);