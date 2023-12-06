CREATE DATABASE QUANLYSV

USE QUANLYSV

CREATE TABLE KHOA
(
	makhoa CHAR(8) NOT NULL PRIMARY KEY,
	tenkhoa NVARCHAR(50),
	diachi NVARCHAR(50),
	dienthoai CHAR(10)
)

CREATE TABLE SINHVIEN
(
	masv CHAR(12) NOT NULL PRIMARY KEY,
	hoten NVARCHAR(50),
	ngaysinh DATETIME,
	makhoa CHAR(8),
	FOREIGN KEY(makhoa) REFERENCES dbo.KHOA(makhoa)
)

CREATE TABLE MONHOC
(
	mamon CHAR(5) NOT NULL PRIMARY KEY,
	tenmon NVARCHAR(50),
	sotinchi INT,
	tengv NVARCHAR(50)
)

CREATE TABLE DANGKYHOC
(
	masv CHAR(12) NOT NULL,
	mamon CHAR(5) NOT NULL,
	hocky INT,
	PRIMARY KEY(masv,mamon),
	FOREIGN KEY(masv) REFERENCES dbo.SINHVIEN(masv),
	FOREIGN KEY(mamon) REFERENCES dbo.MONHOC(mamon)
)

INSERT INTO dbo.KHOA (makhoa,tenkhoa,diachi,dienthoai)
VALUES
	('TOAN',N'Toán - Tin',N'Nhà C','0375637481'),
	('CNTT',N'Công Nghệ Thông Tin', N'Nhà C','0385647183'),
	('DIAL',N'Địa Lý',N'Nhà A1', NULL),
	('HOAH', N'Hóa Học',N'Nhà A2', NULL)

SET DATEFORMAT DMY
INSERT INTO dbo.SINHVIEN (masv,hoten,ngaysinh,makhoa)
VALUES
	('K6100001',N'Phạm Văn Bình','24/02/1990','TOAN'),
	('K6100002',N'Nguyễn Thị Hoài','12/04/1991','CNTT'),
	('K6100003',N'Trần Ngọc','15/04/1990','DIAL'),
	('K6100004',N'Nguyễn Tấn Dũng','03/02/1992','CNTT'),
	('K6100005',N'Trương Tấn Sang','04/12/1990','DIAL'),
	('K6100006',N'Nguyễn Sinh Hùng','03/03/1992','HOAH')

INSERT INTO dbo.MONHOC (mamon,tenmon,sotinchi,tengv)
VALUES 
	('GT1',N'Giải Tích 1',2,N'Đỗ Đức Thái'),
	('DSTT',N'Đại Số Tuyến Tính',3,N'Nguyễn Văn Trào'),
	('HH',N'Hình Học Afin',2,N'Nguyễn Doãn Tuấn'),
	('XSTK',N'Xác Suất Thống Kê',2,N'Đỗ Đức Thái')

INSERT INTO dbo.DANGKYHOC (masv,mamon,hocky)
VALUES
	('K6100001','GT1', 1),
	('K6100001','DSTT', 2),
	('K6100001','HH', 1),
	('K6100002','DSTT', 1),
	('K6100002','XSTK', 2),
	('K6100002','GT1', 1),
	('K6100003','HH', 1),
	('K6100003','GT1', 1),
	('K6100003','XSTK', 1),
	('K6100004','XSTK', 3),
	('K6100004','DSTT', 3),
	('K6100005','DSTT', 1)

SELECT MAMON FROM dbo.DANGKYHOC
INNER JOIN dbo.SINHVIEN ON dbo.DANGKYHOC.masv = dbo.SINHVIEN.masv
WHERE hoten = N'Nguyễn Thị Hoài'

SELECT dbo.SINHVIEN.masv,hoten,tenkhoa
FROM (dbo.SINHVIEN INNER JOIN dbo.KHOA
ON dbo.SINHVIEN.makhoa = dbo.KHOA.makhoa)
INNER JOIN dbo.DANGKYHOC ON dbo.SINHVIEN.masv = dbo.DANGKYHOC.masv
WHERE mamon = 'GT1' AND hocky = 1

SELECT SINHVIEN.masv,SINHVIEN.hoten,KHOA.tenkhoa
FROM dbo.SINHVIEN
INNER JOIN dbo.KHOA ON dbo.SINHVIEN.makhoa = dbo.KHOA.makhoa
ORDER BY KHOA.tenkhoa,SINHVIEN.hoten


SELECT KHOA.makhoa,KHOA.tenkhoa,COUNT(SINHVIEN.masv) AS soluongsv
FROM dbo.KHOA
LEFT JOIN dbo.SINHVIEN ON dbo.KHOA.makhoa = dbo.SINHVIEN.makhoa
GROUP BY KHOA.makhoa,KHOA.tenkhoa
ORDER BY KHOA.makhoa;


SELECT MONHOC.tengv AS hotenthay,MONHOC.tenmon,DANGKYHOC.hocky,
COUNT(DISTINCT DANGKYHOC.masv) AS soluongsinhvien
FROM dbo.MONHOC
INNER JOIN dbo.DANGKYHOC ON dbo.MONHOC.mamon = dbo.DANGKYHOC.mamon
GROUP BY MONHOC.tengv,MONHOC.tenmon,DANGKYHOC.hocky
ORDER BY MONHOC.tengv,DANGKYHOC.hocky,MONHOC.tenmon;

SELECT TOP 1 SINHVIEN.masv,SINHVIEN.hoten,
COUNT(DANGKYHOC.mamon) AS soluongmonhoc
FROM dbo.SINHVIEN
INNER JOIN dbo.DANGKYHOC ON dbo.SINHVIEN.masv = dbo.DANGKYHOC.masv
GROUP BY SINHVIEN.masv,SINHVIEN.hoten
ORDER BY soluongmonhoc DESC;

SELECT SINHVIEN.masv,SINHVIEN.hoten,
COUNT(DANGKYHOC.mamon) AS soluongmonhoc
FROM dbo.SINHVIEN
LEFT JOIN dbo.DANGKYHOC ON dbo.SINHVIEN.masv = dbo.DANGKYHOC.masv
GROUP BY SINHVIEN.masv,SINHVIEN.hoten
ORDER BY soluongmonhoc ASC;

SELECT MONHOC.tenmon,DANGKYHOC.hocky,
COUNT(DANGKYHOC.masv) AS soluongsvdangky
FROM dbo.MONHOC
LEFT JOIN dbo.DANGKYHOC ON dbo.MONHOC.mamon = dbo.DANGKYHOC.mamon
GROUP BY MONHOC.tenmon,DANGKYHOC.hocky
HAVING COUNT(DANGKYHOC.masv) < 2
ORDER BY MONHOC.tenmon,DANGKYHOC.hocky;