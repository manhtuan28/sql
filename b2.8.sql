USE QLBH

-------------------- 1 -------------------------
SELECT KHACHHANG.makh,KHACHHANG.tenkh,SUM(CHITIETHD.soluong * HANGHOA.dongia) AS tongthanhthien
FROM KHACHHANG
JOIN HOADON ON KHACHHANG.makh = HOADON.makh
JOIN CHITIETHD ON HOADON.mahd = CHITIETHD.mahd
JOIN HANGHOA ON CHITIETHD.mah = HANGHOA.mah
GROUP BY  KHACHHANG.makh, KHACHHANG.tenkh
ORDER BY KHACHHANG.makh
-------------------- 1 -------------------------

-------------------- 2 -------------------------
SELECT KHACHHANG.makh,KHACHHANG.tenkh,SUM(CHITIETHD.soluong * HANGHOA.dongia) AS tongthanhthien
FROM KHACHHANG
JOIN HOADON ON KHACHHANG.makh = HOADON.makh
JOIN CHITIETHD ON HOADON.mahd = CHITIETHD.mahd
JOIN HANGHOA ON CHITIETHD.mah = HANGHOA.mah
WHERE KHACHHANG.loaikh = 'VIP'
GROUP BY KHACHHANG.makh, KHACHHANG.tenkh
ORDER BY KHACHHANG.makh
-------------------- 2 -------------------------

-------------------- 3 -------------------------
SELECT KHACHHANG.makh,KHACHHANG.tenkh,SUM(CHITIETHD.soluong * HANGHOA.dongia) AS tongthanhthien
FROM KHACHHANG
JOIN HOADON ON KHACHHANG.makh = HOADON.makh
JOIN CHITIETHD ON HOADON.mahd = CHITIETHD.mahd
JOIN HANGHOA ON CHITIETHD.mah = HANGHOA.mah
GROUP BY KHACHHANG.makh, KHACHHANG.tenkh
HAVING SUM(CHITIETHD.soluong * HANGHOA.dongia) >= 20000000
ORDER BY KHACHHANG.makh
-------------------- 3 -------------------------


-------------------- 4 -------------------------
SELECT HANGHOA.mah,HANGHOA.tenh,SUM(CHITIETHD.soluong) AS tongSoLuong
FROM HANGHOA
JOIN CHITIETHD ON HANGHOA.mah = CHITIETHD.mah
GROUP BY HANGHOA.mah, HANGHOA.tenh
ORDER BY HANGHOA.mah
-------------------- 4 -------------------------

-------------------- 5 -------------------------
SELECT HOADON.mahd,SUM(CHITIETHD.soluong * HANGHOA.dongia) AS tongthanhthien
FROM HOADON
JOIN CHITIETHD ON HOADON.mahd = CHITIETHD.mahd
JOIN HANGHOA ON CHITIETHD.mah = HANGHOA.mah
GROUP BY HOADON.mahd
HAVING SUM(CHITIETHD.soluong * HANGHOA.dongia) > 5000000
ORDER BY HOADON.mahd
-------------------- 5 -------------------------

-------------------- 6 -------------------------
SELECT HOADON.mahd,HOADON.makh,HOADON.ngaylaphd
FROM HOADON
JOIN CHITIETHD ON HOADON.mahd = CHITIETHD.mahd
JOIN HANGHOA ON CHITIETHD.mah = HANGHOA.mah
WHERE HANGHOA.mah IN ('H001', 'H002')
GROUP BY HOADON.mahd, HOADON.makh, HOADON.ngaylaphd
HAVING COUNT(DISTINCT HANGHOA.mah) >= 2
ORDER BY HOADON.mahd
-------------------- 6 -------------------------

-------------------- 7 -------------------------
SELECT HOADON.makh,KHACHHANG.tenkh
FROM HOADON
JOIN CHITIETHD ON HOADON.mahd = CHITIETHD.mahd
JOIN HANGHOA ON CHITIETHD.mah = HANGHOA.mah
JOIN KHACHHANG ON HOADON.makh = KHACHHANG.makh
WHERE HANGHOA.tenh LIKE '%Bánh%'
GROUP BY HOADON.makh, KHACHHANG.tenkh
HAVING COUNT(DISTINCT HANGHOA.mah) = (SELECT COUNT(*)FROM HANGHOA WHERE tenh LIKE '%Bánh%')
-------------------- 7 -------------------------

-------------------- 8 -------------------------
SELECT KHACHHANG.makh,KHACHHANG.tenkh,COUNT(HOADON.mahd) AS soHoaDon
FROM KHACHHANG
LEFT JOIN HOADON ON KHACHHANG.makh = HOADON.makh
GROUP BY KHACHHANG.makh, KHACHHANG.tenkh
ORDER BY KHACHHANG.makh
-------------------- 8 -------------------------

-------------------- 9 -------------------------
SELECT HOADON.mahd,SUM(CHITIETHD.soluong * HANGHOA.dongia * 0.95) AS tongThanhTien
FROM HOADON
JOIN CHITIETHD ON HOADON.mahd = CHITIETHD.mahd
JOIN HANGHOA ON CHITIETHD.mah = HANGHOA.mah
GROUP BY HOADON.mahd
HAVING SUM(CHITIETHD.soluong * HANGHOA.dongia) > 500000
ORDER BY HOADON.mahd
-------------------- 9 -------------------------

