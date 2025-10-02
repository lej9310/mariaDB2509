-- 과정평가형 문제
-- SHOW DATABASES;
-- USE hrdtest;

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
	UNo INT,
	MNo INT,                          -- FK
	UDate DATE NOT NULL,
	Time INT,
	CHECK(Time > 0),
	Cost INT,
	CHECK (Cost >= 0),
	FOREIGN KEY (MNo)
		REFERENCES GolfMember (MNo)
);


-- SQL 작성 ===============================================================
-- 1. 회원 등록: GolfMember 테이블에 다음 데이터를 삽입
INSERT INTO golfmember VALUES (NULL, '홍길동', '010-1111-2222', '2020-01-01', NULL);
INSERT INTO golfmember VALUES (NULL, '이순신', '010-3333-4444', '2021-05-10', NULL);
INSERT INTO golfmember VALUES (NULL, '강감찬', '010-5555-6666', '2022-03-15', NULL);
INSERT INTO golfmember VALUES (NULL, '홍일동', '010-7777-8888', '2018-12-07', NULL);
INSERT INTO golfmember VALUES (NULL, '홍귀동', '010-9999-1010', '2019-06-28', NULL);
SELECT * FROM golfmember;

-- =========================================================================
-- 2. 강습 등록: Lesson 테이블에 삽입
INSERT INTO Lesson VALUES (NULL, 1, '김프로', '2020-02-01', 300000);
INSERT INTO Lesson VALUES (NULL, 2, '박프로', '2021-06-01', 250000);
INSERT INTO Lesson VALUES (NULL, 3, '이프로', '2022-04-01', 200000);
INSERT INTO Lesson VALUES (NULL, 4, '홍프로', '2023-11-01', 300000);
INSERT INTO Lesson VALUES (NULL, 5, '송프로', '2024-08-01', 350000);
SELECT * FROM Lesson;

-- =========================================================================
-- 3. 이용내역 등록: GolfUsage 테이블에 삽입
INSERT INTO GolfUsage VALUES (1, 1, '2020-02-09', 10, NULL);
INSERT INTO GolfUsage VALUES (1, 1, '2020-02-10', 2, NULL);
INSERT INTO GolfUsage VALUES (2, 2, '2021-06-13', 3, NULL);
INSERT INTO GolfUsage VALUES (2, 2, '2021-06-14', 3, NULL);
INSERT INTO GolfUsage VALUES (2, 2, '2021-06-15', 3, NULL);
INSERT INTO GolfUsage VALUES (3, 3, '2022-04-19', 10, NULL);
INSERT INTO GolfUsage VALUES (3, 3, '2022-04-20', 5, NULL);
INSERT INTO GolfUsage VALUES (4, 4, '2023-11-01', 10, NULL);
INSERT INTO GolfUsage VALUES (4, 4, '2023-11-02', 10, NULL);
INSERT INTO GolfUsage VALUES (5, 5, '2024-08-21', 20, NULL);
INSERT INTO GolfUsage VALUES (5, 5, '2024-08-22', 5, NULL);
SELECT * FROM golfusage;

-- =========================================================================
-- GolfUsage 테이블: 이용일자별 이용금액(Cost)을 계산하여 열 채우기
-- (GolfUsage) Cost = (Lesson) 강습비 * (GolfUsage) 이용시간
UPDATE GolfUsage u
	JOIN Lesson l
		ON u.MNo = l.MNo
	SET u.Cost = l.Fee * u.Time
	WHERE u.Cost IS NULL;
SELECT * FROM golfusage;

-- golfmember테이블: GolfUsage 테이블의 회원별 총이용금액에 따라 Grade 부여
UPDATE GolfMember m
	JOIN (
	    SELECT MNo, SUM(COALESCE(Cost, 0)) AS TotalCost
	    FROM GolfUsage
	    GROUP BY MNo
	) t
		ON m.MNo = t.MNo
	SET m.Grade =
	CASE
	    WHEN t.TotalCost >= 8000000 THEN 'A'
	    WHEN t.TotalCost >= 4000000 THEN 'B'
	    ELSE 'C'
	END
	WHERE m.MNo IN (SELECT DISTINCT MNo FROM GolfUsage);
SELECT * FROM golfmember;

-- 4. 조회:
-- (1) A등급 회원의 이름, 전화번호, 가입일자를 조회
SELECT Grade, MName, Phone, JoinDate
	FROM golfmember
	WHERE Grade = 'A';

-- (2) 강습비가 250000 이상인 강습 내역을 조회
SELECT l.Fee, l.Coach, m.MName, u.Udate, u.Time, u.Cost
	FROM lesson l
	INNER JOIN golfmember m
		ON l.MNo = m.mno
	INNER JOIN golfusage u
		ON l.MNo = u.mno
	WHERE l.Fee >= 250000
	ORDER BY l.Fee DESC;

-- (3) 회원별 회원명, 총 이용요금을 집계
SELECT m.MName, SUM(u.Cost) AS TotalCost
	FROM golfmember m
	LEFT JOIN golfusage u
		ON m.MNo = u.MNo	
	GROUP BY m.MNo, m.MName
	ORDER BY TotalCost DESC;

-- =========================================================================
-- 5. 수정: 이순신 회원의 등급을 'A'로 수정
UPDATE golfmember
	SET Grade = 'A'
	WHERE MName = '이순신';
SELECT * FROM golfmember;

-- =========================================================================
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
-- (1) 모든 제약 조건 조회
SELECT constraint_name, constraint_type
	FROM information_schema.table_constraints
	WHERE table_schema = DATABASE()
		AND TABLE_NAME = 'Lesson';

SELECT constraint_name, constraint_type
	FROM information_schema.table_constraints
	WHERE table_schema = DATABASE()
		AND TABLE_NAME = 'GolfUsage';

-- (2) (제약 조건 잘못 만든 경우) 삭제
ALTER TABLE Lesson
	DROP FOREIGN KEY FK_MNo;
DESC lesson    -- 확인

ALTER TABLE GolfUsage
	DROP FOREIGN KEY FK_MNo;
DESC GolfUsage -- 확인
*/
	
DELETE FROM golfmember
	WHERE MNo = 3;
SELECT * FROM golfmember;

-- 7. 등급별 통계 (조회: 등급, 회원수, 평균 강습비, 총이용요금)
SELECT
		m.Grade,
		Count(DISTINCT m.MNo) AS NumOfMem,
		CAST(AVG(l.Fee) AS SIGNED) AS AvgLessonFee,
		SUM(Cost) AS TotalCost
	FROM golfmember m
	JOIN lesson l
		ON m.MNo = l.MNo
	JOIN golfusage u
		ON m.MNo = u.MNo
	GROUP BY m.Grade;	
