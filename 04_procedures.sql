DELIMITER $$

DROP PROCEDURE IF EXISTS ScheduleMatch $$
CREATE PROCEDURE ScheduleMatch(
    IN p_Team1ID INT,
    IN p_Team2ID INT,
    IN p_RefereeID INT,
    IN p_EventID INT,
    IN p_MatchDate DATE
)
BEGIN
    DECLARE v_NewMatchID INT;

    SELECT IFNULL(MAX(MatchID), 500) + 1
    INTO v_NewMatchID
    FROM MatchTable;

    INSERT INTO MatchTable
    (MatchID, Team1ID, Team2ID, RefereeID, EventID, MatchDate)
    VALUES
    (v_NewMatchID, p_Team1ID, p_Team2ID, p_RefereeID, p_EventID, p_MatchDate);
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS RegisterPlayer $$
CREATE PROCEDURE RegisterPlayer(
    IN p_UserID INT,
    IN p_Name VARCHAR(50),
    IN p_Email VARCHAR(100),
    IN p_Password VARCHAR(100),
    IN p_Age INT,
    IN p_Gender CHAR(1),
    IN p_TeamID INT,
    IN p_GameID INT
)
BEGIN
    INSERT INTO Users(UserID, Name, Email, Password)
    VALUES(p_UserID, p_Name, p_Email, p_Password);

    INSERT INTO Player(UserID, Age, Gender, TeamID, GameID)
    VALUES(p_UserID, p_Age, p_Gender, p_TeamID, p_GameID);
END $$

DELIMITER ;