-------------------- 10 -------------------------
SELECT KHACHHANG.makh,KHACHHANG.tenkh,SUM(CHITIETHD.soluong * HANGHOA.dongia) AS tongThanhTien
FROM KHACHHANG
JOIN HOADON ON KHACHHANG.makh = HOADON.makh
JOIN CHITIETHD ON HOADON.mahd = CHITIETHD.mahd
JOIN HANGHOA ON CHITIETHD.mah = HANGHOA.mah
WHERE KHACHHANG.loaikh = 'VIP' AND YEAR(HOADON.ngaylaphd) = 2018
GROUP BY KHACHHANG.makh, KHACHHANG.tenkh
HAVING SUM(CHITIETHD.soluong * HANGHOA.dongia) < 20000000
ORDER BY KHACHHANG.makh
-------------------- 10 -------------------------

-------------------- 11 -------------------------
SELECT TOP 1 HOADON.mahd AS 'Số hóa đơn',HOADON.ngaylaphd AS 'Ngày bán',KHACHHANG.tenkh AS 'Tên khách hàng',
KHACHHANG.diachi AS 'Địa chỉ khách hàng',
SUM(CHITIETHD.soluong * HANGHOA.dongia) AS 'Tổng giá trị hóa đơn'
FROM HOADON
JOIN CHITIETHD ON HOADON.mahd = CHITIETHD.mahd
JOIN HANGHOA ON CHITIETHD.mah = HANGHOA.mah
JOIN KHACHHANG ON HOADON.makh = KHACHHANG.makh
GROUP BY HOADON.mahd, HOADON.ngaylaphd, KHACHHANG.tenkh, KHACHHANG.diachi
ORDER BY SUM(CHITIETHD.soluong * HANGHOA.dongia) DESC
-- ChatGPT làm chứ cn người éo ai làm được.
-------------------- 11 -------------------------

-------------------- 12 -------------------------
SELECT TOP 1 HOADON.mahd AS 'Số hóa đơn',HOADON.ngaylaphd AS 'Ngày',KHACHHANG.tenkh AS 'Tên khách hàng',
KHACHHANG.diachi AS 'Địa chỉ khách hàng',
SUM(CHITIETHD.soluong * HANGHOA.dongia) AS 'Tổng trị giá hóa đơn'
FROM HOADON
JOIN CHITIETHD ON HOADON.mahd = CHITIETHD.mahd
JOIN HANGHOA ON CHITIETHD.mah = HANGHOA.mah
JOIN KHACHHANG ON HOADON.makh = KHACHHANG.makh
WHERE MONTH(HOADON.ngaylaphd) = 5 AND YEAR(HOADON.ngaylaphd) = 2000
GROUP BY HOADON.mahd, HOADON.ngaylaphd, KHACHHANG.tenkh, KHACHHANG.diachi
ORDER BY SUM(CHITIETHD.soluong * HANGHOA.dongia) DESC
-------------------- 12 -------------------------

-------------------- 13 -------------------------
SELECT TOP 1 HOADON.mahd AS 'Số hóa đơn',HOADON.ngaylaphd AS 'Ngày',KHACHHANG.tenkh AS 'Tên khách hàng',
KHACHHANG.diachi AS 'Địa chỉ khách hàng',
SUM(CHITIETHD.soluong * HANGHOA.dongia) AS 'Tổng trị giá hóa đơn'
FROM HOADON
JOIN CHITIETHD ON HOADON.mahd = CHITIETHD.mahd
JOIN HANGHOA ON CHITIETHD.mah = HANGHOA.mah
JOIN KHACHHANG ON HOADON.makh = KHACHHANG.makh
GROUP BY HOADON.mahd, HOADON.ngaylaphd, KHACHHANG.tenkh, KHACHHANG.diachi
ORDER BY SUM(CHITIETHD.soluong * HANGHOA.dongia) ASC
-------------------- 13 -------------------------

-------------------- 14 -------------------------
SELECT TOP 1 KHACHHANG.makh AS 'Mã khách hàng',KHACHHANG.tenkh AS 'Tên khách hàng',COUNT(HOADON.mahd) AS 'Số lượng hóa đơn'
FROM KHACHHANG
JOIN HOADON ON KHACHHANG.makh = HOADON.makh
GROUP BY KHACHHANG.makh, KHACHHANG.tenkh
ORDER BY COUNT(HOADON.mahd) DESC
-------------------- 14 -------------------------

-------------------- 15 -------------------------
SELECT TOP 1 KHACHHANG.makh AS 'Mã khách hàng',KHACHHANG.tenkh AS 'Tên khách hàng',SUM(CHITIETHD.soluong) AS 'Tổng số lượng hàng'
FROM KHACHHANG
JOIN HOADON ON KHACHHANG.makh = HOADON.makh
JOIN CHITIETHD ON HOADON.mahd = CHITIETHD.mahd
GROUP BY KHACHHANG.makh, KHACHHANG.tenkh
ORDER BY SUM(CHITIETHD.soluong) DESC
-------------------- 15 -------------------------

-------------------- 16 -------------------------
SELECT TOP 1 HANGHOA.mah AS 'Mã mặt hàng',HANGHOA.tenh AS 'Tên mặt hàng',COUNT(CHITIETHD.mah) AS 'Số lượng hóa đơn'
FROM HANGHOA
JOIN CHITIETHD ON HANGHOA.mah = CHITIETHD.mah
GROUP BY HANGHOA.mah, HANGHOA.tenh
ORDER BY COUNT(CHITIETHD.mah) DESC
-------------------- 16 -------------------------

-------------------- 17 -------------------------
SELECT TOP 1 HANGHOA.mah AS 'Mã mặt hàng',HANGHOA.tenh AS 'Tên mặt hàng',SUM(CHITIETHD.soluong) AS 'Tổng số lượng bán'
FROM HANGHOA
JOIN CHITIETHD ON HANGHOA.mah = CHITIETHD.mah
GROUP BY HANGHOA.mah, HANGHOA.tenh
ORDER BY SUM(CHITIETHD.soluong) DESC
-------------------- 17 -------------------------
