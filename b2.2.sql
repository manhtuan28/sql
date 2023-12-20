USE QLSV
  
-------------------- 1 -------------------------
SELECT SV.masv, SV.hoten, SV.malop, DHP.mahp, DHP.diemhp
FROM dbo.SINHVIEN SV
JOIN dbo.DIEMHP DHP ON SV.masv = DHP.masv
WHERE DHP.diemhp >= 5
-------------------- 1 -------------------------


-------------------- 2 -------------------------
SELECT SV.masv, SV.hoten, SV.malop, DHP.mahp, DHP.diemhp
FROM dbo.SINHVIEN SV
JOIN dbo.DIEMHP DHP ON SV.masv = DHP.masv
WHERE DHP.diemhp >= 5
ORDER BY SV.malop ASC, SV.hoten ASC;
-------------------- 2 -------------------------


-------------------- 3 -------------------------
SELECT SV.masv, SV.hoten, SV.malop, LOP.tenlop, NGANH.makhoa
FROM dbo.SINHVIEN SV
JOIN dbo.DMLOP LOP ON SV.malop = LOP.malop
JOIN dbo.DMNGANH NGANH ON LOP.manganh = NGANH.manganh
WHERE NGANH.makhoa = 'CNTT';
-------------------- 3 -------------------------


-------------------- 4 -------------------------
SELECT SV.masv, SV.hoten, SV.malop, DHP.diemhp, DHP.mahp
FROM dbo.SINHVIEN SV
JOIN dbo.DIEMHP DHP ON SV.masv = DHP.masv
JOIN dbo.DMHOCPHAN HP ON DHP.mahp = HP.mahp
WHERE DHP.diemhp BETWEEN 5 AND 7 AND HP.hocky = 1;
-------------------- 4 -------------------------


-------------------- 5 -------------------------
SELECT TOP 5 masv, hoten, malop
FROM dbo.SINHVIEN
WHERE diachi LIKE N'Thái Bình';
-------------------- 5 -------------------------


-------------------- 6 -------------------------
SELECT masv, hoten, malop
FROM dbo.SINHVIEN
WHERE hoten LIKE N'Nguyễn%' OR hoten LIKE N'Trần%' OR hoten LIKE N'Lê%';
-------------------- 6 -------------------------


-------------------- 7 -------------------------
SELECT masv, hoten, ngaysinh
FROM dbo.SINHVIEN
WHERE YEAR(ngaysinh) % 2 = 1 AND DAY(ngaysinh) % 2 = 1 AND MONTH(ngaysinh) % 2 = 1;
-------------------- 7 -------------------------
