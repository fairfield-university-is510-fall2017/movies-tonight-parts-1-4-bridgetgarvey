-- Movies Tonight DDL

CREATE DATABASE MoviesTonight;

CREATE TABLE Artist (
	ID int (11) NOT NULL auto_increment,
    AName varchar(50) default NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Credit (
	ID int (11) NOT NULL auto_increment,
    Ccode varchar (11) default NULL,
    ArtistID int (11) default NULL,
    MovieID int (11) default NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Movie (
	ID int(11) NOT NULL auto_increment,
    Title varchar(50) default NULL,
    Rating varchar(50) default NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Shows (
	ID int(11) NOT NULL auto_increment,
    Showtime time default NULL,
    MovieID int(11) default NULL,
    TheaterID int(11) default NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Theater (
	ID int(50) NOT NULL auto_increment,
    Location varchar(50) default NULL,
    Phone int(11) default NULL,
    PRIMARY KEY (ID)
);

ALTER TABLE Credit 
	ADD FOREIGN KEY ArtistID 
		REFERENCES Artist (ID);

ALTER TABLE Credit 
	ADD FOREIGN KEY (MovieID)
		REFERENCES Movie (ID);

ALTER TABLE Showtime 
	ADD FOREIGN KEY (TheaterID)
		REFERENCES Theater (ID);

ALTER TABLE Showtime ADD FOREIGN KEY