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

DROP TABLE Products;

SELECT * FROM Products;

-- 행 삭제 
-- DELETE FROM Products WHERE ProductID = 12;

-- 행 삽입 -  작은따옴표 두 개로 표기하면 하나의 작은따옴표로 해석
-- 도구 >> CSV 파일 가져오기
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


-- IS NULL / IS NOT NULL 구문  =================================================================

-- -- Address 필드 중 빈값
SELECT CustomerName, ContactName, Address FROM customers WHERE Address IS NULL;

-- Address 필드 중 빈값이 아닌 값 출력
SELECT CustomerName, ContactName, Address FROM customers WHERE Address IS NOT NULL;


-- UPDATE 문 =================================================================

-- 변경 전: ContactName = 'Maria Anders', City = 'Berlin'
SELECT * FROM customers WHERE CustomerID = 1;

-- 첫 번째 고객(CustomerID = 1)을 새로운 연락처 와 새로운 도시로 업데이트
UPDATE customers
	SET ContactName = 'Alfred Schmidt', City = 'Frankfurt'
	WHERE CustomerID = 1;


-- 변경 전: Country = 'Mexico'인 데이터의 PostalCode 확인
SELECT PostalCode, Country FROM Customers WHERE Country = 'Mexico';

-- 여러 레코드 업데이트
UPDATE customers
	SET PostalCode = '00000'
	WHERE Country = 'Mexico';


-- DELETE 문 =================================================================

-- 고객 "Alfreds Futterkiste"를 삭제
DELETE FROM Customers WHERE CustomerName = 'Alfreds Futterkiste';
SELECT * FROM customers;

-- 원래 데이터 값 삽입(복구)
INSERT INTO customers VALUES (
	1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'
);

-- CustomerID로 정렬(temporary) >> 정렬된 순서로 테이블 복제 >> 교체
SELECT * FROM Customers ORDER BY CustomerID;

-- 1. 정렬된 순서로 테이블 복제(Customers_new)
CREATE TABLE Customers_new LIKE Customers;

INSERT INTO Customers_new
	SELECT * FROM Customers
	ORDER BY CustomerID;

-- 2. 교체
RENAME TABLE Customers TO Customers_backup,
	Customers_new TO customers;
	
-- 3. 교체 후 확인
SELECT * FROM customers; 

-- 4. 백업 테이블 정리(삭제)
DROP TABLE Customers_backup;


-- 테이블의 모든 행 삭제
-- DELETE FROM Customers;


--  LIMIT 절 :  반환할 레코드 수를 지정 ===========================================

-- "Customers" 테이블에서 처음 세 개의 레코드를 선택
SELECT * FROM Customers LIMIT 3;

-- 레코드 4에서 시작하여 3개의 레코드만 반환 >> OFFSET 3
SELECT * FROM Customers
	LIMIT 3 OFFSET 3;

-- "Germany"인 "Customers" 테이블에서 처음 세 개의 레코드
SELECT * FROM Customers
	WHERE Country='Germany'
	LIMIT 3;

-- 세 개의 레코드를 반환하기 전에 국가별로 고객을 정렬
SELECT * FROM Customers
ORDER BY Country
LIMIT 3;


-- MIN()/MAX() 함수 =================================================================

SELECT * FROM products;

-- 가장 저렴한 제품의 가격 찾기
SELECT MIN(Price) AS SmallestPrice FROM products;

-- 가장 비싼 제품의 가격 찾기
SELECT MAX(Price) AS LargestPrice FROM Products;


-- COUNT(), AVG() 및 SUM() 함수 ================================================
SELECT COUNT(*) FROM products;

SELECT COUNT(productID) FROM products;

SELECT AVG(Price) FROM Products;

SELECT SUM(Quantity) FROM orderdetails;


-- LIKE 연산자 =================================================================

--  "a"로 시작하는 CustomerName을 가진 모든 고객을 선택
SELECT * FROM Customers WHERE CustomerName LIKE 'a%'; -- 4개

-- CustomerName이 "a"로 끝나는 모든 고객을 선택
SELECT * FROM customers WHERE CustomerName LIKE '%a'; -- 7개

--  CustomerName에 "or"가 있는 모든 고객을 선택
SELECT * FROM Customers WHERE CustomerName LIKE '%or%';  -- 11개

-- 두 번째 위치에 "r"이 있는 CustomerName을 가진 모든 고객을 선택
SELECT * FROM Customers WHERE CustomerName LIKE '_r%';  -- 11개

