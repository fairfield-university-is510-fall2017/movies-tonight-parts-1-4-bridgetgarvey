
USE MoviesTonight;

INSERT INTO Movie (Title,Rating)
	SELECT DISTINCT MTitle, Rating
		FROM DATASHEET;

ALTER TABLE Theater
	ADD COLUMN TName varchar(50) default NULL;

INSERT INTO Theater (TName,Location,Phone)
	SELECT DISTINCT TName,Location,Phone
		FROM DATASHEET;

INSERT INTO Shows (Showtime, MovieID, TheaterID)
	SELECT DISTINCT Showtime,Movie.ID,Theater.ID
    FROM Movie JOIN Datasheet ON (Movie.Title = Datasheet.Mtitle)
				JOIN Theater ON (`Datasheet`.`TName` = `Theater`.`TName`);
SELECT * FROM Credit;

INSERT INTO Credit (Ccode,MovieID,ArtistID)
	SELECT DISTINCT CCode,Movie.ID,artist.ID
    FROM Movie JOIN Datasheet ON (Movie.Title = Datasheet.Mtitle)
				JOIN Artist ON (`Datasheet`.`CName` = `Artist`.`AName`);
SELECT * FROM `Credit`;

INSERT INTO Artist (AName)
	SELECT CName
		FROM DATASHEET;

SELECT TName,Mtitle,Showtime,CName,CCode,count(*) as RowCount
FROM Datasheet
GROUP BY TName,Mtitle,Showtime,CName,CCode
HAVING RowCount >1;



