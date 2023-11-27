USE QLBH

------------------------ 1 ------------------------------------
SELECT makh,tenkh,CONVERT(VARCHAR(10),ngaysinh,103)
AS ngaysinh, CASE gioitinh WHEN 1 THEN N'Nam' ELSE N'Nứ'
END AS gioitinh FROM dbo.KHACHHANG WHERE loaikh = 'TV'
------------------------ 1 ------------------------------------

------------------------ 2 ------------------------------------
SELECT makh, tenkh, CONVERT(VARCHAR(10),ngaysinh,103)
AS ngaysinh, CASE gioitinh WHEN 1 THEN N'Nam' ELSE N'Nữ'
END AS giotinh FROM dbo.KHACHHANG WHERE gioitinh = 'False' AND diachi = N'Quy Nhơn'
------------------------ 2 ------------------------------------


------------------------ 3 ------------------------------------
SELECT makh, tenkh, CONVERT(VARCHAR(10),ngaysinh,103)
AS ngaysinh, CASE gioitinh WHEN 1 THEN N'Nam' ELSE N'Nữ'
END AS gioitinh FROM dbo.KHACHHANG WHERE loaikh = 'VIP' AND (diachi = N'Quy Nhơn' OR diachi = N'Tuy Phước')
------------------------ 3 ------------------------------------


------------------------ 4 ------------------------------------
SELECT COUNT(*) AS 'SoLuongHoaDonXuatVaoThang8'
FROM dbo.HOADON
WHERE MONTH(ngaylaphd) = 8
------------------------ 4 ------------------------------------

------------------------ 5 ------------------------------------
SELECT *
FROM dbo.HANGHOA
WHERE dongia BETWEEN 20000 AND 50000;
------------------------ 5 ------------------------------------

------------------------ 6 ------------------------------------
SELECT mahd, mah, soluong
FROM dbo.CHITIETHD
WHERE soluong > 10;
------------------------ 6 ------------------------------------

------------------------ 7 ------------------------------------
SELECT CHITIETHD.mahd, CHITIETHD.mah, HANGHOA.tenh, HANGHOA.dongia, CHITIETHD.soluong, HANGHOA.dongia * CHITIETHD.soluong AS thanhtien
FROM dbo.CHITIETHD
JOIN dbo.HANGHOA ON CHITIETHD.mah = HANGHOA.mah
WHERE CHITIETHD.mahd = '001';
------------------------ 7 ------------------------------------

------------------------ 8 ------------------------------------
SELECT CHITIETHD.mahd, CHITIETHD.mah, HANGHOA.tenh, HANGHOA.dongia, CHITIETHD.soluong, HANGHOA.dongia * CHITIETHD.soluong AS thanhtien
FROM dbo.CHITIETHD
JOIN dbo.HANGHOA ON CHITIETHD.mah = HANGHOA.mah
WHERE HANGHOA.dongia * CHITIETHD.soluong BETWEEN 1000000 AND 2000000;
------------------------ 8 ------------------------------------

------------------------ 9 ------------------------------------
SELECT DISTINCT KHACHHANG.*
FROM dbo.KHACHHANG
LEFT JOIN dbo.HOADON ON KHACHHANG.makh = HOADON.makh
WHERE HOADON.mahd IS NULL OR MONTH(HOADON.ngaylaphd) != 6;
------------------------ 9 ------------------------------------

------------------------ 10 ------------------------------------
SELECT HOADON.mahd, HOADON.ngaylaphd, HOADON.makh, CHITIETHD.mah, HANGHOA.tenh, HANGHOA.dongia, CHITIETHD.soluong, HANGHOA.dongia * CHITIETHD.soluong AS thanhtien
FROM dbo.HOADON
JOIN dbo.CHITIETHD ON HOADON.mahd = CHITIETHD.mahd
JOIN dbo.HANGHOA ON CHITIETHD.mah = HANGHOA.mah
WHERE MONTH(HOADON.ngaylaphd) = 6;
------------------------ 10 ------------------------------------

------------------------ 11 ------------------------------------
SELECT DISTINCT HANGHOA.mah, HANGHOA.tenh
FROM dbo.HANGHOA
JOIN dbo.CHITIETHD ON HANGHOA.mah = CHITIETHD.mah;
------------------------ 11 ------------------------------------