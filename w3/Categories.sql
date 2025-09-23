SHOW DATABASES;
USE exDB;
SHOW TABLES;

drop TABLE categories;

CREATE TABLE Categories (
	CategoryID INT,
	CategoryName VARCHAR(20),
	Description VARCHAR(80)
);

SELECT * FROM Categories;
