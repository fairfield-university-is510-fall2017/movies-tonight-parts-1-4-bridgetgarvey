-- Movies Tonight DDL

#Create database 'MoviesTonight'
CREATE DATABASE MoviesTonight;

#Use database 'MoviesTonight'
USE MoviesTonight;

#Create ARTIST Table
CREATE TABLE Artist (
	ID int (11) NOT NULL auto_increment,
    AName varchar(50) default NULL,
    PRIMARY KEY (ID)
);

#Create CREDIT Table
CREATE TABLE Credit (
	ID int (11) NOT NULL auto_increment,
    Ccode varchar (11) default NULL,
    ArtistID int (11) default NULL,
    MovieID int (11) default NULL,
    PRIMARY KEY (ID)
);

#Create MOVIE Table
CREATE TABLE Movie (
	ID int(11) NOT NULL auto_increment,
    Title varchar(50) default NULL,
    Rating varchar(50) default NULL,
    PRIMARY KEY (ID)
);

#Create SHOWS Table
CREATE TABLE Shows (
	ID int(11) NOT NULL auto_increment,
    Showtime time default NULL,
    MovieID int(11) default NULL,
    TheaterID int(11) default NULL,
    PRIMARY KEY (ID)
);

#Create THEATER Table
CREATE TABLE Theater (
	ID int(50) NOT NULL auto_increment,
    Location varchar(50) default NULL,
    Phone int(11) default NULL,
    PRIMARY KEY (ID)
);

#Alter CREDIT Table to add Foreign Key ArtistID
ALTER TABLE Credit 
	ADD FOREIGN KEY (ArtistID) 
		REFERENCES Artist (ID);

#Alter CREDIT Table to add Foreign Key MovieID
ALTER TABLE Credit 
	ADD FOREIGN KEY (MovieID)
		REFERENCES Movie (ID);

#Alter SHOWS Table to add Foreign Key TheaterID
ALTER TABLE Showtime 
	ADD FOREIGN KEY (TheaterID)
		REFERENCES Theater (ID);

#Alter SHOWS Table to add Foreign Key MovieID
ALTER TABLE Showtime 
	ADD FOREIGN KEY (MovieID)
		REFERENCES Movie (ID);
