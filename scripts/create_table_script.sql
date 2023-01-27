CREATE TABLE IF NOT EXISTS Place
(
    IdPlace INTEGER PRIMARY KEY NOT NULL,
    Name VARCHAR2(30),
    Address VARCHAR2(30),
    City VARCHAR2(30)
);

CREATE TABLE IF NOT EXISTS Game
(
    IdGame INTEGER PRIMARY KEY NOT NULL,
    Name VARCHAR2(30)
);

CREATE TABLE IF NOT EXISTS Tournament
(
    IdTournament INTEGER PRIMARY KEY NOT NULL,
    IdPlace INTEGER NOT NULL,
    IdGame INTEGER NOT NULL,
    Date VARCHAR2(30) NOT NULL,
    Duration INT,
    FOREIGN KEY (IdPlace) REFERENCES Place(IdPlace),
    FOREIGN KEY (IdGame) REFERENCES Game(IdGame)
);

CREATE TABLE IF NOT EXISTS Employee_Data
(
    IdEmployeeData INTEGER PRIMARY KEY NOT NULL,
    Lastname VARCHAR2(30),
    Firstname VARCHAR2(30),
    Gender VARCHAR2(30),
    Age INT,
    Wage INT
);

CREATE TABLE IF NOT EXISTS Staff 
(
    IdStaff INTEGER PRIMARY KEY NOT NULL,
    IdEmployeeData INTEGER NOT NULL,
    FOREIGN KEY (IdEmployeeData) REFERENCES Employee_Data(IdEmployeeData)
);

CREATE TABLE IF NOT EXISTS Player
(
    IdPlayer INTEGER PRIMARY KEY NOT NULL,
    IdGame INTEGER NOT NULL,
    Ranking INT,
    IdEmployeeData INTEGER NOT NULL,
    FOREIGN KEY (IdGame) REFERENCES Game(IdGame),
    FOREIGN KEY (IdEmployeeData) REFERENCES Employee_Data(IdEmployeeData)
);

CREATE TABLE IF NOT EXISTS Coach
(
    IdCoach INTEGER PRIMARY KEY NOT NULL,
    IdGame INTEGER NOT NULL,
    LicenseDate VARCHAR2(30),
    IdEmployeeData INTEGER NOT NULL,
    FOREIGN KEY (IdGame) REFERENCES Game(IdGame),
    FOREIGN KEY (IdEmployeeData) REFERENCES Employee_Data(IdEmployeeData)
);