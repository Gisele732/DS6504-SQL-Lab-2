DROP TABLE IF EXISTS dbo.STUDENT;
USE MyTestDB;
CREATE TABLE STUDENT(
    S_ID    VARCHAR(10)     NOT NULL    CONSTRAINT	PK_STUDENT			PRIMARY KEY, 
    S_FIRSTNAME  VARCHAR(35)     NOT NULL,
	S_LASTNAME  VARCHAR(35)     NOT NULL,
    S_DOB   DATE            NOT NULL,
    S_EMAIL  VARCHAR(35)     NOT NULL,
 );
 SELECT * FROM STUDENT;
 GO

 INSERT INTO STUDENT
	(S_ID, S_FIRSTNAME, S_LASTNAME, S_DOB, S_EMAIL)
VALUES
	(1000, 'Guy', 'Hayley', '03/10/1989', 'guy.hayley@mail.com');
SELECT * FROM STUDENT
GO

INSERT INTO STUDENT
	(S_ID, S_FIRSTNAME, S_LASTNAME, S_DOB, S_EMAIL)
VALUES
	(1001, 'Sophie', 'Smith', '06/25/1996', 'sophie.s@mail.com'), --Date default format is US format mm/dd/yyyy
	(1002, 'Mark', 'Doe', '12/06/2003', 'm.doe@mail.com'),
	(1003, 'John', 'Martin', '04/05/1995', 'john2234@mail.com');
SELECT * FROM STUDENT
GO

--Change date format to NZ format dd/mm/yyyy
declare @Existingdate datetime
Set @Existingdate=GETDATE()
Select CONVERT(varchar,@Existingdate,103) as [DD/MM/YYYY] --103 is the date format code for DD/MM/YYYY

--Display Student database with NZ date format
--This solution will add a column with the converted date format
SELECT *,
	CONVERT(NVARCHAR, S_DOB, 103) AS CONVERTED_S_DOB
FROM STUDENT;
GO

--Similar result using FORMAT() 
SELECT *,
  FORMAT(S_DOB, 'DD/MM/yyyy') AS new_date
FROM STUDENT;
GO

SELECT S_LASTNAME 
FROM STUDENT 
WHERE S_FIRSTNAME LIKE 'M%';
GO

SELECT S_FIRSTNAME
FROM STUDENT
WHERE S_DOB BETWEEN '1989-01-01' AND '2000-01-01'
AND S_LASTNAME LIKE '______%';
GO

ALTER TABLE STUDENT
DROP COLUMN S_ID;
GO

ALTER TABLE STUDENT
DROP COLUMN S_LASTNAME;
GO

ALTER TABLE STUDENT
RENAME COLUMN S_EMAIL to S_CONTACT;
GO

EXEC sp_rename 'STUDENT.S_EMAIL',  'S_CONTACT', 'COLUMN';
select * from student
GO
