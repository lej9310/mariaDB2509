SHOW DATABASES;
USE shopdb;

-- < 3장>
-- ========= 실습4 =========
SELECT*FROM memberTBL;

SELECT memberName, memberAdress FROM memberTBL;

SELECT*FROM membertbl WHERE memberName = '지운이';

CREATE TABLE `my testTBL` (id INT);

DROP TABLE `my testTBL`; -- 백틱 사용


-- ========= 실습5 =========
SELECT * FROM producttbl WHERE productName = '세탁기';

CREATE TABLE indexTBL (
	first_name VARCHAR(14),
	last_name VARCHAR(16),
	hire_date DATE
);

INSERT INTO indexTBL
	SELECT first_name, LAST_name, hire_date
	FROM employees.employees
	LIMIT 500;
	
SELECT * FROM indexTBL;

SELECT * FROM indextbl WHERE first_name = 'Mary';

EXPLAIN SELECT * FROM indextbl WHERE first_name = 'Mary';

CREATE INDEX idx_indexTBL_firstname ON indexTBL(first_name);


-- ========= 실습6 =========
-- 뷰: 가상의 테이블
CREATE VIEW uv_memberTBL
	AS
	SELECT memberName, memberAddress FROM membertbl;

SELECT*FROM uv_memberTBL;


-- ========= 실습7 =========
-- 스토어드 프로시저: SQL문을 하나로 묶어서 사용
SELECT*FROM membertbl ;

SELECT*FROM membertbl WHERE memberName = '당탕이';
SELECT*FROM producttbl WHERE productName = '냉장고';

-- 구분 문자
DELIMITER // -- 기존의 세미콜론(;)을 // 가 대신
CREATE PROCEDURE myProc()
	BEGIN
		SELECT * FROM membertbl WHERE memberName = '당탕이';
		SELECT * FROM producttbl WHERE productName = '냉장고';
	 END //
DELIMITER ;

CALL myProc(); -- 2개 탭 생성


-- ========= 실습8 =========
-- 트리거: 테이블에 부탁되어 테이블에 INSERT/UPDATE/DELETE 작업이 발생되면 실행되는 코드
-- memberTBL에 값 추가
INSERT INTO memberTBL VALUES ('Figure', '연아', '경기도 군포시 당정동');
-- 
UPDATE membertbl SET memberAddress = '서울 강남구 역삼동' WHERE memberName = '연아';