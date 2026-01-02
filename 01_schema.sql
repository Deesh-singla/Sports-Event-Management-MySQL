CREATE DATABASE IF NOT EXISTS sports_event;
USE sports_event;
-- 1) GAMES lookup
CREATE TABLE Game (
  GameID   INT PRIMARY KEY,
  GameName VARCHAR(50) NOT NULL UNIQUE
);

-- 2) USERS super-type
CREATE TABLE Users (
  UserID   INT PRIMARY KEY,
  Name     VARCHAR(50) NOT NULL,
  Email    VARCHAR(100) NOT NULL UNIQUE,
  Password VARCHAR(100) NOT NULL,
  CHECK (CHAR_LENGTH(Password) >= 6)
);

-- 3) VENUE
CREATE TABLE Venue (
  VenueID   INT PRIMARY KEY,
  VenueName VARCHAR(100) NOT NULL,
  Location  VARCHAR(100) NOT NULL,
  Capacity  INT NOT NULL,
  CHECK (Capacity > 0)
);

-- 4) ORGANIZER
CREATE TABLE Organizer (
  UserID INT PRIMARY KEY,
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- 5) TEAM
CREATE TABLE Team (
  TeamID   INT PRIMARY KEY,
  TeamName VARCHAR(50) NOT NULL,
  GameID   INT NOT NULL,
  FOREIGN KEY (GameID) REFERENCES Game(GameID)
);

-- 6) COACH
CREATE TABLE Coach (
  UserID     INT PRIMARY KEY,
  Experience INT DEFAULT 0,
  TeamID     INT NOT NULL,
  CHECK (Experience >= 0),
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

-- 7) PLAYER
CREATE TABLE Player (
  UserID INT PRIMARY KEY,
  Age    INT NOT NULL,
  Gender ENUM('M','F') NOT NULL,
  TeamID INT NOT NULL,
  GameID INT NOT NULL,
  CHECK (Age > 0),
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (TeamID) REFERENCES Team(TeamID),
  FOREIGN KEY (GameID) REFERENCES Game(GameID)
);

-- 8) REFEREE
CREATE TABLE Referee (
  UserID     INT PRIMARY KEY,
  Experience INT DEFAULT 0,
  CHECK (Experience >= 0),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- 9) EVENT
CREATE TABLE Event (
  EventID     INT PRIMARY KEY,
  EventName   VARCHAR(100) NOT NULL,
  EventDate   DATE NOT NULL,
  VenueID     INT NOT NULL,
  OrganizerID INT NOT NULL,
  GameID      INT NOT NULL,
  FOREIGN KEY (VenueID) REFERENCES Venue(VenueID),
  FOREIGN KEY (OrganizerID) REFERENCES Organizer(UserID),
  FOREIGN KEY (GameID) REFERENCES Game(GameID)
);

-- 10) MATCH (renamed due to MySQL keyword conflict)
CREATE TABLE MatchTable (
  MatchID   INT PRIMARY KEY,
  Team1ID   INT NOT NULL,
  Team2ID   INT NOT NULL,
  RefereeID INT NOT NULL,
  WinnerID  INT,
  EventID   INT NOT NULL,
  MatchDate DATE NOT NULL,
  FOREIGN KEY (Team1ID) REFERENCES Team(TeamID),
  FOREIGN KEY (Team2ID) REFERENCES Team(TeamID),
  FOREIGN KEY (RefereeID) REFERENCES Referee(UserID),
  FOREIGN KEY (WinnerID) REFERENCES Team(TeamID),
  FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

-- 11) RESULT
CREATE TABLE Result (
  ResultID      INT PRIMARY KEY,
  MatchID       INT NOT NULL,
  WinningTeamID INT NOT NULL,
  Score         INT,
  FOREIGN KEY (MatchID) REFERENCES MatchTable(MatchID),
  FOREIGN KEY (WinningTeamID) REFERENCES Team(TeamID)
);

-- 12) SPONSOR
CREATE TABLE Sponsor (
  SponsorID      INT PRIMARY KEY,
  Name           VARCHAR(100) NOT NULL,
  AmountSponsored INT NOT NULL,
  EventID        INT NOT NULL,
  CHECK (AmountSponsored > 0),
  FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

-- 13) MEDIA PARTNER
CREATE TABLE MediaPartner (
  UserID  INT PRIMARY KEY,
  Contact VARCHAR(100) NOT NULL,
  EventID INT NOT NULL,
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (EventID) REFERENCES Event(EventID)
);
