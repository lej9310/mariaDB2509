-- 과정평가형 문제
-- CREATE DATABASE hrdtest;
-- SHOW DATABASES;

-- 테이블 생성 ================================================
DROP TABLE IF EXISTS Rental;
DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS book;

CREATE TABLE Book (
	BookID INT NOT NULL PRIMARY KEY,  -- PK
	Title VARCHAR(50) NOT NULL,
	Author VARCHAR(50),
	Publisher VARCHAR(50),
	Price INT,
	CHECK (Price >= 0),               -- CHECK 제약조건
	PubYear YEAR                      -- YYYY 형식	
);
DESC Book;

CREATE TABLE Member (
	MemberID INT NOT NULL PRIMARY KEY, -- PK	
	Name VARCHAR(50) NOT NULL,
	Phone VARCHAR(20),
	Address VARCHAR(100)
);
DESC Member;

CREATE TABLE Rental (
	RentalID CHAR(4) NOT NULL PRIMARY KEY,   -- PK
	MemberID INT,                        -- FK - Memeber
	BookID INT,                          -- FK - Book
	RentDate DATE,
	ReturnDate DATE NULL,
	FOREIGN KEY (MemberID)
		REFERENCES member (MemberID),     -- 참조 테이블: 두 테이블의 공통 열 >> MemberID
	FOREIGN KEY (BookID)
		REFERENCES book (BookID)          -- 참조 테이블: 두 테이블의 공통 열 >> BookID
);
DESC Rental;

-- SQL 작성 ================================================
-- Book 테이블: 데이터 삽입
insert into Book values(10, 'html', 'Author1', '한빛', '29000', '2018');
insert into Book values(20, 'css', 'Author2', '길벗', '30000', '2019');
insert into Book values(30, 'js', 'Author3', '한빛', '32000', '2020');
insert into Book values(40, 'figma', 'Author4', '길벗', '35000', '2020');
insert into Book values(50, 'java', 'Author5', '한빛', '40000', '2020');
insert into Book values(60, 'springboot', 'Author6', '에이콘', '38000', '2021');
select * from Book;

-- Member 테이블: 데이터 삽입
insert into Member values(901, '홍길동', '010-1111-0001', '경기도 수원시 수원역');
insert into Member values(902, '세종대황', '010-2222-0001', '경기도 수원시 장안구');
insert into Member values(903, '콩쥐', '010-3333-0001', '경기도 수원시 수원역');
insert into Member values(904, '일지매', '010-4444-0001', '경기도 수원시 수원역');
insert into Member values(905, '팥쥐', '010-5555-0001', '경기도 수원시 영통구');
insert into Member values(906, '박길동', '010-6666-0001', '경기도 수원시 장안구');
select * from member;

-- Rental 테이블: 데이터 삽입
insert into Rental values('R001', 901, 30, '2021-03-05', '2021-04-05');
insert into Rental values('R002', 901, 50, '2021-04-10', '2021-05-10');
insert into Rental values('R003', 902, 30, '2021-05-05', '2021-08-05');
insert into Rental values('R004', 901, 60, '2021-06-10', '2021-09-10');
insert into Rental(RentalID, MemberID, BookID, RentDate) values('R005', 903, 10, '2021-07-05');
insert into Rental(RentalID, MemberID, BookID, RentDate)	values('R006', 901, 20, '2021-08-10');
select * from Rental;


/*
-- 제약조건 확인
SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Book';
SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Member';
SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Rental';
*/

-- ================================================
-- 1. 2020년 이후 츨판된 도서 검색 
SELECT * FROM book WHERE PubYear >= 2020;

-- ================================================
-- 2. '홍길동' 회원이 대출한 도서 목록 출력
SELECT m.Name, b.BookID, b.Title, b.Author, b.Publisher, b.Price, b.PubYear, r.RentDate, r.ReturnDate
	FROM member m
	JOIN Rental r
		ON m.MemberID = r.MemberID
	JOIN Book b
		ON r.BookID = b.BookID
	WHERE m.Name = '홍길동';

-- ================================================
-- 3. 미반납 도서 정보 검색
SELECT * FROM rental r
	INNER JOIN book b
		ON r.BookID = b.BookID
	WHERE ReturnDate IS NULL;

-- ================================================
-- 4. 도서별 대출 횟수 출력
SELECT b.BookID, b.Title, COUNT(r.RentalID) AS RentalCount
	FROM Book b
	LEFT JOIN Rental r
		ON b.BookID = r.BookID
	GROUP BY b.BookID, b.Title
	ORDER BY RentalCount DESC;

-- ================================================
-- 5. 가격이 가장 비산 또서 출력
SELECT * FROM book
	ORDER BY price DESC
	LIMIT 1;
	
SELECT * FROM book
	WHERE Price = (SELECT MAX(Price) FROM book);