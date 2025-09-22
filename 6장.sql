SHOW DATABASES;

-- USE 구문: SELECT문을 학습하려면 먼저 사용할 DB 지정 
USE employees;
USE mysql;

SHOW TABLES;

SELECT *FROM titles;
SELECT *FROM employees.titles;

SELECT *FROM employees;

-- 여러 개의 열 가져오기 => 콤마 사용
SELECT first_name FROM employees;
SELECT first_name, last_name FROM employees;
SELECT first_name, last_name, gender FROM employees;


-- ======= 실습 ========
SHOW DATABASES;
USE employees;
SHOW TABLE STATUS;

-- employees 테이블의 열에 무엇이 있는지 확인
DESCRIBE employees;
SELECT first_name, gender FROM employees;


-- ======= 실습 ========
SELECT first_name AS 이름, gender 성별, hire_date '회사 입사일' FROM employees;


-- ======= 실습 ========
-- 만약 sqlDB가 존재하다면 삭제해라
DROP DATABASE IF EXISTS sqlDB;
CREATE DATABASE sqlDB;

USE sqlDB;

-- 회원 테이블 생성
CREATE TABLE userTbl(
userID  CHAR(8) NOT NULL PRIMARY KEY,  -- 사용자 아이디(PK => 중복되면 안됨)
NAME    VARCHAR(10) NOT NULL,          -- 이름
birthYear INT NOT NULL,                -- 출생년도
addr    CHAR(2) NOT NULL,              -- 지역(경기,서울,경남 식으로 2글자만입력)
mobile1 CHAR(3),                       -- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
mobile2 CHAR(8),                       -- 휴대폰의 나머지 전화번호(하이픈제외)
height  SMALLINT,                      -- 키
mDate   DATE                           -- 회원 가입일
);

-- 회원 구매 테이블
CREATE TABLE buyTbl(
num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,    -- 순번(PK)
userID CHAR(8) NOT NULL,                        -- 아이디(FK)  
prodName CHAR(8) NOT NULL,                      --  물품명
groupName CHAR(4),                              -- 분류
price INT NOT NULL,                             -- 단가
amount SMALLINT NOT NULL,                       -- 수량
FOREIGN KEY (userID) REFERENCES userTbl(userID) -- 외래키 지정: 테이블 간 관계 정의&항상 유효하도록 보장
);
-- 외래키 지정 => DB 삽입/수정 시점에 userID에 해당 값이 존재하는지 검사하고, 없는 경우 에러로 차단
-- 외래키를 지정하지 않는 경우 실수로 입력할 시 고아 데이터 발생


