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

-- 주소 변경
UPDATE membertbl SET memberAddress = '서울 강남구 역삼동' WHERE memberName = '연아';

-- 추가한 값 삭제
DELETE FROM membertbl WHERE memberName = '연아';

-- 테이블 생성
CREATE TABLE deletedMemberTBL (
	memberID CHAR(8),
	memberName CHAR(5),
	memberAddress CHAR(20),
	deletedDate DATE -- 삭제한 날짜
);

SELECT * FROM deletedMemberTBL;

-- membertbl에서 값을 삭제 >> 트리거 부착 >> deletedMemberTBL에 저장
DELIMITER //
CREATE TRIGGER trg_deletedMemberTBL
	AFTER DELETE  -- 삭제 후에 작동하게 지정
		ON memberTBL -- 트리거를 부착할 테이블
		FOR EACH ROW  -- 각 행마다 적용
	BEGIN
	-- OLD 테이블의 내용을 백업테이블에 삽입
		INSERT INTO deletedMemberTBL
			VALUES (OLD.memberID, OLD.memberName, OLD.memberAddress, CURDATE() );
END //
DELIMITER ;


SELECT * FROM membertbl;

-- 행 삭제
DELETE FROM membertbl WHERE memberName = '당탕이';
SELECT * FROM membertbl;

-- 삭제된 행 >>  deletedMemberTBL 으로 이동
SELECT * FROM deletedMemberTBL;


-- ========= 실습9 =========
-- 데이터베이스 백업 및 관리
USE shopDB;

SELECT * FROM producttbl;

-- 데이터 날리기 
DELETE FROM producttbl; -- WHERE절 없으면 모든 데이터 날라감

SELECT * FROM producttbl;

USE mysql; -- 일단 다른 DB 선택

USE ShopDB;
SELECT * FROM producttbl;

-- sql 불러오기(ctrl + O) >> DB백업 폴더 - ShopDB.sql >> F9 눌러서 다시 생성

-- ========= 실습10 =========
SELECT * FROM memberTBL;