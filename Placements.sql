CREATE TABLE Placements (
	PlacementID INT PRIMARY KEY AUTO_INCREMENT ,
	InterviewID INT,
	FOREIGN KEY (InterviewID) REFERENCES Interviews(InterviewID
	Position VARCHAR(100)
);