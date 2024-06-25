-- 1. Selecting Students Where Name Starts With D 
SELECT * FROM Students WHERE FNAME LIKE 'D%';

-- 2. Selecting Students whose date of birth is betweenn 1985-01-01 and 2000-12-31
SELECT * FROM Students WHERE DateOfBirth BETWEEN '1985-01-01' AND '2000-12-31';

-- 3. Selecting students of MCA department
SELECT * FROM Students WHERE Department LIKE 'MCA';

-- 4.Selecting female students from table
SELECT * FROM Students WHERE Gender = 'Female';

-- 5.Selecting company names starting with A or F
SELECT * FROM Companies WHERE CompanyName LIKE 'A%' OR CompanyName LIKE 'F%';
 
-- 6.
-- Counting Male Students
SELECT COUNT(StudentID) FROM Students Where Gender LIKE 'Male';
-- Counting Female Students
SELECT COUNT(StudentID) FROM Students Where Gender LIKE 'Female';

-- 7.Selecting CompanyNames in Uppercase
SELECT UPPER(CompanyName) FROM Companies;

-- 8.Concatinating first name and last name of students
SELECT CONCAT(FName, " ", LName) AS FullName FROM Students;

-- 9.Selecting Interviews where interviewdate is 2000-01-01 and 2023-12-30
SELECT * FROM Interviews WHERE InterViewDate BETWEEN '2000-01-01' AND '2023-12-30';

-- 10.
-- Selecting companies of domain Information tecnology
SELECT * FROM Companies  WHERE Domain='Information Technology';

-- Selecting companies of branch new york
SELECT * FROM Companies  WHERE Branch='New York';

-- 11. students who have no placements
SELECT StudentID ,FName
FROM Students
WHERE StudentID not in
(SELECT DISTINCT (StudentID) FROM Placements);

-- 12.students who had given interview at least one time
 SELECT DISTINCT(StudentID)
 FROM Interviews
 WHERE StudentID IN
 (SELECT DISTINCT (StudentID) FROM Interviews);
 
 -- 13.students who are placed in company
 SELECT I.StudentID 
 FROM Placements P
 JOIN Interviews I ON I.InterviewID = P.InterviewID
 WHERE CompanyID='02';
 
 -- 14.Counting Number of Interviews given by Student
SELECT S.StudentID, S.fname, COUNT(I.InterviewID) AS InterviewCount
FROM Students S
LEFT JOIN Interviews I ON S.StudentID = I.StudentID
GROUP BY S.StudentID, S.fname;


-- 15. how many skills student have
SELECT S.StudentID,S.FName,  COUNT(SS.SkillID) AS SkillsCount
FROM Students S , StudentSkills SS
WHERE S.StudentID = SS.StudentID GROUP BY StudentID;

SELECT DISTINCT(C.CompanyID),C.CompanyName,COUNT(CS.SkillID) AS SkillsReqCount
FROM Companies C , CompanyReqSkills CS
WHERE C.CompanyID = CS.CompanyID GROUP BY CompanyID;

-- 16. students having more than 2 skills
SELECT S.StudentID, S.FName,COUNT(SS.SkillID) AS SkillsCount
FROM Students S , StudentSkills SS
WHERE S.StudentID = SS.StudentID GROUP BY StudentID
HAVING COUNT(SS.SkillID) > 2;

-- 17.company requires less than 3 skills
SELECT C.CompanyID, C.CompanyName,COUNT(CS.SkillID) AS ReqSkillCount
FROM Companies C , CompanyReqSkills CS
WHERE C.CompanyID = CS.CompanyID GROUP BY CompanyID
HAVING COUNT(CS.SkillID) < 3;

-- 18. students having interview result as selected
select S.StudentID, S.FName , C.CompanyID, C.CompanyName ,I.InterviewResult
from Interviews I , Students S , Companies  C
Where I.StudentID = S.StudentID AND I.CompanyID = C.CompanyID GROUP BY I.InterviewID
HAVING I.InterviewResult = 'Selected';

-- 19.
-- Counting Number of Students
SELECT COUNT(DISTINCT(StudentID))
FROM Students;

-- Counting Number of Companies
SELECT COUNT(DISTINCT(CompanyID))
FROM Companies;

-- 20. students who born before 1st jan 2000
SELECT S.StudentID, S.FName, S.DateOfBirth 
FROM Students S
WHERE DateOfBirth < '2000-01-01'; 

-- 21.
-- Creating Query To View All The Placement Related Data
DELIMITER //
CREATE PROCEDURE GetPlacementData()
BEGIN
    SELECT
        S.StudentID,
        S.FName,
        S.LName,
        S.Gender,
        S.Department,
        S.DateOfBirth,
        S.Email,
        S.Phone,
        C.CompanyID,
        C.CompanyName,
        C.Domain,
        C.Branch,
        C.Website,
        I.InterviewID,
        I.InterviewDate,
        I.InterviewResult,
        P.Position
    FROM Placements AS P
    JOIN Interviews AS I ON P.InterviewID = I.InterviewID
    JOIN Students AS S ON S.StudentID = I.StudentID
    JOIN Companies AS C ON C.CompanyID = I.CompanyID
    WHERE P.InterviewID = I.InterviewID;
END;
//
DELIMITER ;
CALL GetPlacementData();

-- 22.Query to Get Data of students matching skills with company
	SELECT SS.StudentID,S.fname,C.CompanyID,C.CompanyName,Sks.SkillID,SKs.SkillName
	FROM StudentSkills SS
	JOIN Students S ON SS.StudentID = S.StudentID
	JOIN CompanyReqSkills CRS ON SS.SkillID = CRS.SkillID
	JOIN Companies C ON CRS.CompanyID = C.CompanyID
	JOIN Skills SKs ON SS.SkillID=CRS.SKillID=SKs.SkillID
	GROUP BY SS.StudentID, S.fname, C.CompanyID, C.CompanyName, Sks.SkillID, Sks.SkillName
	ORDER BY S.StudentID;

-- 23.List the students who have been selected in interviews and the positions they were offered:
	SELECT S.FName, S.LName, P.Position
	FROM Students S
	JOIN Interviews I ON S.StudentID = I.StudentID
	JOIN Placements P ON I.InterviewID = P.InterviewID
	WHERE I.InterviewResult = 'Selected';


-- 24.Count the number of interviews for each company:
	SELECT C.CompanyName, COUNT(I.InterviewID) AS InterviewCount
	FROM Companies C
	LEFT JOIN Interviews I ON C.CompanyID = I.CompanyID
	GROUP BY C.CompanyName;

-- 25.List the students who have not acquired any skills:
	SELECT S.FName, S.LName
	FROM Students S
	LEFT JOIN StudentSkills SS ON S.StudentID = SS.StudentID
	WHERE SS.SkillID IS NULL;
