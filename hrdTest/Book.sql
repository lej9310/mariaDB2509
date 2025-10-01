-- 과정평가형 문제
CREATE DATABASE hrdtest;
SHOW DATABASES;

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

CREATE TABLE Member (
	MemberID INT NOT NULL PRIMARY KEY, -- PK	
	Name VARCHAR(50) NOT NULL,
	Phone VARCHAR(20),
	Address VARCHAR(100)
);

CREATE TABLE Rental (
	RentalID INT NOT NULL PRIMARY KEY,   -- PK
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
SHOW INDEX FROM Rental;  -- 인덱스 및 제약 조건을 확인


-- 1. 2020년 이후 츨판된 도서 검색
SELECT * FROM book WHERE PubYear >= 2020;

-- 2. '홍길동' 회원이 대출한 도서 목록 출력
SELECT b.BookID, b.Title, b.Author, b.Publisher, b.Price, b.PubYear, r.RentDate, r.ReturnDate
	FROM member m
	JOIN Rental r
		ON m.MemberID = r.MemberID
	JOIN Book b
		ON r.BookID = b.BookID
	WHERE m.Name = '홍길동';

-- 3. 미반납 도서 검색
SELECT * FROM rental
	WHERE ReturnDate IS NULL;

-- 4. 도서별 대출 횟수 출력
SELECT b.BookID, b.Title, COUNT(r.RentalID) AS RentalCount
	FROM Book b
	LEFT JOIN Rental r
		ON b.BookID = r.BookID
	GROUP BY b.BookID, b.Title
	ORDER BY RentalCount DESC;

-- 5. 가격이 가장 비산 또서 출력
SELECT * FROM book
	ORDER BY price DESC
	LIMIT 1;