-- "a"로 시작하고 길이가 3자 이상인 CustomerName을 가진 모든 고객을 선택
SELECT * FROM Customers WHERE CustomerName LIKE 'a__%'; --4개

-- "a"로 시작하고 "o"로 끝나는 ContactName을 가진 모든 고객을 선택
SELECT * FROM customers WHERE ContactName LIKE 'a%O'; -- 3개

-- "a"로 시작하지 않는 CustomerName을 가진 모든 고객을 선택
SELECT * FROM customers WHERE CustomerName NOT LIKE 'a%'; -- 87개


-- 와일드카드 =================================================================

--  "ber"로 시작하는 City를 가진 모든 고객을 선택
SELECT * FROM customers WHERE City LIKE 'ber%'; -- 3개

-- "es"를 포함하는 City를 가진 모든 고객을 선택
SELECT * FROM customers WHERE City LIKE '%es%'; -- 9개

-- City의 첫 번쨰 글자가 아무 문자로 시작하고 뒤에 "ondon"이 붙는 모든 고객을 선택
SELECT * FROM customers WHERE City LIKE '_ondon';  -- 6개

-- "L"로 시작하고, 그 뒤에 아무 문자나 오고, 그 뒤에 "n"이 오고, 그 뒤에 아무 문자나 오고, 그 뒤에 "on"이 오는 도시를 가진 모든 고객을 선택
SELECT * FROM customers WHERE City LIKE 'L_n_on';  -- 6개


-- IN 연산자 =================================================================
-- customers 테이블에서 Country가 "독일", "프랑스" 또는 "영국"인 모든 고객을 선택
SELECT * FROM customers WHERE Country 
	IN('Germany', 'France', 'UK'); -- 29개

-- Country가 "독일", "프랑스" 또는 "영국"이 아닌(NOT) 모든 고객을 선택
SELECT * FROM customers WHERE Country 
	NOT IN('Germany', 'France', 'UK'); -- 62개

-- 공급업체(Suppliers)와 동일한 국가에 있는 모든 고객을 선택
SELECT * FROM Customers WHERE Country 
	IN (SELECT Country FROM suppliers);

SELECT DISTINCT country FROM Customers;
SELECT DISTINCT country FROM suppliers;

-- 공급업체(Suppliers)의  국가를 포함하지 않는 모든 고객을 선택
SELECT * FROM Customers WHERE Country 
	NOT IN (SELECT Country FROM suppliers);


-- BETWEEN / NOT BETWEEN 연산자 =================================================================

-- 가격이 10~20 사이인 모든 제품을 선택
SELECT * FROM Products WHERE Price
	BETWEEN 10 AND 20;
	
-- 가격이 10~20 범위를 벗어나는(NOT) 제품
SELECT * FROM Products WHERE Price
	NOT BETWEEN 10 AND 20;

-- 가격이 10~20인 모든 제품 & CategoryID가 1, 2, 3인 제품은 제외
SELECT * FROM products WHERE Price 
	BETWEEN 10 AND 20
	AND CategoryID NOT IN (1,2,3);

-- "Carnarvon Tigers"와 "Mozzarella di Giovanni" 사이의 ProductName을 가진 모든 제품을 선택 후 정렬
SELECT * FROM products
	WHERE ProductName
	BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
	ORDER BY ProductName;

-- "Carnarvon Tigers"와 "Chef Anton's Cajun Seasoning" 사이 ProductName을 가진 모든 제품
SELECT * FROM products
	WHERE ProductName
	BETWEEN "Carnarvon Tigers" AND "Chef Anton's Cajun Seasoning"
	ORDER BY ProductName;

-- Orders 테이블에서 OrderDate가 '01-July-1996'과 '31-July-1996' 사이인 모든 주문
SELECT * FROM orders
	WHERE OrderDate
	BETWEEN '1996-07-01' AND '1996-07-31'
	ORDER BY OrderDate;


-- 별칭(alias) >> AS 키워드 ============================================================
--  테이블/테이블의 열에 임시 이름을 부여하는 데 사용
-- 별칭은 해당 쿼리가 지속되는 동안만 존재

-- 1. 열 별칭 예제 ====
-- CustomerID 열에 대한 별칭 & CustomerName 열에 대한 별칭 생성
SELECT CustomerID AS ID, CustomerName AS Customer
	FROM customers;

-- CustomerName 열과 ContactName 열에 대한 별칭 생성
SELECT CustomerName AS Customer, ContactName AS "Contact Person"
	FROM Customers;

