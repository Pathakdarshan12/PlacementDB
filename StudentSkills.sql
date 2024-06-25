CREATE TABLE StudentSkills (
	StudentID INT,
	SkillID INT,
	PRIMARY KEY (StudentID, SkillID),
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	FOREIGN KEY (SkillID) REFERENCES Skills(SkillID)
);