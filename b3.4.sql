USE QLSV

-------------------- 1 -------------------------
SELECT dbo.SINHVIEN.masv,hoten,mahp,diemhp
FROM dbo.DIEMHP
INNER JOIN dbo.SINHVIEN ON SINHVIEN.masv = DIEMHP.masv
WHERE diemhp>=ALL (SELECT diemhp FROM dbo.DIEMHP)
-------------------- 1 -------------------------

-------------------- 2 -------------------------
SELECT hoten,YEAR(GETDATE()) - YEAR(ngaysinh)
FROM dbo.SINHVIEN
WHERE YEAR(GETDATE()) - YEAR(ngaysinh) >= ALL
(SELECT YEAR(GETDATE()) - YEAR(ngaysinh) FROM dbo.SINHVIEN)
-------------------- 2 -------------------------

-------------------- 3 -------------------------
SELECT dbo.SINHVIEN.masv,hoten
FROM dbo.DIEMHP
INNER JOIN dbo.SINHVIEN ON SINHVIEN.masv = DIEMHP.masv
WHERE mahp='001' AND diemhp>=ALL(SELECT diemhp FROM dbo.DIEMHP WHERE mahp='001')
-------------------- 3 -------------------------