-- 4개의 열(Address, PostalCode, City, Country)을 결합 => "Address" 별칭 생성
SELECT CustomerName, -- 고객 이름 필드는 그대로 가져오기
	-- CONCAT_WS(): “Concatenate With Separator”의 줄임말로, 지정한 구분자와 함께 여러 값을 이어 붙이는 함수
	--	첫 번째 인자: 값들 사이에 넣을 구분자
	-- 이후 인자: 이어 붙일 필드 >> Address, PostalCode, City, Country
	--	CONCAT_WS() NULL 값 처리 >> 자동 Skip(', ' 구분자도 함께 생략)
	CONCAT_WS(', ', Address, PostalCode, City, Country) AS Address
	FROM Customers;


-- 2. 테이블 별칭 예제 ====
-- CustomerID=4(CustomerName=Around the Horn)인 고객의 모든 주문 검색 =>
-- "Customers" 테이블과 "Orders" 테이블을 사용하고, 각각 "c"와 "o"라는 테이블 별칭을 지정
SELECT c.CustomerID, c.CustomerName, o.OrderID, o.OrderDate
	FROM Customers AS c, Orders AS o -- 별침 지정
	-- 필터 및 조인 조건
	-- 첫 번째 조건: 고객명이 ‘Around the Horn’인 고객만 선택
	-- 두 번째 조건: Customers의 CustomerID와 Orders의 CustomerID(외래키)가 같을 때만 조인(행 연결)
	WHERE c.CustomerName = 'Around the Horn' AND c.CustomerID = o.CustomerID;


-- 조인(JOIN) ============================================================
-- 두 개 이상의 테이블에서 관련된 열을 기준으로 행을 결합
-- INNER JOIN: 두 테이블 모두에서 일치하는 값이 있는 레코드 반환
-- LEFT JOIN: 왼쪽 테이블의 모든 레코드와 오른쪽 테이블의 일치하는 레코드를 반환
-- RIGHT JOIN: 오른쪽 테이블의 모든 레코드와 왼쪽 테이블의 일치하는 레코드를 반환
-- CROSS JOIN: 두 테이블의 모든 레코드를 반환

-- "CustomerID"로 조인
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
	FROM Orders
	INNER JOIN Customers
		ON Orders.CustomerID = Customers.CustomerID;
	
SELECT o.OrderID, c.CustomerName, o.OrderDate
	FROM Orders AS o           -- 별침 지정
	INNER JOIN Customers AS c  -- 별침 지정
		ON o.CustomerID = c.CustomerID;  -- related column >> CustomerID


-- 조인(JOIN) >> INNER JOIN 키워드 ======
-- 세 개의 테이블 조인 >> 
-- 고객 및 운송업체 정보가 있는 모든 주문을 선택
SELECT o.OrderID, c.CustomerName, s.ShipperName
	FROM ((orders AS o        -- 별침 지정
	INNER JOIN Customers AS c -- 별침 지정
		ON o.CustomerID = c.CustomerID)  -- related column >> CustomerID
	INNER JOIN Shippers AS s  -- 별침 지정
		ON o.ShipperID = s.ShipperID);   -- related column >> ShipperID


-- 조인(JOIN) >> LEFT JOIN 키워드 ======
-- 왼쪽 테이블(Customers)을 기준으로, 오른쪽 테이블(Orders)에 일치하는 레코드가 있는 경우 반환
-- 모든 고객과 그들이 가진 주문
SELECT c.CustomerID, c.CustomerName, o.OrderID
	FROM customers AS c
	LEFT JOIN Orders AS o
		ON c.CustomerID = o.CustomerID   -- related column >> CustomerID
	ORDER BY c.CustomerName;


-- 조인(JOIN) >> RIGHT JOIN 키워드 ======
-- 모든 직원과 그들이 주문한 모든 주문을 반환
SELECT o.OrderID, e.LastName, e.FirstName
	FROM orders AS o
	RIGHT JOIN employees AS e
		ON o.EmployeeID = e.EmployeeID   -- related column >> EmployeeID
	ORDER BY o.OrderID;


-- 조인(JOIN) >> CROSS JOIN 키워드 ======
-- 두 테이블의 모든 레코드 반환 >> 합집합

-- 모든 고객과 모든 주문
SELECT c.CustomerName, o.OrderID
	FROM customers AS c
	CROSS JOIN orders AS o;

-- 모든 고객아이디과 모든 주문날짜
SELECT c.CustomerID, o.OrderDate
	FROM customers AS c
	CROSS JOIN orders AS o;
	

-- 조인(JOIN) >> SELF JOIN 키워드 ======

