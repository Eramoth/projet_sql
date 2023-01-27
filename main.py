import sqlite3
import sys

#create new .db file and connect to it
connection_object = sqlite3.connect("update.db")
#create cursor object
cursor_object = connection_object.cursor()

def menu():
    print("--- Welcome to DBManager ---\n")
    print("You can : \n1 Update\n2 Try some queries\n3 Custom query\n4 Quit\n")
    select = input()
    return select

def update_db():
    ### this will remake all the new database with data from the old one ###
    #create the tables if needed
    with open("scripts/create_table_script.sql", "r") as f:
        cursor_object.executescript(f.read())

    #empty the tables
    cursor_object.execute("DELETE FROM Coach")
    cursor_object.execute("DELETE FROM Game")
    cursor_object.execute("DELETE FROM Player")
    cursor_object.execute("DELETE FROM Staff")
    cursor_object.execute("DELETE FROM Tournament")

    #fill the tables with data
    with open("scripts/join_table_script.sql", "r") as f:
        cursor_object.executescript(f.read())
    
    print("Everything is up-to-date !")

def defqueries():
    ### some predefined queries ###
    print("Game :")
    game = input()

    # List every tournament for a given game name
    print("List every tournament for a given game name : ")
    cursor_object.execute("SELECT * FROM Tournament INNER JOIN Game ON Tournament.idGame = Game.idGame WHERE Game.Name = ?", (game,))   
    print(cursor_object.fetchall(), "\n")

    # Given a game name, retrieve the average wage of the players
    cursor_object.execute("SELECT AVG(Wage) AS AverageWage,Game.Name FROM Employee_Data INNER JOIN Player ON Employee_Data.idEmployeeData = Player.idEmployeeData INNER JOIN Game ON Player.idGame = Game.idGame WHERE Game.Name = ?;", (game,))
    print(cursor_object.fetchall(), "\n")

    # List all tournament by place
    print("List all tournament by place : ")
    cursor_object.execute("SELECT * FROM Tournament INNER JOIN Place ON Tournament.idPlace = Place.idPlace ORDER BY Place.Name ASC;")
    print(cursor_object.fetchall(), "\n")

    # Get the number of players by gender
    print("Get the number of players by gender :")
    cursor_object.execute("SELECT Gender,count(Gender) AS Count FROM Employee_Data GROUP BY Gender;")
    print(cursor_object.fetchall(), "\n")

def customquery():
    ### This let you make your own query ###
    print("Write your query :")
    query = input()
    cursor_object.execute(query)
    print(cursor_object.fetchall())

while True:
    ### simple loop menu ###
    select = menu()
    match select:
        case "1":
            update_db()
        case "2":
            defqueries()
        case "3":
            customquery()
        case "4":
            sys.exit()
        case _:
            print("Invalid number.\n")