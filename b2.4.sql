USE QLSV

-------------------- 1 -------------------------
SELECT SINHVIEN.malop, tenlop, COUNT(masv) AS siso
FROM dbo.DMLOP INNER JOIN dbo.SINHVIEN ON DMLOP.malop = SINHVIEN.malop
GROUP BY SINHVIEN.malop, tenlop
-------------------- 1 -------------------------

-------------------- 2 -------------------------
SELECT masv, SUM(diemhp*sodvht)/SUM(sodvht) AS
diemtbc INTO diemtbc FROM dbo.DMHOCPHAN
INNER JOIN diemhp ON DMHOCPHAN.mahp = diemhp.mahp GROUP BY masv

SELECT hocky, masv, SUM(diemhp*sodvht)/SUM(sodvht) AS diemtbc
-------------------- 2 -------------------------

-------------------- 3 -------------------------
FROM dbo.DMHOCPHAN
INNER JOIN diemhp ON DMHOCPHAN.mahp=diemhp.mahp
GROUP BY hocky,masv
ORDER BY hocky
-------------------- 3 -------------------------

-------------------- 4 -------------------------
SELECT SINHVIEN.malop,tenlop,CASE gioitinh WHEN 0 THEN N'Nữ' ELSE N'Nam'
END AS gioitinh, COUNT(masv) AS soluong
FROM dbo.DMLOP
INNER JOIN dbo.SINHVIEN ON DMLOP.malop=SINHVIEN.malop
GROUP BY SINHVIEN.malop,tenlop,gioitinh
ORDER BY SINHVIEN.malop
-------------------- 4 -------------------------