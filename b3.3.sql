USE QLBH

-------------------- 1 -------------------------
SELECT mah
FROM dbo.HANGHOA
WHERE mah NOT IN (SELECT DISTINCT mah FROM dbo.CHITIETHD)
-------------------- 1 -------------------------

-------------------- 2 -------------------------
SELECT *
FROM dbo.KHACHHANG
WHERE NOT EXISTS 
(SELECT 1 FROM dbo.HOADON WHERE HOADON.makh = KHACHHANG.makh AND MONTH(HOADON.ngaylaphd) = 5)
-------------------- 2 -------------------------

-------------------- 3 -------------------------
SELECT *
FROM dbo.HANGHOA
WHERE NOT EXISTS (SELECT 1 FROM dbo.CHITIETHD
JOIN dbo.HOADON ON CHITIETHD.mahd = HOADON.mahd WHERE CHITIETHD.mah = HANGHOA.mah AND MONTH(HOADON.ngaylaphd) = 2)
-------------------- 3 -------------------------

-------------------- 4 -------------------------
SELECT DISTINCT KHACHHANG.*
FROM dbo.KHACHHANG
JOIN dbo.HOADON ON KHACHHANG.makh = HOADON.makh
JOIN dbo.CHITIETHD ON HOADON.mahd = CHITIETHD.mahd
JOIN dbo.HANGHOA ON CHITIETHD.mah = HANGHOA.mah
WHERE HANGHOA.tenh LIKE N'%Bánh%'
-------------------- 4 -------------------------