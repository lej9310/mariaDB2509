SHOW DATABASES;
USE exDB;
SHOW TABLES;

drop TABLE Employees;

CREATE TABLE Employees (
	EmployeeID INT,
	LastName VARCHAR(20),
	FirstName	VARCHAR(20),
	BirthDate DATE,
	Photo	VARCHAR(20),
	Notes TEXT
);

SELECT * FROM Employees;
