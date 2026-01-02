INSERT INTO Users (UserID, Name, Email, Password) VALUES (101, 'Alice Smith', 'alice@example.com', 'alice123');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (102, 'Bob Johnson', 'bob@example.com', 'bob12345');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (103, 'Charlie Brown', 'charlie@example.com', 'charliepw');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (104, 'Diana Prince', 'diana@example.com', 'diana456');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (105, 'Ethan Ray', 'ethan@example.com', 'ethan789');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (106, 'Fiona Hill', 'fiona@example.com', 'fiona987');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (107, 'George King', 'george@example.com', 'georgepw');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (108, 'Hannah Lee', 'hannah@example.com', 'hannah123');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (109, 'Ian Clarke', 'ian@example.com', 'ianpass456');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (110, 'Julia Kim', 'julia@example.com', 'juliapw');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (113, 'Nathan Drake', 'nathan@example.com', 'nathan456');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (114, 'Olivia Scott', 'olivia@example.com', 'olivia999');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (115, 'Ravi Sharma', 'ravi@example.com', 'ravi1234');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (116, 'Sneha Kapoor', 'sneha@example.com', 'sneha456');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (117, 'Vikram Singh', 'vikram@example.com', 'vikram789');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (118, 'Neha Reddy', 'neha@example.com', 'neha654');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (119, 'Karan Mehta', 'karan@example.com', 'karan321');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (120, 'Priya Das', 'priya@example.com', 'priya789');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (121, 'Rahul Nair', 'rahul@example.com', 'rahulpass');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (122, 'Tanvi Shah', 'tanvi@example.com', 'tanvi789');

-- Game
INSERT INTO Game (GameID, GameName) VALUES (1, 'Football');
INSERT INTO Game (GameID, GameName) VALUES (2, 'Basketball');

-- Teams
INSERT INTO Team (TeamID, TeamName, GameID) VALUES (201, 'Tigers', 1);
INSERT INTO Team (TeamID, TeamName, GameID) VALUES (202, 'Wolves', 2);
INSERT INTO Team (TeamID, TeamName, GameID) VALUES (203, 'Lions', 1); 
INSERT INTO Team (TeamID, TeamName, GameID) VALUES (204, 'Falcons', 2);
INSERT INTO Team (TeamID, TeamName, GameID) VALUES (205, 'Eagles', 1);
INSERT INTO Team (TeamID, TeamName, GameID) VALUES (206, 'Sharks', 2);



-- Coach
INSERT INTO Coach (UserID, Experience, TeamID) VALUES (101, 5, 201);
INSERT INTO Coach (UserID, Experience, TeamID) VALUES (102, 3, 202);
INSERT INTO Coach (UserID, Experience, TeamID) VALUES (110, 6, 203);
INSERT INTO Coach (UserID, Experience, TeamID) VALUES (118, 4, 205);
INSERT INTO Coach (UserID, Experience, TeamID) VALUES (119, 2, 206);

-- Player
INSERT INTO Player (UserID, Age, Gender, TeamID, GameID) VALUES (103, 22, 'M', 201, 1);
INSERT INTO Player (UserID, Age, Gender, TeamID, GameID) VALUES (104, 20, 'F', 202, 2);
INSERT INTO Player (UserID, Age, Gender, TeamID, GameID) VALUES (108, 21, 'F', 203, 1);
INSERT INTO Player (UserID, Age, Gender, TeamID, GameID) VALUES (109, 23, 'M', 204, 2);
INSERT INTO Player (UserID, Age, Gender, TeamID, GameID) VALUES (114, 22, 'F', 206, 2);
INSERT INTO Player (UserID, Age, Gender, TeamID, GameID) VALUES (115, 24, 'M', 205, 1);
INSERT INTO Player (UserID, Age, Gender, TeamID, GameID) VALUES (116, 22, 'F', 206, 2);
INSERT INTO Player (UserID, Age, Gender, TeamID, GameID) VALUES (117, 21, 'M', 205, 1);
INSERT INTO Player (UserID, Age, Gender, TeamID, GameID) VALUES (118, 23, 'F', 206, 2);

