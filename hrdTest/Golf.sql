-- 과정평가형 문제
SHOW DATABASES;
USE hrdtest;

DROP TABLE IF EXISTS GolfUsage;
DROP TABLE IF EXISTS Lesson;
DROP TABLE IF EXISTS GolfMember;

-- 테이블 생성
CREATE TABLE GolfMember (
	MNo INT PRIMARY KEY AUTO_INCREMENT,
	MName VARCHAR(30) NOT NULL,
	Phone VARCHAR(13) UNIQUE,
	JoinDate DATE NOT NULL,
	Grade CHAR(1),
	CHECK(Grade IN ('A','B','C'))
);

CREATE TABLE Lesson (
	LNo INT PRIMARY KEY AUTO_INCREMENT,
	MNo INT,                         -- FK
	Coach VARCHAR(30) NOT NULL,
	StartDate DATE NOT NULL,
	Fee INT,
	CHECK (Fee >= 0),
	FOREIGN KEY (MNo)
		REFERENCES GolfMember (MNo)
);

-- Usage는 ColumnStore에서 예약어나 제한된 이름에 해당 >> 충돌
-- >> CREATE TABLE `Usage`보다 구체적인 이름을 명시하는 것이 좋음
CREATE TABLE GolfUsage (
	UNo INT PRIMARY KEY AUTO_INCREMENT,
	MNo INT,                          -- FK
	UDate DATE NOT NULL,
	Time INT,
	CHECK(Time > 0),
	Cost INT,
	CHECK (Cost >= 0),
	FOREIGN KEY (MNo)
		REFERENCES GolfMember (MNo)
);


-- SQL 작성
-- 1. 회원 등록: GolfMember 테이블에 다음 데이터를 삽입
INSERT INTO golfmember VALUES (NULL, '홍길동', '010-1111-2222', '2020-01-01', 'A');
INSERT INTO golfmember VALUES (NULL, '이순신', '010-3333-4444', '2021-05-10', 'B');
INSERT INTO golfmember VALUES (NULL, '강감찬', '010-5555-6666', '2022-03-15', 'C');
SELECT * FROM golfmember;

-- 2. 강습 등록: Lesson 테이블에 삽입
INSERT INTO Lesson VALUES (NULL, 1, '김프로', '2020-02-01', 300000);
INSERT INTO Lesson VALUES (NULL, 2, '박프로', '2021-06-01', 250000);
INSERT INTO Lesson VALUES (NULL, 3, '이프로', '2022-04-01', 200000);
SELECT * FROM Lesson;

-- 3. 이용내역 등록: GolfUsage 테이블에 삽입
INSERT INTO GolfUsage VALUES (NULL, 1, '2020-02-10', 120, 24000);
INSERT INTO GolfUsage VALUES (NULL, 2, '2021-06-15', 90, 18000);
INSERT INTO GolfUsage VALUES (NULL, 3, '2022-04-20', 150, 30000);
SELECT * FROM golfusage;

-- 4. 조회:
-- (1) A등급 회원의 이름, 전화번호, 가입일자를 조회
SELECT MName, Phone, JoinDate
	FROM golfmember
	WHERE Grade = 'A';
	
-- (2) 강습비가 250000 이상인 강습 내역을 조회
SELECT * FROM lesson
	WHERE Fee >= 250000;

-- (3) 회원별 회원명, 총 이용요금을 집계
SELECT m.MName, SUM(u.Time * u.Cost) AS TotalUsageFee
	FROM golfmember m
	LEFT JOIN golfusage u
		ON m.MNo = u.MNo	
	GROUP BY m.MNo, m.MName;	

-- 5. 수정: 이순신 회원의 등급을 'A'로 수정
UPDATE golfmember
	SET Grade = 'A'
	WHERE MName = '이순신';
SELECT * FROM golfmember;

-- 6. 삭제: MNo = 3 인 회원을 삭제
-- Lesson, GolfUsage 테이블이 golfmember 테이블을 외래키로 참조
-- 참조 무결성 제약 조건때문에 삭제 안 됨 => ON UPDATE CASCADE & ON DELETE CASCADE
ALTER TABLE Lesson
	ADD CONSTRAINT FK_L_MNo
	FOREIGN KEY (MNo)
		REFERENCES golfmember(MNo)
	ON UPDATE CASCADE
	ON DELETE CASCADE;

ALTER TABLE GolfUsage
	ADD CONSTRAINT FK_U_MNo
	FOREIGN KEY (MNo)
		REFERENCES golfmember(MNo)
	ON UPDATE CASCADE
	ON DELETE CASCADE;

/*
-- 모든 제약 조건 조회
SELECT constraint_name, constraint_type
	FROM information_schema.table_constraints
	WHERE table_schema = DATABASE()
		AND TABLE_NAME = 'Lesson';
-- (제약 조건 잘못 만든 경우) 삭제
ALTER TABLE Lesson
	DROP FOREIGN KEY FK_MNo;
DESC lesson
*/
	
DELETE FROM golfmember
	WHERE MNo = 3;
SELECT * FROM golfmember;

-- 7. 등급별 통계
-- 조회: 등급(m.Grade), 회원 수(Count(m.MNo)), 평균 강습비(AVG(l.Fee)), 총 이용요금(SUM(u.Time * u.Cost))
SELECT * FROM lesson;
SELECT * FROM GolfUsage;

SELECT m.Grade, Count(m.MNo) AS NumOfMem, AVG(l.Fee) AS AvgLessonFee, SUM(u.Time * u.Cost) AS TotalUsageFee
	FROM golfmember m
	JOIN lesson l
		ON m.MNo = l.MNo
	JOIN golfusage u
		ON m.MNo = u.MNo
	GROUP BY m.Grade;	





