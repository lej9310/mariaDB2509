-- 과정평가형 문제

-- 테이블 생성
CREATE TABLE Artist (
	ArtistNo INT PRIMARY KEY AUTO_INCREMENT,
	ArtistName VARCHAR(30) NOT NULL UNIQUE,
	DebutDate DATE NOT NULL,
	Genre VARCHAR(20) NOT NULL,
	Agency VARCHAR(30) 
);

CREATE TABLE Album (
	AlbumNo INT PRIMARY KEY AUTO_INCREMENT,
	ArtistNo INT,
	AlbumTitle VARCHAR(50) NOT NULL,
	ReleaseDate DATE NOT NULL,
	Sales INT,
	CHECK (Sales >= 0),
	FOREIGN KEY (ArtistNo)
		REFERENCES Artist(ArtistNo)
);


-- SQL 작성
-- 1. 아티스트 등록: 태이블에 데이터 삽입
INSERT INTO Artist VALUES (NULL, '아이유', '2008-09-18', '발라드', 'EDAM엔터테인먼트');
INSERT INTO Artist VALUES (NULL, 'BTS', '2013-06-13', 'K-POP', '하이브');
INSERT INTO Artist VALUES (NULL, '블랙핑크', '2016-08-08', 'K-POP', 'YG엔터테인먼트');
SELECT * FROM Artist;

-- 2. 앨범 등록: 태이블에 데이터 삽입
INSERT INTO Album VALUES (NULL, 1, '좋은 날', '2010-12-09', 500000);
INSERT INTO Album VALUES (NULL, 2, 'MAP OF THE SOUL: 7', '2020-02-21', 4300000);
INSERT INTO Album VALUES (NULL, 3, 'THE ALBUM', '2020-10-02', 1300000);
SELECT * FROM Album;

-- 3. 조회:
-- (1) Artist 테이블: 장르(AGenre)가 'K-POP'인 아티스트의 이름(ArtistName)과 소속사(Agency)를 조회
SELECT ArtistName, Agency
	FROM Artist
	WHERE Genre = 'K-POP';
	
-- (2) Album 테이블: 판매량(Sales)이 1,000,000 이상인 앨범의 제목(AlbumTitle)과 판매량을 조회.
SELECT AlbumTitle, Sales
	FROM Album
	WHERE Sales >= 1000000;

-- (3) 아티스트별 아티스트명(ArtistName), 총 판매량 산출
-- (단, 판매량이 NULL인 경우 0으로 처리)
SELECT a.ArtistName, SUM(COALESCE(b.Sales, 0)) AS TotalSales
	FROM Artist a
	LEFT JOIN Album b
		ON a.ArtistNo = b.ArtistNo
	GROUP BY a.ArtistNo, a.ArtistName
	ORDER BY TotalSales DESC;


-- 4. Artist 테이블 수정: '아이유'의 소속사를 '카카오엔터테인먼트'로 수정
UPDATE Artist
	SET Agency = '카카오엔터테인먼트'
	WHERE ArtistName = '아이유'
SELECT * FROM Artist;

-- 5.  Album 테이블 데이터 삭제: AlbumNo = 1인 앨범을 삭제
DELETE FROM Album
	WHERE AlbumNo = 1;
SELECT * FROM Album;

-- 5. “소속사별 매출현황” - (소속사, 아티스트 수, 총 판매량)을 조회.
SELECT a.Agency, COUNT(a.ArtistNo), SUM(COALESCE(b.Sales, 0)) AS TotalSales
	FROM Artist a
	LEFT JOIN Album b
		ON a.ArtistNo = b.ArtistNo
	GROUP BY a.Agency
	ORDER BY TotalSales DESC;
