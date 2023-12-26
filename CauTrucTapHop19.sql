USE QLSV

-------------------- 1 -------------------------
SELECT DISTINCT sv.masv
FROM SINHVIEN sv
JOIN DIEMHP d ON sv.masv = d.masv
WHERE d.mahp IN ('001', '002')
-------------------- 1 -------------------------

-------------------- 2 -------------------------
SELECT sv.masv
FROM SINHVIEN sv
WHERE sv.masv NOT IN (SELECT DISTINCT masv FROM DIEMHP)
-------------------- 2 -------------------------

-------------------- 3 -------------------------
SELECT sv.masv
FROM SINHVIEN sv
JOIN DIEMHP d ON sv.masv = d.masv
WHERE d.mahp IN ('001', '002')
GROUP BY sv.masv
HAVING COUNT(DISTINCT d.mahp) >= 2
-------------------- 3 -------------------------