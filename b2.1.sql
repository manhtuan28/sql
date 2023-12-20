USE QLSV
-------------------- 1 -------------------------
SELECT masv, hoten, CONVERT(VARCHAR(10), ngaysinh, 103)
AS ngaysinh, CASE gioitinh WHEN 0 THEN N'Nam' ELSE N'Nữ'
END AS gioitinh, YEAR(ngaysinh) AS namsinh FROM dbo.SINHVIEN
WHERE hoten NOT LIKE N'[NLT]%'
-------------------- 1 -------------------------

-------------------- 2 -------------------------
SELECT masv, hoten , CONVERT(VARCHAR(10), ngaysinh, 103)
AS ngaysinh, CASE gioitinh WHEN 0 THEN N'Nam' ELSE N'Nữ'
END AS gioitinh, YEAR(ngaysinh) AS namsinh
FROM dbo.SINHVIEN WHERE gioitinh=1 AND malop='CT11'
-------------------- 4 -------------------------
-------------------- 2 -------------------------

-------------------- 3 -------------------------
SELECT masv, hoten, CONVERT(VARCHAR(10), ngaysinh, 103)
AS ngaysinh, CASE gioitinh WHEN 0 THEN N'Nam' ELSE N'Nữ'
END AS gioitinh FROM dbo.SINHVIEN WHERE malop IN ('CT11', 'CT12', 'CT13')
-------------------- 3 -------------------------

SELECT masv, hoten, CONVERT(VARCHAR(10), ngaysinh, 103)
AS ngaysinh, CASE gioitinh WHEN 0 THEN N'Nam' ELSE N'Nữ'
END AS gioitinh, YEAR(GETDATE()) - YEAR(ngaysinh) AS tuoi
FROM dbo.SINHVIEN WHERE YEAR(GETDATE()) - YEAR(ngaysinh) BETWEEN 19 AND 21
-------------------- 4 -------------------------