-- Customers 테이블 내에서 같은 도시에 있는 고객을 매칭
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
	-- Customers 테이블을 두 번 참조하여 각각 A, B라는 별칭으로 사용
	FROM customers A, customers B  
	-- 같은 고객을 자기 자신과 매칭하는 것을 방지
	WHERE A.CustomerID <> B.CustomerID\
	-- 두 고객이 같은 도시에 거주하는 경우만 매칭
	AND A.City = B.City
	ORDER BY A.City;

-- 위와 동일코드로 아래의 현대적 표기를 권장 
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, B.City
	FROM customers AS A
	JOIN customers AS B 
		ON A.City = B.City 
		AND A.CustomerID <> B.CustomerID	
	ORDER BY A.City;


-- UNION 연산자: 중복 행 자동 제거하여 반환 ==================================================
-- 두 개 이상의 SELECT 결과 집합을 수직으로 합쳐 하나의 결과 집합으로 반환
-- 사용 조건:
	-- 각 SELECT절이 반환하는 컬럼 개수가 동일
	-- 동일 위치의 컬럼끼리 데이터 타입 호환(예: 정수-정수, 문자-문자)
	-- 최종 결과의 컬럼명: 첫 번째 SELECT의 컬럼명
	-- 정렬: 마지막에 한 번만 ORDER BY 사용

SHOW DATABASES;
USE exdb;

-- "Customers"와 "Suppliers" 테이블에서 도시(고유값만)를 반환
SELECT City FROM Customers
	UNION                       -- UNION: 중복 제거하여 합치기 <> UNION ALL: 중복값 포함
	SELECT City FROM Suppliers
	ORDER BY City;              -- 정렬은 마지막에 한 번  >> 중복값 없음 확인

-- where절 사용
-- "Customers"와 "Suppliers" 테이블에서 독일(고유값만) 반환
SELECT City, Country FROM Customers
	WHERE Country = 'Germany'
	UNION                       -- UNION: 중복 제거하여 합치기 <> UNION ALL: 중복값 포함
	SELECT City, Country FROM Suppliers
	WHERE Country = 'Germany'
	ORDER BY City;              -- 정렬은 마지막에 한 번 >> 중복값 없음 확인

-- 모든 고객과 공급업체 나열
SELECT 'Customer' AS Type, ContactName, City, Country  -- 'Customer': 고정 문자열 값 >> 별칭 설정
	FROM Customers
	UNION                       -- UNION: 중복 제거하여 합치기 <> UNION ALL: 중복값 포함
	-- 첫 번째 SELECT의 컬럼명 규칙에 따름 >> 'Suppliers'가 Type으로 
	SELECT 'Suppliers', ContactName, City, Country
	FROM Suppliers;


-- UNION ALL 연산자: 중복 포함해 모두 반환 ==================================================

-- "Customers"와 "Suppliers" 테이블에서 도시(중복값 포함) 반환 
SELECT City FROM Customers
	UNION ALL                   -- UNION ALL: 중복값 포함 <> UNION: 중복 제거하여 합치기 
	SELECT City FROM Suppliers
	ORDER BY City;              -- >> 정렬해서 중복값 확인
	
-- WHERE절 사용
-- "Customers"와 "Suppliers" 테이블에서 독일 도시(중복값 포함) 반환
SELECT City, Country FROM Customers
	WHERE Country = 'Germany'
	UNION ALL                   -- UNION ALL: 중복값 포함 <> UNION: 중복 제거하여 합치기 
	SELECT City, Country FROM Suppliers
	WHERE Country = 'Germany'
	ORDER BY City;              -- >> 정렬해서 중복값 확인


-- GROUP BY문 ==================================================
-- 집계 함(COUNT(), MAX(), MIN(), SUM(), AVG())와 함께 사용

-- 각 국가의 고객 수를 나열 
SELECT Country AS 국가, COUNT(CustomerID) AS 고객수  -- 컬러명에 빈칸 X >> 오류 
	FROM customers
	GROUP BY Country
	ORDER BY COUNT(CustomerID) DESC; -- 고객 수가 높은 순으로 정렬

--  각 운송업체가 보낸 주문 수 집계 >> 내림차순으로 정렬 >> 상위 1건만 선택
SELECT s.ShipperName AS 운송업체, COUNT(o.OrderID) AS 주문수
	FROM orders AS o
	LEFT JOIN shippers AS s
		ON o.ShipperID = s.ShipperID
	GROUP BY s.ShipperName         -- 운송업체별 주문수 집계
	ORDER BY 주문수 DESC           -- 내림차순 정렬
	LIMIT 1;                       -- 상위 1건 선택


