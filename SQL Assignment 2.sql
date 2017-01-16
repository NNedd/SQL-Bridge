-- SQL Assignment 2
#Create Schema.  Note that the schema that will be used is homework2nn
#If you have a schema with this name that already exists (and you do not want edited) you should change the
#schema name in the following two lines.


CREATE SCHEMA IF NOT EXISTS homework2nn;

use homework2nn;

DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS Videos;

# Video Table

CREATE TABLE Videos 
	(VideoID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
     Title VARCHAR(75) NULL,
     Length time,
     URL VARCHAR(100));

INSERT INTO Videos
(Title, Length, URL)
VALUES
('How to create database and tables in MySql Workbench 6.3', '0621', 'https://www.youtube.com/watch?v=u6p2OU491Ss'),
('Creating and Querying a Database Schema with MySQL Workbench', '1823', 'https://www.youtube.com/watch?v=EL39BGSUkzw'), 
('MySQL Tutorial: Creating an Entity-Relationship Diagram', '1700', 'https://www.youtube.com/watch?v=bk0n2QLLxPI');

select * from Videos;

# The reviews table
DROP TABLE IF EXISTS Reviews;
CREATE TABLE Reviews 
	(ReviewID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
     Username VARCHAR(10) NOT NULL,
     Video INT,
     Rating INT NULL,
     Review VARCHAR(25) NULL,
     CONSTRAINT FOREIGN KEY (Video) 
     REFERENCES Videos (VideoID)
     ON DELETE SET NULL);
   
INSERT INTO Reviews
(Username, Video, Rating, Review)
VALUES
('Asher', 1, 4, 'Great tutorial'),
('Cyd', 1, 2, 'So So Video not the best'),
('Mike',1,3,'It was okay, seen better'), 
('Simon', 3, 5, 'Awesome!'),
('Niki', 3, 4, 'Great, learned a lot'),
('Jackie', 2, 3, 'Average Video');
     
select * from reviews;

# Joining the tables

SELECT VideoID, Title, Length, URL, Username, Rating, Review from
Videos 
inner join Reviews
on Videos.VideoID = Reviews.Video;

