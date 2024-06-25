CREATE TRIGGER MatchAndPlace 
AFTER INSERT ON Interviews
FOR EACH ROW
BEGIN
    DECLARE student_skill_count INT;
    DECLARE matching_skill_count INT;
    DECLARE ID DATE;
    
    -- Count the total number of skills for the student
    SELECT COUNT(*) INTO student_skill_count
    FROM StudentSkills
    WHERE StudentID = NEW.StudentID;
    
    -- Count the number of matching skills between the student and the company
	SELECT COUNT(*) INTO matching_skill_count
	FROM StudentSkills AS SS
	JOIN CompanyReqSkills AS CS ON SS.SkillID = CS.SkillID
	WHERE SS.StudentID = NEW.StudentID AND CS.CompanyID = NEW.CompanyID;
    
    -- If all the student's skills match with the company's requirements
    IF student_skill_count = matching_skill_count THEN
        INSERT INTO Placements (InterviewID, Position)
        VALUES (New.InterviewID, 'To be determined');
    END IF;
END;
//
DELIMITER ;