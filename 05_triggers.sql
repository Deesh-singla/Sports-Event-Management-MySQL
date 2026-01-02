DELIMITER $$

CREATE TRIGGER trg_InsertResultOnWinner
AFTER UPDATE ON MatchTable
FOR EACH ROW
BEGIN
    DECLARE v_NewResultID INT;

    IF NEW.WinnerID IS NOT NULL THEN
        SELECT IFNULL(MAX(ResultID), 600) + 1
        INTO v_NewResultID
        FROM Result;

        INSERT INTO Result(ResultID, MatchID, WinningTeamID, Score)
        VALUES(v_NewResultID, NEW.MatchID, NEW.WinnerID, 0);
    END IF;
END $$

DELIMITER ;
