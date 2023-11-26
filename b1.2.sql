CREATE DATABASE QLBH

USE QLBH

CREATE TABLE KHACHHANG
(
	makh CHAR(5) NOT NULL PRIMARY KEY,
	tenkh NVARCHAR(50),
	gioitinh BIT,
	ngaysinh DATETIME,
	diachi NVARCHAR(50),
	dienthoai CHAR(12),
	email CHAR(20) NULL,
	loaikh CHAR(3)
)

CREATE TABLE HANGHOA
(
	mah CHAR(4) NOT NULL PRIMARY KEY,
	tenh NVARCHAR(50),
	donvitinh NVARCHAR(5),
	dongia INT
)

CREATE TABLE HOADON
(
	mahd CHAR(3) NOT NULL PRIMARY KEY,
	makh CHAR(5),
	ngaylaphd DATETIME,
	FOREIGN KEY(makh) REFERENCES dbo.KHACHHANG(makh),
)

CREATE TABLE CHITIETHD
(
	mahd CHAR(3) NOT NULL,
	mah CHAR(4) NOT NULL,
	PRIMARY KEY(mahd,mah),
	soluong INT,
	FOREIGN KEY(mah) REFERENCES dbo.HANGHOA(mah),
	FOREIGN KEY(mahd) REFERENCES dbo.HOADON(mahd)
)
SET DATEFORMAT dmy;
INSERT INTO dbo.KHACHHANG (makh,tenkh,gioitinh,ngaysinh,diachi,dienthoai,email,loaikh)
VALUES
	('KH001', N'Nguyễn Thị Mai Chi','False','19/08/2004',N'Quy Nhơn','09762334445','MaiChi@gmail.com','VIP'),
	('KH002', N'Phan Thị Thanh Hằng','False','28/02/2004', N'Quy Nhơn','09876655555',NULL,'TV'),
	('KH003', N'Trần Văn Toàn','True','12/04/2004', N'Tuy Phước','0987665556','ToanVan@gmail.com','TV'),
	('KH004', N'Trần Văn Ẩn','True','19/12/2004', N'Quy Nhơn','09873648124',NULL,'VIP')


INSERT INTO dbo.HANGHOA (mah,tenh,donvitinh,dongia)
VALUES
	('H001',N'Sữa đặc ông thọ',N'lon',23000),
	('H002',N'Kẹo dẻo Hồng Hà',N'gói',80000),
	('H003',N'Bánh xốp quy Kinh Đô',N'hộp',120000),
	('H004',N'Bánh quy Luxy',N'hộp',150000),
	('H005',N'Đường trắng Quy Hòa',N'gói',20000),
	('H006',N'Bánh Luxy Sài Gòn',N'hộp',100000),
	('H007',N'Sữa tươi TH TrueMilk',N'lốc',30000) -- Bên đây không tồn tại H008 --

INSERT INTO dbo.HOADON (mahd,makh,ngaylaphd)
VALUES
	('001','KH001', '01/02/2018'),
	('002','KH001', '02/03/2018'),
	('003','KH002', '01/02/2018'),
	('004','KH002', '01/03/2018'),
	('005','KH003', '02/03/2018'),
	('006','KH004', '02/08/2018'),
	('007','KH003', '03/05/2018'),
	('008','KH003', '04/05/2018')

INSERT INTO dbo.CHITIETHD (mahd,mah,soluong)
VALUES
	('001','H001',1),
	('001','H002',3),
	('002','H003',12),
	('002','H004',2),
	('003','H001',7),
	('003','H004',5),
	('004','H001',12),
	('005','H003',20),
	('005','H005',19),
	('006','H007',20),
	('006','H003',45),
	('007','H002',60),
	('007','H007',35) -- Đề in sai đoạn này. Phải là H007 ---

------------------------ A ------------------------------------
ALTER TABLE dbo.HANGHOA ADD UNIQUE(tenh,donvitinh)
------------------------ A ------------------------------------

------------------------ B ------------------------------------
ALTER TABLE dbo.CHITIETHD ADD CHECK (soluong >= 0)
------------------------ B ------------------------------------

------------------------ C ------------------------------------
ALTER TABLE dbo.HOADON ADD	DEFAULT (YEAR(GETDATE())) FOR ngaylaphd
------------------------ C ------------------------------------

--------- D -----------
-- Không xóa được --
--------- D ------------

------------------------ E ------------------------------------
ALTER TABLE dbo.KHACHHANG DROP COLUMN diachi
ALTER TABLE dbo.KHACHHANG ADD diachi NVARCHAR(50) DEFAULT N'Phú Thọ'
------------------------ E ------------------------------------

------------------------ F ------------------------------------
ALTER TABLE dbo.HOADON DROP CONSTRAINT FK__HOADON__makh__3B75D760
--------------------------- Thêm lại khóa--------------------------------
ALTER TABLE dbo.HOADON ADD CONSTRAINT FK__HOADON__makh__3B75D760
FOREIGN KEY (makh) REFERENCES dbo.KHACHHANG(makh)
--------------------------- Thêm lại khóa--------------------------------
------------------------ F ------------------------------------
