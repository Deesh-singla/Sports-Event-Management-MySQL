SELECT GetTeamWinCount(201) AS Wins;
SELECT GetTeamWinCount(203) AS Wins;

CALL ScheduleMatch(201, 202, 105, 401, '2025-06-12');
CALL ScheduleMatch(204, 202, 111, 403, '2025-06-13');

SELECT * FROM MatchTable;

UPDATE MatchTable
SET WinnerID = 201
WHERE MatchID = 501;

SELECT * FROM Result WHERE MatchID = 501;

SELECT u.Name
FROM Player p
JOIN Users u ON p.UserID = u.UserID
WHERE p.TeamID = 204;

SELECT 
    e.EventID,
    e.EventName,
    e.EventDate,
    v.VenueName,
    v.Location,
    u.Name AS Organizer
FROM Event e
JOIN Venue v ON e.VenueID = v.VenueID
JOIN Organizer o ON e.OrganizerID = o.UserID
JOIN Users u ON o.UserID = u.UserID;

SELECT 
    m.MatchID,
    t1.TeamName AS Team1,
    t2.TeamName AS Team2,
    u.Name AS Referee,
    ev.EventName,
    v.VenueName,
    t3.TeamName AS Winner,
    m.MatchDate
FROM MatchTable m
JOIN Team t1 ON m.Team1ID = t1.TeamID
JOIN Team t2 ON m.Team2ID = t2.TeamID
JOIN Referee r ON m.RefereeID = r.UserID
JOIN Users u ON r.UserID = u.UserID
JOIN Event ev ON m.EventID = ev.EventID
JOIN Venue v ON ev.VenueID = v.VenueID
LEFT JOIN Team t3 ON m.WinnerID = t3.TeamID;


SELECT m.MatchID, ev.EventName, m.MatchDate
FROM MatchTable m
JOIN Event ev ON m.EventID = ev.EventID
WHERE ev.VenueID = 301;

SELECT MatchID, MatchDate, EventID
FROM MatchTable
WHERE (Team1ID = 201 OR Team2ID = 201)
AND MatchDate >= CURDATE()
ORDER BY MatchDate;

SELECT GetTotalSponsorshipByEvent(401) AS TotalSponsorship;

SELECT GetWinRate(201) AS WinRatePercentage;
