ATTACH DATABASE 'tpb2.db' AS original;


-- Insert all data who doesn't have foreign key --

INSERT INTO Employee_Data (Lastname,Firstname,Gender,Age,Wage)
SELECT Lastname,Firstname,Gender,Age,Wage FROM original.coach;

INSERT INTO Employee_Data (Lastname,Firstname,Gender,Age,Wage)
SELECT Lastname,Firstname,Gender,Age,Wage FROM original.staff;

INSERT INTO Employee_Data (Lastname,Firstname,Gender,Age,Wage)
SELECT Lastname,Firstname,Gender,Age,Wage FROM original.player;

-- Insert all the remaining data --

INSERT INTO Place (Name,Address,City)
SELECT DISTINCT placeName,Address,City FROM original.tournament;

INSERT INTO Game (Name)
SELECT DISTINCT name FROM original.game;

INSERT INTO Tournament (IdPlace,IdGame,Date,Duration)
SELECT DISTINCT Place.IdPlace,Game.IdGame,Date,Duration FROM Place,Game,original.tournament
WHERE Place.Name = original.tournament.placeName AND Game.IdGame = original.tournament.IdGame;

INSERT INTO Staff (IdEmployeeData) 
SELECT DISTINCT IdEmployeeData FROM Employee_Data
WHERE Firstname IN (SELECT Firstname FROM original.staff) AND Lastname IN (SELECT Lastname FROM original.staff);

INSERT INTO Player (IdGame,Ranking,IdEmployeeData)
SELECT DISTINCT Game.IdGame,Ranking,IdEmployeeData FROM Game,Employee_Data,original.player
WHERE Game.IdGame = original.player.IdGame AND Employee_Data.Firstname = original.player.firstname AND Employee_Data.Lastname = original.player.lastname;

INSERT INTO Coach (IdGame,LicenseDate,IdEmployeeData)
SELECT DISTINCT Game.IdGame,LicenseDate,IdEmployeeData FROM Game,Employee_Data,original.coach
WHERE Game.IdGame = original.coach.IdGame AND Employee_Data.Firstname = original.coach.firstname AND Employee_Data.Lastname = original.coach.lastname;


DETACH DATABASE original