-- HAVING 절 ==================================================
-- WHERE: 그룹화(집계) 이전에 행(Row)을 필터링 >>  개별 행 기준 조건만 사용 가능 >> 집계함수 사용 불가
-- HAVING: GROUP BY로 그룹이 생성된 이후, 집계 결과를 기준으로 그룹을 필터링

-- 국가별  고객수 나열 >> 고객이 5명 이상인 국가만 선택
SELECT Country, COUNT(CustomerID) AS NumOfCustomer  -- 함수와 괄호 사이 띄지 말것 >> Count () 오류
	FROM Customers
	GROUP BY Country
	HAVING COUNT(CustomerID) > 5  -- HAVING절 >> 집계 결과 필터링
	ORDER BY NumOfCustomer DESC;  -- 고객 수가 높은 순으로 정렬

-- 주문이 10건 이상인 직원의 성과 주문수 조회
SELECT e.LastName AS 이름_성, COUNT(o.OrderID) AS 주문수
	FROM (orders AS o
	INNER JOIN employees AS e
		ON o.EmployeeID = e.EmployeeID)
	GROUP BY 이름_성
	HAVING 주문수 > 10     -- HAVING절 >> 집계 결과 필터링
	ORDER BY 주문수 DESC;  -- 내림차순

-- WHERE절과 HAVING절 사용	
-- 성이 "Davolio" 또는 "Fuller"이고 주문이 25건 이상인 직원 조회
SELECT e.LastName AS 이름_성, COUNT(o.OrderID) AS 주문수
	FROM orders AS o
	INNER JOIN employees AS e
	ON o.EmployeeID = e.EmployeeID
	WHERE LastName = 'Davolio' OR LastName = 'Fuller' -- WHERE절 >> 행 필터링
	GROUP BY 이름_성
	HAVING 주문수 > 25;                               -- HAVING절 >> 집계 결과 필터링


-- EXISTS 연산자: 존재 여부 판단 ==================================================
-- 하위 쿼리에 레코드가 있는지 테스트
-- 하위 쿼리가 하나 이상의 레코드 >> TRUE 반환

-- TRUE를 반환 >> 제품 가격이 20 미만인 공급업체를 필터링  => price 컬럼은 없음
SELECT s.SupplierName
	FROM suppliers AS s
	WHERE EXISTS (      -- 존재 여부만 판단
		SELECT ProductName
		FROM products AS p
		WHERE p.SupplierID = s.SupplierID AND p.Price < 20
		)
		ORDER BY s.SupplierName;

-- 조인으로 조건 필터링 후 공급업체와 가격 둘다 보기
SELECT s.SupplierName, p.Price	
	FROM suppliers AS s
	JOIN products AS p
		ON	p.SupplierID = s.SupplierID AND p.Price < 20
	ORDER BY s.SupplierName;
		
--  제품 가격이 22인 공급업체 필터링 >> New Orleans Cajun Delights
SELECT supplierName
	FROM suppliers AS s
	WHERE EXISTS (
		SELECT ProductName
		FROM products AS p
		WHERE p.SupplierID = s.SupplierID  AND p.price = 22
		);


-- ANY / ALL 연산자 ==================================================

-- ANY: 하위 쿼리 값 중 하나라도 조건 충족 >> TRUE
--  OrderDetails 테이블에서 Quantity가 10인 레코드가 하나라도 있으면 Products 테이블의 ProductName을나열
SELECT * FROM orderdetails;
SELECT * FROM Products;

SELECT ProductName
	FROM products
	WHERE ProductID = ANY (  -- ANY: 하나라도 조건 충족 <> ALL: 모든 조건 충족
		SELECT ProductID
		FROM orderdetails
		WHERE Quantity = 10
		)
	ORDER BY ProductName;

-- JOIN
-- Orderdetails 테이블의 수량이 10인 상품의 ProductID를 추출해 Products 테이블과 매칭해서 상품명과 수량 컬럼 나열
-- 동일 상품을 수량 10으로 여러번 주문했으면 중복 행  >> DISTINCT 사용
SELECT DISTINCT p.ProductName, o.Quantity 
	FROM products AS p
	JOIN orderdetails AS o
		ON o.ProductID = p.ProductID
	WHERE o.Quantity = 10;

-- OrderDetails 테이블에서 Quantity가 99보다 큰 레코드가 하나라도 있으면 Products 테이블의 ProductName을 나열
SELECT ProductName
	FROM products
	WHERE ProductID = ANY(  -- ANY: 하나라도 조건 충족 <> ALL: 모든 조건 충족
		SELECT ProductID
		FROM orderdetails
		WHERE Quantity > 99
		)
	ORDER BY ProductName;
	
