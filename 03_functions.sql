DELIMITER $$

DROP FUNCTION IF EXISTS GetTeamWinCount $$
CREATE FUNCTION GetTeamWinCount(p_TeamID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_Count INT;

    SELECT COUNT(*)
    INTO v_Count
    FROM Result
    WHERE WinningTeamID = p_TeamID;

    RETURN v_Count;
END $$

DELIMITER ;

DELIMITER $$

DROP FUNCTION IF EXISTS GetTotalSponsorshipByEvent $$
CREATE FUNCTION GetTotalSponsorshipByEvent(p_EventID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_Total INT;

    SELECT IFNULL(SUM(AmountSponsored), 0)
    INTO v_Total
    FROM Sponsor
    WHERE EventID = p_EventID;

    RETURN v_Total;
END $$

DELIMITER ;

DELIMITER $$

DROP FUNCTION IF EXISTS GetWinRate $$
CREATE FUNCTION GetWinRate(team_id INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE total_matches INT;
    DECLARE wins INT;

    SELECT COUNT(*) INTO total_matches
    FROM MatchTable
    WHERE Team1ID = team_id OR Team2ID = team_id;

    SELECT COUNT(*) INTO wins
    FROM Result
    WHERE WinningTeamID = team_id;

    IF total_matches = 0 THEN
        RETURN 0;
    END IF;

    RETURN (wins / total_matches) * 100;
END $$

DELIMITER ;
