CREATE TABLE CompanyReqSkills (
	CompanyID INT,
	SkillID INT,
	PRIMARY KEY (CompanyID, SkillID),
	FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID),
	FOREIGN KEY (SkillID) REFERENCES Skills(SkillID)
);