-- 과정평가형 문제

DROP TABLE IF EXISTS sale;
DROP TABLE IF EXISTS shopmember;

-- 테이블 생성 ================================================
CREATE TABLE ShopMember (
	CustNo INT PRIMARY KEY AUTO_INCREMENT,
	CustName VARCHAR(30) NOT NULL,
	Phone VARCHAR(13) UNIQUE,
	Address VARCHAR(50),
	JoinDate DATE NOT NULL,
	Grade CHAR(1),
	CHECK (Grade IN ('A', 'B', 'C', 'D')),
	City CHAR(2)
);
DESC ShopMember;

CREATE TABLE Sale (
	SaleNo INT PRIMARY KEY AUTO_INCREMENT,
	CustNo INT,
	PCost INT,  -- 단가
	Amount INT, -- 수량
	Price INT,  -- 금액
	PCode CHAR(3),
	FOREIGN KEY (CustNo)
		REFERENCES shopmember(CustNo)
);
DESC sale;

-- SQL 작성 ================================================
-- 1. 회원등록: ShopMember 테이블에 데이터 삽입
INSERT INTO ShopMember VALUES (NULL, '홍길동', '010-1234-5678', '서울시 깅남구', '2020-03-01', 'A', '01');
INSERT INTO ShopMember VALUES (NULL, '이순신', '010-2222-3333', '부산시 해운대구', '2021-03-15', 'B', '02');
INSERT INTO ShopMember VALUES (NULL, '강감찬', '010-7777-8888', '대구시 달서구', '2019-05-20', 'C', '03');
INSERT INTO ShopMember(CustName, Phone, Address, JoinDate, Grade, City) VALUES ('을지문덕', '010-8888-9999', '경기도 수원시', '2023-03-03', 'D', '04');
SELECT * FROM shopmember;

-- ================================================
-- 2. 회원 조회
-- (1) 고객등급이 A등급인 회의의 이름, 전화번호, 가입일자를 조회
SELECT CustName, Phone, JoinDate
	FROM shopmember
	WHERE Grade = 'A';

-- (2) 가입일자가 2020년 이후인 회원 조회
SELECT *	FROM shopmember
	WHERE JoinDate >= '2020-01-01';
	
SELECT *	FROM shopmember
	WHERE year(JoinDate) > '2020';

-- ================================================
-- 3. 판매 등록: Sale 테이블에 삽입
INSERT INTO Sale VALUES (NULL, 1, 1000, 10, 10000, 'P01');
INSERT INTO Sale VALUES (NULL, 2, 2000, 5, 10000, 'P02');
INSERT INTO Sale VALUES (NULL, 3, 1500, 7, 10500, 'P03');
INSERT INTO Sale(CustNo, PCost, Amount, Price, PCode) VALUES (4, 2050,10, 20500, 'P04');
SELECT * FROM sale;

-- ================================================
-- 4. 판매 조회
-- (1) 회원별 총 구매금액 산출(출력: 회원번호, 회원성명, 총금액)
SELECT m.CustNo, m.CustName, SUM(s.Price) AS TotalPrice
	FROM shopmember m
	left JOIN sale s
		ON	m.CustNo = s.CustNo
	GROUP BY m.CustNo, m.CustName;

SELECT m.CustNo, m.CustName, SUM(s.PCost * s.Amount) AS TotalPrice
	FROM shopmember m
	left JOIN sale s
		ON	m.CustNo = s.CustNo
	GROUP BY m.CustNo, m.CustName;

-- (2) 구매금액이 가장 높은 회원의 이름과 총금액 조회
SELECT m.CustNo, m.CustName, SUM(s.Price) AS TotalPrice
	FROM shopmember m
	INNER JOIN sale s
		ON	m.CustNo = s.CustNo
	GROUP BY m.CustName, m.CustName
	ORDER BY s.Price DESC
	LIMIT 1;
	
SELECT m.CustNo, m.CustName, SUM(s.PCost * s.Amount) AS TotalPrice
	FROM shopmember m
	INNER JOIN sale s
		ON	m.CustNo = s.CustNo
	GROUP BY m.CustName, m.CustName
	ORDER BY TotalPrice DESC
	LIMIT 1;

-- LIMIT 1 대신 HAVING절 사용
SELECT m.CustNo, m.CustName, SUM(s.Price) AS TotalPrice
	FROM ShopMember m
	INNER JOIN Sale s
		ON m.CustNo = s.CustNo
	GROUP BY m.CustNo, m.CustName
	HAVING TotalPrice = (
	    SELECT MAX(TotalPrice)
	    FROM (
	        SELECT SUM(s2.Price) AS TotalPrice
	        FROM ShopMember m2
	        INNER JOIN Sale s2
	      		ON m2.CustNo = s2.CustNo
	        GROUP BY m2.CustNo, m2.CustName
	    ) AS MaxPriceQuery
	)
	ORDER BY TotalPrice DESC;

-- ================================================
-- 5.데이터 수정/삭제
-- (1) '이순신' 회원의 등급을 A로 수정
UPDATE shopmember
	SET Grade = 'A'
	WHERE CustName = '이순신';
SELECT * FROM shopmember;

-- (2) CustNo = 3인 회원 삭제
-- Sale 테이블이 ShopMember 테이블을 외래키로 참조
-- 참조 무결성 제약 조건때문에 삭제 안 됨 => ON UPDATE CASCADE & ON DELETE CASCADE
ALTER TABLE sale
	ADD CONSTRAINT FK_CustNo
	FOREIGN KEY (CustNo)
		REFERENCES shopmember(CustNo)
	ON UPDATE CASCADE
	ON DELETE CASCADE;

DELETE FROM ShopMember
	WHERE CustNo = 3;
SELECT * FROM shopmember;