-- OrderDetails 테이블에서 Quantity가 1000보다 큰 레코드가 하나라도 있으면 Products 테이블의 ProductName 나열
SELECT * FROM orderdetails WHERE Quantity > 1000; -- 레코드 없음 >> FALSE

SELECT ProductName
	FROM Products
	WHERE ProductID = ANY(  -- ANY: 하나라도 조건 충족 <> ALL: 모든 조건 충족
		SELECT ProductID
		FROM OrderDetails
		WHERE Quantity > 1000
		)
	ORDER BY ProductName;

-- 모든 제품 이름을 나열
SELECT ALL ProductName
	FROM Products
	WHERE TRUE;

-- ALL: 모든 하위 쿼리 값이 조건을 충족하는 경우 >> TRUE
-- OrderDetails 테이블에서 Quantity = 10인 모든 행의 ProductID와 “모두 동일한지” 비교하여, 그 값들과 모두 같을 때만 해당 ProductName을 추출
SELECT ProductName
	FROM products
	WHERE ProductID = ALL( -- ALL: 하위 쿼리의 모든 조건을 충족 >> 결과: FALSE
	SELECT ProductID
		FROM OrderDetails
		WHERE Quantity = 10
		);


-- INSERT INTO SELECT문 ==================================================
-- 테이블의 데이터를 복사 => 다른 테이블에 삽입
SELECT * FROM customers; -- 91
SELECT * FROM suppliers; -- 29

-- suppliers 테이블의 열을 선택&복사해서 customers 테이블에 삽입
INSERT INTO customers (CustomerName, City, Country)
	SELECT SupplierName, City, Country
	FROM suppliers; -- 120

-- suppliers 테이블의 전체 열을 선택&복사해서 customers 테이블에 삽입
INSERT INTO customers (CustomerName, ContactName, Address, City, PostalCode, Country)
	SELECT SupplierName, ContactName, Address, City, PostalCode, Country
	FROM suppliers;
SELECT * FROM customers; -- 149개

-- suppliers 테이블의 조건열(나라=독일)을 선택&복사해서 customers 테이블에 삽입
INSERT INTO customers (CustomerName, City, Country)
	SELECT SupplierName, City, Country
	FROM suppliers
	WHERE Country = 'Germany';
SELECT * FROM customers; -- 152개


-- CASE문 ====================================================================================================
-- 위에서 아래 순서로 조건 평가
-- 어떤 WHEN도 만족하지 않으면 ELSE 절의 값을 반환

CREATE TABLE orderdetails2 AS
	SELECT * FROM orderdetails;
SELECT * FROM orderdetails2;
SHOW TABLES;

-- 방법1. 새로운 열 추가 
-- 1) orderdetails 수량텍스트(Quantity_TEXT)열 추가 >> ALTER TABLE - ADD  =>
ALTER TABLE orderdetails2
	ADD Quantity_TEXT VARCHAR(50);
orderdetails3

-- 2) 값 채우기 >> UPDATE - SET & CASE WHEN - ELSE
UPDATE orderdetails2
	SET Quantity_TEXT = CASE 
		WHEN Quantity > 30 THEN 'The quantity is greater than 30'
		WHEN Quantity = 30 THEN 'The quantity is 30'
		ELSE 'The quantity is under 30'
	END AS Quantity_TEXT
	WHERE OrderDetailID IS NOT NULL;
SELECT * FROM orderdetails2;
		
-- 방법2. Quantity_TEXT 값을 뷰에서 계산하여 포함하는 뷰 생성
CREATE OR REPLACE VIEW orderdetails3 AS                -- orderdetails3 뷰 생성
	SELECT o2.OrderDetailID, o2.ProductID, o2.Quantity, -- 마지막 콤마(,) 빠지면 >> 오류
	CASE
		WHEN o2.Quantity > 30 THEN 'The quantity is greater than 30'
		WHEN o2.Quantity = 30 THEN 'The quantity is 30'
		ELSE 'The quantity is under 30'
		END AS Quantity_TEXT
	FROM orderdetails2 AS o2
	INNER JOIN products AS p                            -- products 테이블과 조인
		ON o2.ProductID = p.ProductID ;
SELECT * FROM orderdetails3;

-- 수량 조건에 따라 수량텍스트 삽입
SELECT OrderID, Quantity,
	CASE
		WHEN Quantity > 30 THEN 'The quantity is greater than 30'
		WHEN Quantity = 30 THEN 'The quantity is 30'
		ELSE 'The quantity is under 30'  -- ELSE: 위 조건에 모두 해당하지 않는 경우
	END AS QuantityText                 -- END: CASE 표현식의 끝 / CASE 표현식 결과를 QuantityText로 별칭
	FROM orderdetails
	ORDER BY Quantity;
	
