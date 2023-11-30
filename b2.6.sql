USE QLSV

-------------------- 1 -------------------------
SELECT DMLOP.malop, DMLOP.tenlop, COUNT(SINHVIEN.masv) AS tongsosv
FROM dbo.DMLOP
JOIN dbo.SINHVIEN ON DMLOP.malop = SINHVIEN.malop
GROUP BY DMLOP.malop, DMLOP.tenlop
HAVING COUNT(SINHVIEN.masv) > 10;
-------------------- 1 -------------------------

-------------------- 2 -------------------------
SELECT sv.hoten,AVG(dhp.diemhp) AS diem_trungbinh
FROM dbo.SINHVIEN sv
JOIN dbo.DIEMHP dhp ON sv.masv = dhp.masv
GROUP BY sv.masv, sv.hoten
HAVING AVG(dhp.diemhp) < 3;
-------------------- 2 -------------------------

-------------------- 3 -------------------------
SELECT sv.hoten FROM dbo.SINHVIEN sv
JOIN dbo.DIEMHP dhp ON sv.masv = dhp.masv
WHERE dhp.diemhp < 5
GROUP BY sv.masv, sv.hoten
HAVING COUNT(dhp.mahp) >= 2
-------------------- 3 -------------------------

-------------------- 4 -------------------------
SELECT sv.hoten
FROM dbo.SINHVIEN sv
JOIN dbo.DIEMHP dhp ON sv.masv = dhp.masv
JOIN dbo.DMHOCPHAN hp ON dhp.mahp = hp.mahp
JOIN dbo.DMNGANH nganh ON hp.manganh = nganh.manganh
WHERE nganh.manganh = '140902'
GROUP BY sv.masv, sv.hoten
HAVING COUNT(DISTINCT hp.mahp) = (SELECT COUNT(*) FROM dbo.DMHOCPHAN WHERE manganh = '140902');
-------------------- 4 -------------------------

-------------------- 5 -------------------------
SELECT sv.hoten
FROM dbo.SINHVIEN sv
JOIN dbo.DIEMHP dhp ON sv.masv = dhp.masv
JOIN dbo.DMHOCPHAN hp ON dhp.mahp = hp.mahp
WHERE hp.mahp IN ('001', '002', '003')
GROUP BY sv.masv, sv.hoten
HAVING COUNT(DISTINCT hp.mahp) >= 3;
-------------------- 5 -------------------------