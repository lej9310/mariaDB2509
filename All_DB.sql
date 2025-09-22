-- W3 예제: SELECT & INSERT INTO ======================
SHOW DATABASES;
CREATE DATABASE exDB;
-- DROP DATABASES testDB;

USE exDB;
SHOW TABLES;

CREATE TABLE ex1 (
	CustomerID INT,
	CustomerName VARCHAR(100),
	ContactName	VARCHAR(50),
	Address VARCHAR(50),
	City VARCHAR(20),
	PostalCode VARCHAR(20),
	Country VARCHAR(20)
);

-- Customers 테이블 만들고 값 추가 ======================================
CREATE TABLE Customers (
	CustomerID INT,
	CustomerName VARCHAR(100),
	ContactName	VARCHAR(50),
	Address VARCHAR(50),
	City VARCHAR(20),
	PostalCode VARCHAR(20),
	Country VARCHAR(20)
);

INSERT INTO Customers (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES (1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany');

INSERT INTO Customers VALUES (2,	'Ana Trujillo Emparedados y helados', 'Ana Trujillo',	'Avda. de la Constitución 2222', 'México D.F.',	'05021', 'Mexico');
INSERT INTO customers VALUES(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', '05023', 'Mexico');
INSERT INTO customers VALUES(4, 'Around the Horn', 'Thomas Hardy',	'120 Hanover Sq.', 'London', 'WA1 1DP', 'UK');
INSERT INTO customers VALUES(5, 'Berglunds snabbköp', 'Christina Berglund',	'Berguvsvägen 8', 'Luleå',	'S-958 22',	'Sweden');
INSERT INTO customers VALUES(6, 'Blauer See Delikatessen', 'Hanna Moos', 'Forsterstr. 57', 'Mannheim', '68306', 'Germany');
INSERT INTO customers VALUES(7, 'Blondel père et fils', 'Frédérique Citeaux', '24, place Kléber', 'Strasbourg', '67000', 'France');
INSERT INTO customers VALUES (8, 'Bólido Comidas preparadas', 'Martín Sommer', 'C/ Araquil 67', 'Madrid', '28023', 'Spain');
INSERT INTO customers VALUES(9, 'Bon app''', 'Laurence Lebihans', '12, rue des Bouchers', 'Marseille', '13008', 'France');
INSERT INTO customers VALUES(10, 'Bottom-Dollar Marketse', 'Elizabeth Lincoln', '23 Tsawassen Blvd.', 'Tsawassen', 'T2F 8M4', 'Canada');
INSERT INTO Customers VALUES (86, 'Die Wandernde Kuh', 'Rita Müller', 'Adenauerallee 900', 'Stuttgart', '70563', 'Germany');

SELECT * FROM customers;
SELECT COUNT(*) FROM customers;

-- 한 줄씩 추가한 데이터 확인
SELECT * FROM customers;

-- 전체 데이터 행의 갯수 세기 >> COUNT(*)
SELECT COUNT(*) FROM customers; -- 주의 COUNT와 () 사이에 공백 >> 오류
-- 원하는 필드만 선택
SELECT  CustomerName, City, Country FROM customers;


-- DISTINCT 예제 ======================================
-- customers 테이블에서 Country 필드의 모든 데이터 선택
SELECT Country FROM customers;

-- customers 테이블에서 Country 필드의 unique 값 선택(중복값 없음)
SELECT DISTINCT Country FROM customers;

-- customers 테이블에서 Country 필드의 unique 값 갯수 세기 : COUNT()
SELECT COUNT(DISTINCT Country) FROM customers;


-- WHERE절  ==================================================
-- Country 필드 중에 Mexico 모두 찾기
SELECT * FROM customers WHERE Country = 'Mexico';
-- CustomerID 필드 중에 1 값 모두 찾기
SELECT * FROM customers WHERE CustomerID = 1;


-- Procuct 테이블 생성 및 값 추가
CREATE TABLE Products(
	ProductID int,
	ProductName VARCHAR(50),
	SupplierID int,
	CategoryID int,
	Unit VARCHAR(50),
	Price DECIMAL(6,2)
)

drop TABLE Products;

SELECT * FROM Products;

-- 행 삭제 
-- DELETE FROM Products WHERE ProductID = 12;

-- 행 삽입 -  작은따옴표 두 개로 표기하면 하나의 작은따옴표로 해석
INSERT INTO Products VALUES(1, 'Chais', 1, 1, '10 boxes x 20 bags', 18.00);
INSERT INTO Products VALUES(2, 'Chang', 1, 1,	'24 - 12 oz bottles', 19.00);
INSERT INTO Products VALUES(3, 'Aniseed Syrup',	1,	2,	'12 - 550 ml bottles', 10.00);
INSERT INTO Products VALUES(4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22.00);
INSERT INTO Products VALUES(5, 'Chef Anton''s Gumbo Mix', 2, 2, '36 boxes', 21.35);
INSERT INTO Products VALUES(6, 'Grandma''s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25.00);
INSERT INTO Products VALUES(7, 'Uncle Bob''s Organic Dried Pears', 3, 7, '12 - 1 lb pkgs.', 30.00);
INSERT INTO Products VALUES(8, 'Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40.00);
INSERT INTO Products VALUES(9, 'Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97.00);
INSERT INTO Products VALUES(10, 'Ikura', 4, 8, '12 - 200 ml jars', 31.00);
INSERT INTO Products VALUES(11, 'Queso Cabrales', 5, 4, '1 kg pkg.', 21.00);
INSERT INTO Products VALUES(12, 'Queso Manchego La Pastora', 5, 4, '10 - 500 g pkgs.', 38.00);
INSERT INTO Products VALUES(13, 'Konbu', 6, 8, '2 kg box', 6.00);
INSERT INTO Products VALUES(14, 'Tofu', 6, 7, '40 - 100 g pkgs.', 23.25);
INSERT INTO Products VALUES(15, 'Genen Shouyu', 6, 2, '24 - 250 ml bottles', 15.50);
INSERT INTO Products VALUES(16, 'Pavlova', 7, 3, '32 - 500 g boxes', 17.45);
INSERT INTO Products VALUES(17, 'Alice Mutton', 7, 6, '20 - 1 kg tins', 39.00);
INSERT INTO Products VALUES(18, 'Carnarvon Tigers', 7, 8, '16 kg pkg.', 62.50);
INSERT INTO Products VALUES(19, 'Teatime Chocolate Biscuits', 8, 3, '10 boxes x 12 pieces', 9.20);
INSERT INTO Products VALUES(20, 'Sir Rodney''s Marmalade', 8, 3, '30 gift boxes', 81.00);
INSERT INTO Products VALUES(21, 'Sir Rodney''s Scones', 8, 3, '24 pkgs. x 4 pieces', 10.00);
INSERT INTO Products VALUES(22, 'Gustaf''s Knäckebröd', 9, 5, '24 - 500 g pkgs.', 21.00);
INSERT INTO Products VALUES(23, 'Tunnbröd', 9, 5, '12 - 250 g pkgs.', 9.00);
INSERT INTO Products VALUES(24, 'Guaraná Fantástica', 10, 1, '12 - 355 ml cans', 4.50);
INSERT INTO Products VALUES(25, 'NuNuCa Nuß-Nougat-Creme', 11, 3, '20 - 450 g glasses', 14.00);
INSERT INTO Products VALUES(26, 'Gumbär Gummibärchen', 11, 3, '100 - 250 g bags', 31.23);
INSERT INTO Products VALUES(27, 'Schoggi Schokolade', 11, 3, '100 - 100 g pieces', 43.90);
INSERT INTO Products VALUES(28, 'Rössle Sauerkraut', 12, 7, '25 - 825 g cans', 45.60);
INSERT INTO Products VALUES(29, 'Thüringer Rostbratwurst', 12, 6, '50 bags x 30 sausgs.', 123.79);
INSERT INTO Products VALUES(30, 'Nord-Ost Matjeshering', 13, 8, '10 - 200 g glasses', 25.89);
INSERT INTO Products VALUES(31, 'Gorgonzola Telino', 14, 4, '12 - 100 g pkgs', 12.50);
INSERT INTO Products VALUES(32, 'Mascarpone Fabioli', 14, 4, '24 - 200 g pkgs.', 32.00);
INSERT INTO Products VALUES(33, 'Geitost', 15, 4, '500 g', 2.50);
INSERT INTO Products VALUES(34, 'Sasquatch Ale', 16, 1, '24 - 12 oz bottles', 14.00);
INSERT INTO Products VALUES(35, 'Steeleye Stout', 16, 1, '24 - 12 oz bottles', 18.00);
INSERT INTO Products VALUES(36, 'Inlagd Sill', 17, 8, '24 - 250 g jars', 19.00);
INSERT INTO Products VALUES(37, 'Gravad lax', 17, 8, '12 - 500 g pkgs.', 26.00);
INSERT INTO Products VALUES(38, 'Côte de Blaye', 18, 1, '12 - 75 cl bottles', 263.50);
INSERT INTO Products VALUES(39, 'Chartreuse verte', 18, 1, '750 cc per bottle', 18.00);
INSERT INTO Products VALUES(40, 'Boston Crab Meat', 19, 8, '24 - 4 oz tins', 18.40);
INSERT INTO Products VALUES(41, 'Jack''s New England Clam Chowder', 19, 8, '12 - 12 oz cans', 9.65);
INSERT INTO Products VALUES(42, 'Singaporean Hokkien Fried Mee', 20, 5, '32 - 1 kg pkgs.', 14.00);
INSERT INTO Products VALUES(43, 'Ipoh Coffee', 20, 1, '16 - 500 g tins', 46.00);
INSERT INTO Products VALUES(44, 'Gula Malacca', 20, 2, '20 - 2 kg bags', 19.45);
INSERT INTO Products VALUES(45, 'Røgede sild', 21, 8, '1k pkg.', 9.50);
INSERT INTO Products VALUES(46, 'Spegesild', 21, 8, '4 - 450 g glasses', 12.00);
INSERT INTO Products VALUES(47, 'Zaanse koeken', 22, 3, '10 - 4 oz boxes', 9.50);
INSERT INTO Products VALUES(48, 'Chocolade', 22, 3, '10 pkgs.', 12.75);
INSERT INTO Products VALUES(49, 'Maxilaku', 23, 3, '24 - 50 g pkgs.', 20.00);
INSERT INTO Products VALUES(50, 'Valkoinen suklaa', 23, 3, '12 - 100 g bars', 16.25);
INSERT INTO Products VALUES(51, 'Manjimup Dried Apples', 24, 7, '50 - 300 g pkgs.', 53.00);
INSERT INTO Products VALUES(52, 'Filo Mix', 24, 5, '16 - 2 kg boxes', 7.00);
INSERT INTO Products VALUES(53, 'Perth Pasties', 24, 6, '48 pieces', 32.80);
INSERT INTO Products VALUES(54, 'Tourtière', 25, 6, '16 pies', 7.45);
INSERT INTO Products VALUES(55, 'Pâté chinois', 25, 6, '24 boxes x 2 pies', 24.00);
INSERT INTO Products VALUES(56, 'Gnocchi di nonna Alice', 26, 5, '24 - 250 g pkgs.', 38.00);
INSERT INTO Products VALUES(57, 'Ravioli Angelo', 26, 5, '24 - 250 g pkgs.', 19.50);
INSERT INTO Products VALUES(58, 'Escargots de Bourgogne', 27, 8, '24 pieces', 13.25);
INSERT INTO Products VALUES(59, 'Raclette Courdavault', 28, 4, '5 kg pkg.', 55.00);
INSERT INTO Products VALUES(60, 'Camembert Pierrot', 28, 4, '15 - 300 g rounds', 34.00);
INSERT INTO Products VALUES(61, 'Sirop d''érable', 29, 2, '24 - 500 ml bottles', 28.50);
INSERT INTO Products VALUES(62, 'Tarte au sucre', 29, 3, '48 pies', 49.30);
INSERT INTO Products VALUES(63, 'Vegie-spread', 7, 2, '15 - 625 g jars', 43.90);
INSERT INTO Products VALUES(64, 'Wimmers gute Semmelknödel', 12, 5, '20 bags x 4 pieces', 33.25);
INSERT INTO Products VALUES(65, 'Louisiana Fiery Hot Pepper Sauce', 2, 2, '32 - 8 oz bottles', 21.05);
INSERT INTO Products VALUES(66, 'Louisiana Hot Spiced Okra', 2, 2, '24 - 8 oz jars', 17.00);
INSERT INTO Products VALUES(67, 'Laughing Lumberjack Lager', 16, 1, '24 - 12 oz bottles', 14.00);
INSERT INTO Products VALUES(68, 'Scottish Longbreads', 8, 3, '10 boxes x 8 pieces', 12.50);
INSERT INTO Products VALUES(69, 'Gudbrandsdalsost', 15, 4, '10 kg pkg.', 36.00);
INSERT INTO Products VALUES(70, 'Outback Lager', 7, 1, '24 - 355 ml bottles', 15.00);
INSERT INTO Products VALUES(71, 'Fløtemysost', 15, 4, '10 - 500 g pkgs.', 21.50);
INSERT INTO Products VALUES(72, 'Mozzarella di Giovanni', 14, 4, '24 - 200 g pkgs.', 34.80);
INSERT INTO Products VALUES(73, 'Röd Kaviar', 17, 8, '24 - 150 g jars', 15.00);
INSERT INTO Products VALUES(74, 'Longlife Tofu', 4, 7, '5 kg pkg.', 10.00);
INSERT INTO Products VALUES(75, 'Rhönbräu Klosterbier', 12, 1, '24 - 0.5 l bottles', 7.75);
INSERT INTO Products VALUES(76, 'Lakkalikööri', 23, 1, '500 ml', 18.00);
INSERT INTO Products VALUES(77, 'Original Frankfurter grüne Soße', 12, 2, '12 boxes', 13.00);

-- Products 데이터 확인
SELECT * FROM Products;

-- 데이터 총계 확인(77개)
SELECT COUNT(DISTINCT ProductID) FROM Products;

-- Equal(=) 연산자
SELECT * FROM Products WHERE Price = 18;

-- Greater than(>) 연산자
SELECT * FROM Products WHERE Price > 30;
SELECT COUNT(*) FROM products WHERE Price > 30; -- 24

-- Less THAN(<) 연산자
SELECT * FROM Products WHERE Price < 30;
SELECT COUNT(*) FROM products WHERE Price < 30; -- 52

-- Greater than or equal(>=) 연산자
SELECT * FROM products WHERE Price >= 30;
SELECT COUNT(*) FROM products WHERE Price >= 30; -- 25

-- Less than or equal(<=) 연산자
SELECT * FROM products WHERE price <= 30;
SELECT COUNT(*) FROM products WHERE price <= 30; -- 53

-- Not equal(<>/ !=) 연산자
SELECT * FROM products WHERE price <> 18;
SELECT COUNT(*) FROM products WHERE price <> 18; -- 73

-- Between a certain range	(BETWEEN A AND B) 연산자
SELECT * FROM products WHERE price BETWEEN 50 AND 60;
SELECT COUNT(*) FROM products WHERE price BETWEEN 50 AND 60; -- 2

-- Search for a pattern	(LIKE) 연산자
SELECT * FROM Customers WHERE City LIKE 's%';

-- To specify multiple possible values for a column(IN) 연산자
SELECT * FROM customers WHERE City IN('Paris', 'London');


-- AND, OR, NOT 연산자 ========================================
USE exDB;
SHOW TABLES;

SELECT * FROM customers;
SELECT COUNT(*) FROM customers; -- 91

-- AND 연산자
SELECT * FROM customers WHERE Country = 'Germany' AND City = 'Berlin';

-- OR 연산자
SELECT * FROM customers WHERE Country = 'Barlin' OR City = 'Stuttgart';
SELECT * FROM customers WHERE Country = 'Germany' OR country = 'Spain';

-- NOT 연산자
SELECT * FROM customers WHERE not Country = 'Germany';

-- AND, OR, NOT 조합
SELECT * FROM customers WHERE Country = 'Germany' AND (City = 'Berlin' OR city = 'Stuttgart');
-- . ContactName이 'A'로 시작하고, Country가 'USA'가 아닌 행
SELECT * FROM customers WHERE ContactName LIKE 'A%' AND NOT Country = 'USA';


-- 정렬 ORDER BY =================================================================
SELECT * FROM customers ORDER BY Country; -- (default) ASC 생략 가능

-- Country 필드 내림차순 DESC
SELECT * FROM customers ORDER BY Country DESC;

-- 여러 필드 정렬
SELECT * FROM customers ORDER BY Country, CustomerName;

--필드별 오름차순 & 내림차순
SELECT * FROM customers ORDER BY Country ASC, CustomerName DESC;


-- IS NULL / IS NOT NULL 연산자 =================================================================
-- -- Address 필드 중 빈값
SELECT CustomerName, ContactName, Address FROM customers WHERE Address IS NULL;

-- Address 필드 중 빈값이 아닌 값 출력
SELECT CustomerName, ContactName, Address FROM customers WHERE Address IS NOT NULL;