SELECT o.OrderID, SUM(o.Quantity) AS QtySum,
	CASE
		WHEN SUM(o.Quantity) > 30 THEN 'The count is greater than 30'
		WHEN SUM(o.Quantity) = 30 THEN 'The count is 30'
		ELSE 'The quantity is under 30'
	END AS QunatityText
	FROM orderdetails AS o
	GROUP BY o.OrderID
	ORDER BY QtySUM DESC
	LIMIT 10;

-- 고객을 도시별로 정렬(도시가 NULL이면 국가별로 정렬)
SELECT CustomerName, City, Country
	FROM customers
	ORDER BY (
	CASE
		WHEN City IS NULL THEN Country
		ELSE City
	END
	);


-- Null 함수: IFNULL() /  COALESCE() ==================================================
-- 데이터베이스 exdb 내에서 컬럼명이 Price인 테이블 찾기
SELECT table_schema, table_name, column_name
FROM information_schema.columns
WHERE column_name = 'UnitsInStock'
AND table_schema = 'exdb';

CREATE TABLE Products_new(
	P_Id INT PRIMARY KEY ,
	ProductName VARCHAR(20),
	UnitPrice DECIMAL(5,2),
	UnitsInStock INT,
	UnitsOnOrder INT
);

SELECT * FROM products_new;

INSERT INTO products_new VALUES(1, 'Jarlsberg', 10.45, 16, 15);
INSERT INTO products_new VALUES(2, 'Mascarpone', 32.56, 23, NULL);
INSERT INTO products_new VALUES(3, 'Gorgonzola', 15.67, 9, 20);

SELECT ProductName, UnitPrice * (UnitsInStock + UnitsOnOrder) AS TotalPrice
	FROM products_new;

-- IFNULL() 함수: NULL인 경우 대체 값 반환 >> UnitsOnOrder가 NUlL인 경우 0을 반환
SELECT ProductName, UnitPrice * (UnitsInStock + IFNULL(UnitsOnOrder,0)) AS TotalPrice
	FROM products_new;

-- COALESCE() 함수: NULL인 경우 대체 값 반환 >> UnitsOnOrder가 NUlL인 경우 0을 반환
SELECT ProductName, UnitPrice * (UnitsInstock + COALESCE(UnitsOnOrder, 0))
	FROM products_new;


-- 연산자 ===========================================================================
USE exdb;

-- ALL
-- products 중에서 Price가 500을 초과하는 상품(결과: NULL)보다 더 비싼 상품 >> 전체 레코드 추출: 총 77개
-- “Price > ALL(서브쿼리)”에서 서브쿼리가 빈 집합(NULL)이면 비교는 항상 TRUE가 되어 전체 레코드가 추출
SELECT COUNT(*) AS 총계_가격_500초과
	FROM products
	WHERE Price > ALL(
			SELECT Price
			FROM products
			WHERE Price > 500
			)
	ORDER BY Price DESC;

-- AND
SELECT * FROM customers
	WHERE City = "London" AND Country = "UK";  -- 6개

-- ANY
-- products 중에서 Price가 50을 초과하는 상품보다 더 비싼 상품
SELECT * FROM products
	WHERE Price > ANY (
		SELECT Price
		FROM Products
		WHERE Price > 50  -- 6개
	);

-- BETWEEN
SELECT * FROM products
	WHERE price
	BETWEEN 50 AND 60; -- 2개

-- EXISTS
SELECT * FROM products 
	WHERE EXISTS (
		SELECT price
		FROM Products
		WHERE Price > 50
		)
	ORDER BY Price DESC
	LIMIT 20;

-- IN
SELECT * FROM customers
	WHERE City IN ('Paris', 'London')
	ORDER BY City;  -- 8개


SELECT COUNT(*) FROM customers; -- 총 91

-- LIKE
SELECT COUNT(*) FROM customers
	WHERE City LIKE 's%'; -- 12개

-- NOT LIKE
SELECT COUNT(*) FROM customers
	WHERE City NOT LIKE 's%'; -- 79개

-- OR
SELECT COUNT(*) FROM Customers
	WHERE City = 'London' OR Country = 'UK'; -- 7개

-- SOME
SELECT * FROM Products
	WHERE Price > SOME (
		SELECT price
		FROM Products
		WHERE Price > 20
		)
	ORDER BY Price
	LIMIT 1,10;


