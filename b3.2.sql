USE QLSV

-------------------- 1 -------------------------
SELECT SINHVIEN.hoten, DMLOP.tenlop
FROM SINHVIEN
JOIN DMLOP ON SINHVIEN.malop = DMLOP.malop
WHERE SINHVIEN.hoten LIKE N'%Hoa%'
-------------------- 1 -------------------------

-------------------- 2 -------------------------
SELECT SINHVIEN.hoten, DIEMHP.diemhp
FROM SINHVIEN
JOIN DIEMHP ON SINHVIEN.masv = DIEMHP.masv
WHERE DIEMHP.mahp = '001' AND DIEMHP.diemhp < 5
-------------------- 2 -------------------------

-------------------- 3 -------------------------
SELECT mahp, tenhp, sodvht
FROM DMHOCPHAN
WHERE sodvht >= (SELECT sodvht FROM DMHOCPHAN WHERE mahp = '001')
-------------------- 3 -------------------------