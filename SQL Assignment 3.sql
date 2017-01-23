-- SQL Assignment 3



#A new Schema will be created.  Note that the schema that will be used is homework3nn
#If you have a schema with this name that already exists (and you do not want edited) you should change the
#schema name in the following two lines.


CREATE SCHEMA IF NOT EXISTS homework3;

use homework3;




DROP TABLE IF EXISTS Access;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Rooms;
DROP TABLE IF EXISTS Groups;

#The first table to be created is the groups table.

CREATE TABLE Groups 
	(GroupID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
     Groupname VARCHAR(20) NOT NULL);

INSERT INTO Groups
(Groupname)
VALUES
('I.T.'),
('Administration'),
('Sales'),
('Operations');

     
#The second table to be creatd is the users table.     
CREATE TABLE Users 
	(UserID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
     Username VARCHAR(15) NOT NULL,
     Fullname VARCHAR(25),
     Usergroup INT,
     CONSTRAINT FOREIGN KEY (Usergroup) 
     REFERENCES Groups (GroupID)
     ON DELETE SET NULL);
     
INSERT INTO Users
(Username, Fullname, Usergroup)
VALUES
	('Modesto',NULL, 1),
	('Ayine', NULL, 1),
	('Christopher', NULL, 3),
	('Cheong', 'Cheong Woo', 3),
	('Saulat',NULL, 2),
	('Heidy',NULL,NULL);


#The third table to be created is the Rooms table.
CREATE TABLE Rooms 
	(RoomID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
     Roomname VARCHAR(25) NOT NULL);

INSERT INTO Rooms
(Roomname)
VALUES
	('Room 101'),
	('Room 102'),
	('Auditorium A'),
    ('Auditorium B');

#The fourth table is the Access table.
CREATE TABLE Access
	(AccessID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
     Groupaccess INT,
     Roomaccess INT,
     CONSTRAINT FOREIGN KEY (Groupaccess) 
		REFERENCES Groups (GroupID)
		ON DELETE SET NULL,
     CONSTRAINT FOREIGN KEY (Roomaccess)
		REFERENCES Rooms (RoomID)
        ON DELETE SET NULL);
        
INSERT INTO Access
(Groupaccess, Roomaccess)
VALUES
	(1,1),
	(1,2),
	(3,2),
    (3,3);
	

#All groups and the users assigned to each group
SELECT Groups.Groupname, Users.Username FROM Groups
LEFT JOIN Users
ON Groups.GroupID = Users.Usergroup
ORDER BY Groupname;

#All rooms and the groups assigned to each room
SELECT Rooms.Roomname, Groups.Groupname FROM Access
RIGHT JOIN Rooms
	ON Access.Roomaccess = Rooms.RoomID
LEFT JOIN Groups
	ON Access.Groupaccess = Groups.GroupID
ORDER BY Roomname;

#A list of users, the groups that they belong to, and the rooms to which they are assigned. 
#This should be sorted alphabetically by user, then by group, then by room.

SELECT UGroups.UsernameG, UGroups.GroupnameG, Rooms.Roomname FROM Access
RIGHT JOIN
		(SELECT Users.UserID AS UserIDG, Users.Username AS UsernameG, 
			Groups.GroupID AS GroupIDG, Groups.Groupname AS GroupnameG
		FROM Users
		LEFT JOIN Groups
			ON Users.Usergroup = Groups.GroupID) AS UGroups
	ON Access.Groupaccess = UGroups.GroupIDG
LEFT JOIN Rooms
	ON Access.RoomAccess = Rooms.RoomID
ORDER BY UsernameG, GroupnameG, Roomname;
     
    


