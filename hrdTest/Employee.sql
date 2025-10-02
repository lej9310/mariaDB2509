-- 과정평가형 문제

DROP TABLE IF EXISTS Employee;

-- 테이블 생성 ================================================
CREATE TABLE Employee (
	EmpNo INT PRIMARY KEY AUTO_INCREMENT,
	EmpName VARCHAR(30) NOT NULL UNIQUE, -- unique 제약조건: 중복 불가
	Dept VARCHAR(20) NOT NULL,
	HireDate DATE NOT NULL,
	Salary INT,
	CHECK(Salary >= 2000000)
);


-- SQL 작성 ================================================
-- 1. 사원 등록: 테이블에 아래 데이터 삽입
INSERT INTO Employee VALUES (NULL, '홍길동', '영업부', '2020-03-01', 2500000);
INSERT INTO Employee VALUES (NULL, '이순신', '인사부', '2019-07-15', 3200000);
INSERT INTO Employee VALUES (NULL, '강감찬', '개발부', '2021-01-10', 2800000);
SELECT * FROM employee;

-- ================================================
-- 2. 조회
-- (1) 부서가 개발부인 사원의 사번, 이름, 급여 조회
SELECT EmpNo, EmpName, Salary
	FROM employee
	WHERE Dept = '개발부';

-- (2) 급여가 3,000,000원 이상인 사원의 이름과 부서 조회
SELECT EmpName, Dept
	FROM employee
	WHERE Salary >= 3000000;

-- ================================================
-- 3. 수정: 이순신의 급여를 3,500,000원으로 수정
UPDATE employee
	SET Salary = 3500000 
	WHERE EmpName = '이순신';
SELECT * FROM employee;

-- ================================================
-- 4. 삭제: 사번이 1번인 사원의 정보 삭제
DELETE FROM Employee
	WHERE EmpNo = 1;
SELECT * FROM employee;
