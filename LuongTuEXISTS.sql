USE QLSV

-------------------- 1 -------------------------
SELECT COUNT(DISTINCT masv) AS SoLuong
FROM SINHVIEN
WHERE EXISTS (SELECT 1 FROM DIEMHP WHERE DIEMHP.masv = SINHVIEN.masv)
-------------------- 1 -------------------------

-------------------- 2 -------------------------
SELECT COUNT(DISTINCT masv) AS SoLuong
FROM SINHVIEN
WHERE NOT EXISTS (SELECT 1 FROM DIEMHP WHERE DIEMHP.masv = SINHVIEN.masv)
-------------------- 2 -------------------------

-------------------- 3 -------------------------
SELECT malop, tenlop
FROM DMLOP
WHERE NOT EXISTS (SELECT 1 FROM SINHVIEN WHERE SINHVIEN.malop = DMLOP.malop)
-------------------- 3 -------------------------