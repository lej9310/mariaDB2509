-- 과정평가형 문제
CREATE DATABASE hrdtest;
SHOW DATABASES;

CREATE TABLE Book (
	BookID INT NOT NULL,
		PRIMARY KEY (BookID),          -- PK
	Title VARCHAR(50) NOT NULL,
	Author VARCHAR(50),
	Publisher VARCHAR(50),
	Price INT,
	CHECK (Price >= 0),               -- CHECK 제약조건
	PubYear YEAR                      -- YYYY 형식
);

CREATE TABLE member (
	MemberID INT NOT NULL,
			PRIMARY KEY (MemberID),
	Name VARCHAR(50) NOT NULL,
	Phone VARCHAR(20),
	Address VARCHAR(100)
);

CREATE TABLE Rental (
	RentalID INT NOT NULL,
			PRIMARY KEY (RentalID),        -- PK,		
	MemberID INT NOT NULL,               -- FK - Memeber
	BookID INT NOT NULL,                 -- FK - Book
	RentDate DATE NOT NULL,
	ReturnDate DATE,
	FOREIGN KEY (MemberID)
		REFERENCES Member (MemberID),     -- 참조 테이블: 두 테이블의 공통 열 >> MemberID
	FOREIGN KEY (BookID)
		REFERENCES Book(BookID)          -- 참조 테이블: 두 테이블의 공통 열 >> BookID
);
DESC Rental;
SHOW INDEX FROM Rental;  -- 인덱스 및 제약 조건을 확인



-- 1. 2020년 이후 츨판된 도서 검색
SELECT * FROM book WHERE PubYear >= 2020;

-- 2. '홍길동' 회원이 대출한 도서 목록 출력
SELECT r.RentalID, r.MemberID, r.BookID, r.RentDate, r.ReturnDate, m.Name
	 FROM rental AS r
	INNER JOIN Member AS m
		ON r.MemberID = m.MemberID
	WHERE m.Name = '홍길동';

-- 3. 미반납 도서 검색
SELECT * FROM rental
	WHERE ReturnDate IS NULL;

-- 4. 도서별 대출 횟수 출력
SELECT Title, COUNT(*)
	FROM book
	GROUP BY BookID;

-- 5. 가격이 가장 비산 또서 출력
SELECT * FROM book
	ORDER BY price DESC
	LIMIT 1;