-- Referee
INSERT INTO Referee (UserID, Experience) VALUES (105, 4);
INSERT INTO Users (UserID, Name, Email, Password) VALUES (111, 'Kevin Moss', 'kevin@example.com', 'kevin321');
INSERT INTO Referee (UserID, Experience) VALUES (111, 2);
INSERT INTO Referee (UserID, Experience) VALUES (121, 3);

-- Organizer
INSERT INTO Organizer (UserID) VALUES (106);

-- Venue
INSERT INTO Venue (VenueID, VenueName, Location, Capacity) VALUES (301, 'City Arena', 'New York', 20000);
INSERT INTO Venue (VenueID, VenueName, Location, Capacity) VALUES (302, 'Metro Stadium', 'Los Angeles', 25000);
INSERT INTO Venue (VenueID, VenueName, Location, Capacity) VALUES (303, 'Grand Field', 'Chicago', 18000);
INSERT INTO Venue (VenueID, VenueName, Location, Capacity)VALUES (304, 'Lakeside Ground', 'Seattle', 16000);

-- Events
INSERT INTO Event VALUES
(401, 'Summer Cup', '2025-06-10', 301, 106, 1),
(402, 'Winter Classic', '2025-12-15', 302, 106, 2),
(403, 'Autumn Tournament', '2025-09-05', 303, 106, 1),
(404, 'Spring Showdown', '2025-04-20', 304, 106, 2);

-- Match
INSERT INTO MatchTable VALUES
(501, 201, 202, 105, 201, 401, '2025-06-11'),
(502, 201, 203, 111, 203, 403, '2025-09-06'),
(503, 203, 205, 111, 203, 403, '2025-09-07'),
(504, 204, 206, 105, 204, 402, '2025-12-16'),
(506, 206, 204, 105, NULL, 404, '2025-04-21');


-- Result
INSERT INTO Result (ResultID, MatchID, WinningTeamID, Score)
VALUES (601, 501, 201, 3);
INSERT INTO Result (ResultID, MatchID, WinningTeamID, Score)
VALUES (602, 502, 203, 2);
INSERT INTO Result (ResultID, MatchID, WinningTeamID, Score)
VALUES (603, 503, 203, 2);
INSERT INTO Result (ResultID, MatchID, WinningTeamID, Score)
VALUES (604, 504, 204, 1);
INSERT INTO Result (ResultID, MatchID, WinningTeamID, Score)
VALUES (605, 506, 206, 1);

-- Sponsor
INSERT INTO Sponsor (SponsorID, Name, AmountSponsored, EventID)
VALUES (701, 'Pepsi Co.', 50000, 401);
INSERT INTO Sponsor (SponsorID, Name, AmountSponsored, EventID)
VALUES (702, 'Nike', 75000, 402);
INSERT INTO Sponsor (SponsorID, Name, AmountSponsored, EventID)
VALUES (703, 'Adidas', 60000, 403);
INSERT INTO Sponsor (SponsorID, Name, AmountSponsored, EventID)
VALUES (704, 'Red Bull', 80000, 403);
INSERT INTO Sponsor (SponsorID, Name, AmountSponsored, EventID)
VALUES (705, 'Puma', 55000, 404);

-- Media Partner (after Event is created)
INSERT INTO MediaPartner (UserID, Contact, EventID)
VALUES (107, 'media@partner.com', 401);
INSERT INTO Users (UserID, Name, Email, Password) VALUES (112, 'Linda Green', 'linda@example.com', 'lindamedia');
INSERT INTO MediaPartner (UserID, Contact, EventID)
VALUES (112, 'linda@mediahub.com', 403);
INSERT INTO MediaPartner (UserID, Contact, EventID)
VALUES (122, 'tanvi@mediagroup.com', 404);
