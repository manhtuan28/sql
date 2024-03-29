﻿CREATE DATABASE QLSV

USE QLSV

CREATE TABLE DMKHOA
(
	makhoa CHAR(10) NOT NULL PRIMARY KEY,
	tenkhoa NVARCHAR(50)
)

CREATE TABLE DMNGANH
(
    manganh CHAR(10) NOT NULL PRIMARY KEY,
    tennganh NVARCHAR(50),
    makhoa CHAR(10),
    FOREIGN KEY(makhoa) REFERENCES dbo.DMKHOA(makhoa)
)

CREATE TABLE DMLOP
(
	malop CHAR(10) NOT NULL PRIMARY KEY,
	tenlop NVARCHAR(50),
	manganh CHAR(10),
	khoahoc NVARCHAR(20),
	hedt NVARCHAR(3),
	namnhaphoc INT,
	FOREIGN KEY(manganh) REFERENCES dbo.DMNGANH(manganh)
)

CREATE TABLE SINHVIEN
(
	masv CHAR(10) NOT NULL PRIMARY KEY,
	hoten NVARCHAR(20),
	malop CHAR(10),
	gioitinh BIT,
	ngaysinh DATETIME,
	diachi NVARCHAR(50),
	FOREIGN KEY(malop) REFERENCES dbo.DMLOP(malop)
)

CREATE TABLE DMHOCPHAN
(
    mahp CHAR(10) NOT NULL PRIMARY KEY,
    tenhp NVARCHAR(50),
    sodvht INT,
    manganh CHAR(10),
    hocky INT
)

CREATE TABLE DIEMHP
(
	masv CHAR(10) NOT NULL,
	mahp CHAR(10) NOT NULL,
	PRIMARY KEY(masv,mahp),
	diemhp NUMERIC(4,1),
	FOREIGN KEY(mahp) REFERENCES dbo.DMHOCPHAN(mahp),
	FOREIGN KEY(masv) REFERENCES dbo.SINHVIEN(masv)
)

INSERT INTO dbo.DMKHOA (makhoa,tenkhoa)
VALUES
	('CNTT', N'Công nghệ thông tin'),
	('KT', N'Kế toán'),
	('SP', N'Sư phạm')

INSERT INTO dbo.DMNGANH (manganh,tennganh,makhoa)
VALUES
	('140902', N'Sư phạm toán tin','SP'),
	('480202', N'Tin học ứng dụng', 'CNTT')

INSERT INTO dbo.DMLOP (malop,tenlop,manganh,khoahoc,hedt,namnhaphoc)
VALUES
	('CT11',N'Cao đẳng tin học','480202',11,N'TC',2013),
	('CT12',N'Cao đẳng tin học','480202',12,N'CĐ',2013),
	('CT13',N'Cao đẳng tin học','480202',13,N'CĐ',2014)

SET DATEFORMAT dmy;
INSERT INTO dbo.SINHVIEN (masv,hoten,malop,gioitinh,ngaysinh,diachi)
VALUES
	('001',N'Phan Thanh','CT12','False',CONVERT(DATETIME, '09/12/1990',103),N'Tuy Phước'),
	('002', N'Nguyễn Thị Cẩm', 'CT12', 'True', CONVERT(DATETIME,'01/12/1994',103),N'Quy Nhơn'),
	('003',N'Võ Thị Hà','CT12','True',CONVERT(DATETIME,'07/02/1995',103),N'An Nhơn'),
	('004',N'Trần Hoài Nam','CT12', 'False',CONVERT(DATETIME,'04/05/1994',103),N'Tây Sơn'),
	('005',N'Trần Văn Hoàng','CT13','False',CONVERT(DATETIME,'08/04/1995',103),N'Vĩnh Thạnh'),
	('006',N'Đặng Thị Thảo','CT13','True',CONVERT(DATETIME,'06/12/1995',103),N'Quy Nhơn'),
	('007',N'Lê Thị Sen','CT13','True',CONVERT(DATETIME,'08/12/1994',103),N'Phù Cát'),
	('008',N'Nguyễn Văn Huy','CT11','False',CONVERT(DATETIME,'06/04/1995',103),N'Phù Mỹ'),
	('009',N'Trần Thị Hoa','CT11','True',CONVERT(DATETIME,'08/09/1994',103),N'Hoài Nhơn')

INSERT INTO dbo.DMHOCPHAN (mahp,tenhp,sodvht,manganh,hocky)
VALUES
    ('001',N'Toán cao cấp A1','4','480202','1'),
    ('002',N'Tiếng Anh 1','3','480202','1'),
    ('003',N'Vật lý đại cương','4','480202','1'),
    ('004',N'Tiếng Anh 2','7','480202','1'),
    ('005',N'Tiếng Anh 1','3','140902','2'),
    ('006',N'Xác suất thống kê','3','140902','2')

INSERT INTO dbo.DIEMHP (masv,mahp,diemhp)
VALUES
	('002','002','5.9'),
	('002','003','4.5'),
	('003','001','4.3'),
	('003','002','6.7'),
	('003','003','7.3'),
	('004','001','4.0'),
	('004','002','5.2'),
	('004','003','3.5'),
	('005','001','9.8'),
	('005','002','7.9'),
	('005','003','7.5'),
	('006','001','6.1'),
	('006','002','5.6'),
	('006','003','4.0'),
	('007','001','6.2')
-------------------- A -------------------------
ALTER TABLE dbo.SINHVIEN ADD UNIQUE(hoten,diachi)
-------------------- A -------------------------

-------------------- B -------------------------
ALTER TABLE dbo.DIEMHP ADD CHECK(diemhp>=0 AND diemhp<=10)
-------------------- B -------------------------

-------------------- C -------------------------
ALTER TABLE dbo.DMLOP ADD DEFAULT (YEAR(GETDATE())) FOR namnhaphoc
-------------------- C -------------------------

--------- D -----------
-- Không xóa được --
--------- D ------------

-------------------- E -------------------------
ALTER TABLE dbo.DMKHOA ADD ghichu NVARCHAR(100)

ALTER TABLE dbo.DMKHOA DROP COLUMN ghichu

SELECT * FROM dbo.SINHVIEN
-------------------- E -------------------------

-------------------- F -------------------------
ALTER TABLE dbo.SINHVIEN DROP CONSTRAINT FK_SINHVIEN_DMLOP

------ Thêm lại khóa-----------
ALTER TABLE dbo.SINHVIEN
ADD CONSTRAINT FK_SINHVIEN_DMLOP
FOREIGN KEY (malop) REFERENCES dbo.DMLOP(malop);
------ Thêm lại khóa-----------
-------------------- F ------------------------