-- usertbl에 내용 삽입
-- 주의! 쿼리의 문자열은 모두 작은따옴표('')만 사용
-- 문자열 앞의 N접두사 => 이 문자열이 유니코드 문자열(리터럴)임을 명시 => 한글 입력할 경우
INSERT INTO usertbl VALUES('LSG', N'이승기', 1987, N'서울', '011', '11111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', N'김범수', 1979, N'경남', '011', '22222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', N'김경호', 1971, N'전남', '019', '33333333', 177, '2007-7-7');
INSERT INTO usertbl VALUES('JYP', N'조용필', 1950, N'경기', '011', '44444444', 166, '2009-4-4');
INSERT INTO usertbl VALUES('SSK', N'성시경', 1979, N'서울', NULL , NULL      , 186, '2013-12-12');
INSERT INTO usertbl VALUES('LJB', N'임재범', 1963, N'서울', '016', '66666666', 182, '2009-9-9');
INSERT INTO usertbl VALUES('YJS', N'윤종신', 1969, N'경남', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO usertbl VALUES('EJW', N'은지원', 1972, N'경북', '011', '88888888', 174, '2014-3-3');
INSERT INTO usertbl VALUES('JKW', N'조관우', 1965, N'경기', '018', '99999999', 172, '2010-10-10');
INSERT INTO usertbl VALUES('BBK', N'바비킴', 1973, N'서울', '010', '00000000', 176, '2013-5-5');

-- buytbl에 내용 삽입
INSERT INTO buytbl VALUES(NULL, 'KBS', N'운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'KBS', N'노트북', N'전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL, 'JYP', N'모니터', N'전자', 200,  1);
INSERT INTO buytbl VALUES(NULL, 'BBK', N'모니터', N'전자', 200,  5);
INSERT INTO buytbl VALUES(NULL, 'KBS', N'청바지', N'의류', 50,   3);
INSERT INTO buytbl VALUES(NULL, 'BBK', N'메모리', N'전자', 80,  10);
INSERT INTO buytbl VALUES(NULL, 'SSK', N'책'    , N'서적', 15,   5);
INSERT INTO buytbl VALUES(NULL, 'EJW', N'책'    , N'서적', 15,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', N'청바지', N'의류', 50,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', N'운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', N'책'    , N'서적', 15,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', N'운동화', NULL   , 30,   2);

-- 생성/삽입 테이블 확인
SELECT * FROM userTbl;
SELECT * FROM buytbl;


-- ======= 실습 ========
-- 특정한 조건의 데이터만 조회하는 <SELECT ... FROM... WHERE> =====================================
USE sqlDB;

SELECT * FROM usertbl;
SELECT * FROM usertbl WHERE NAME = '김경호'; -- usertbl에서 이름이 김경호인 data만 확인
-- BETWEEN ... AND
SELECT userId, Name FROM usertbl WHERE birthYear >= 1970 AND height >= 182;
SELECT Name, height FROM usertbl WHERE height >= 180 AND height <= 183;
-- BETWEEN ... OR
SELECT NAME, addr FROM usertbl WHERE addr = '경남' OR addr = '전남' OR addr = '경북';
-- IN(...)
SELECT NAME, addr FROM usertbl WHERE addr IN ('경남', '전남', '경북');
-- LIKE
SELECT NAME, height FROM usertbl WHERE NAME LIKE '김%';
SELECT NAME, height FROM usertbl WHERE NAME LIKE '_종신';

-- ANY, ALL, SOME ==========================================================================

-- 서브쿼리(하위 쿼리): 쿼리문 안에 또 쿼리문
SELECT NAME, height FROM usertbl WHERE height > 177;
 -- 177을 김경호의 키에서 추출해서 서브쿼리로 사용
SELECT NAME, height FROM usertbl WHERE height > (SELECT height FROM usertbl WHERE NAME = '김경호');

-- 오류 발생 => 서브 쿼리에서 둘 이상의 값을 반환(173, 170)
SELECT NAME, height FROM usertbl WHERE height >= (SELECT height FROM usertbl WHERE addr = '경남');

-- 서브 쿼리 앞에 ANY 구문 삽입
SELECT NAME, height FROM usertbl WHERE height >= ANY (SELECT height FROM usertbl WHERE addr = '경남');
SELECT NAME, height FROM usertbl WHERE height = ANY (SELECT height FROM usertbl WHERE addr = '경남');
SELECT NAME, height FROM usertbl WHERE height IN (SELECT height FROM usertbl WHERE addr='경남');


-- 원하는 순서대로 정렬하여 출력: ORDER BY =====================================
SELECT NAME, mDate FROM usertbl ORDER BY mDate;      -- 오름차순(ASC)
SELECT NAME, mDate FROM usertbl ORDER BY mdate DESC; -- 내림차순 (DESC)
SELECT NAME, height FROM usertbl ORDER BY height DESC, NAME ASC;  -- 키는 내림차순, 이름은 오름차순

SELECT addr FROM usertbl;
SELECT addr FROM usertbl ORDER BY addr;
-- DISTINCT: unique 값 선택(중복값 제거)
SELECT DISTINCT addr FROM usertbl;


-- 출력하는 개수를 제한: LIMIT =====================================
USE employees;
SELECT emp_no, hire_date FROM employees ORDER BY hire_date ASC;
-- 입사일이 오래된 직원 5명만 추출
USE employees;
-- 5개의 행만 출력
SELECT emp_no, hire_date FROM employees ORDER BY hire_date ASC LIMIT 5;
-- LIMIT 시작, 개수 / LIMIT 개수 offset 시작
SELECT emp_no, hire_date FROM employees ORDER BY hire_date ASC LIMIT 0, 5; -- LIMIT 5 OFFSET 0


-- 테이블을 복사(원하는 열만)하는 CREATE TABLE ... SELECT =====================================
USE sqlDB;

-- buytbl의 데이터를 모두 복사해서 buytbl2 생성
CREATE TABLE buytbl2 (SELECT * FROM buytbl);
SELECT*FROM buytbl2;

--  buytbl의 열을 선택 복사해서 buytbl3 생성 
CREATE TABLE buytbl3 (SELECT userID, prodName FROM buytbl);
SELECT*FROM buytbl3;


-- GLOUP BY & HAVING & 집계함수  =====================================
SELECT userID, amount FROM buytbl ORDER BY userID;
-- SUM()
SELECT userID, SUM(amount) FROM buytbl GROUP BY userID;

SELECT userID AS '사용자 아이디', SUM(amount) AS '총 구매 개수' FROM buytbl GROUP BY userID;

-- ======= 실습 ========