-- Database ================================================================================

-- create db =============================
CREATE DATABASE testDB;

-- drop db =============================
DROP DATABASE testDB;

-- create table =============================
USE exdb;
CREATE TABLE Persons(
	PersonID INT,
	LastName VARCHAR(255),
	FirstName VARCHAR(255),
	Adress VARCHAR(255),
	City VARCHAR(255)
);
SELECT * FROM Persons;

-- testTable 생성 ====
CREATE TABLE testTable AS
	SELECT customername, contactname
	FROM customers;

SELECT * FROM testtable;

-- testTable2 생성
CREATE TABLE testTable2 AS
	SELECT * FROM customers;

SELECT * FROM testTable2;

-- drop table =============================
DROP TABLE testtable;
SHOW TABLES; -- testtable 삭제 확인


-- Truncate table =======================================================
-- 테이블은 삭제되지 않지만, 내부의 데이터는 삭제
TRUNCATE TABLE testtable2;
SELECT * FROM testTable2;


-- ALTER TABLE ==========================================================
-- ALTER TABLE - ADD: 테이블에 열 추가
ALTER TABLE testtable2
	ADD Email VARCHAR(255);
SELECT * FROM testtable2; -- 마지막 열에 Email 추가된 것 확인


-- ALTER TABLE - DROP COLUMN: 테이블에 열 삭제
ALTER TABLE testtable2
	DROP COLUMN Email;
SELECT * FROM testtable2; -- 마지막 열에 Email 삭제된 것 확인


-- ALTER TABLE - MODIFY COLUMN: 테이블의 열 데이터 유형 변경
SHOW TABLES;
INSERT INTO persons VALUES (1, 'Hansen', 'Ola', 'Timoteivn 10', 'Sandnes');
INSERT INTO persons VALUES (2, 'Svendson', 'Tove', 'Borgvn 23', 'Sandnes');
INSERT INTO persons VALUES (3, 'Pettersen', 'Kari', 'Storgt 20', 'Stavanger');
SELECT * FROM persons;

-- 마지막 열에 DateOfBirth 생성(유형: DATE)
ALTER TABLE persons
	ADD DateOfBirth DATE;
SELECT * FROM persons;

-- DateOfBirth 열의 유형 변경: DATE >> YEAR
ALTER TABLE persons
	MODIFY COLUMN DateOfBirth YEAR; 

-- DateOfBirth열 이름 변경 >> YearOfBirth
-- ALTER (TABLE 테이블 이름) CHANGE (기존열이름  새열이름  데이터타입)
ALTER TABLE persons
	CHANGE DateOfBirth YearOfBirth YEAR;
SELECT * FROM persons;

-- DateOfBirth 열에 값 삽입
UPDATE persons
	SET YearOfBirth = CASE PersonID
		WHEN 1 THEN 2025
		WHEN 2 THEN 2024
		WHEN 3 THEN 2023
		ELSE YearOfBirth
	END
	WHERE YearOfBirth IS NULL;
SELECT * FROM persons;

-- DateOfBirth 열 생성(유형: date)
ALTER TABLE persons
	ADD DateOfBirth DATE;
SELECT * FROM persons;

-- YearOfBirth를  값 삽입
UPDATE persons
	SET DateOfBirth = CASE
	    WHEN YearOfBirth IS NOT NULL
		 	THEN STR_TO_DATE(CONCAT(CAST(YearOfBirth AS CHAR), '-01-01'), '%Y-%m-%d')
	    ELSE DateOfBirth
	END
	WHERE DateOfBirth IS NULL;
SELECT * FROM persons;

-- 새로운 열(여러개) 생성하고 다시 지우기
ALTER TABLE persons
	ADD DateOfBirth2 DATE,
	ADD DateOfBirth3 DATE; -- 데이터 타입 같이 입력!
SELECT * FROM persons;
	
ALTER TABLE persons
	DROP COLUMN DateOfBirth2,
	DROP COLUMN DateOfBirth3;	
SELECT * FROM persons;


-- 제약 조건  ==========================================================
-- NOT NULL: 열에 NULL 값 없음
-- UNIQUE: 열의 모든 값이 서로 다름(중복값 없음)
-- PRIMARY KEY: UNIQUE테이블의 각 행을 고유하게 식별
-- FOREIGN KEY: 테이블 간 링크 파괴 방지
-- CHECK: 열 값이 특정 조건을 충족하는지 확인
-- DEFAULT: 값이 지정되지 않은 경우, 열 기본값 설정
-- CREATE INDEX: 데이터베이스에서 빠르게 데이터 생성/검색









