USE	QLSV
 
-------------------- 1 -------------------------
SELECT masv, mahp, diemhp
FROM DIEMHP
WHERE diemhp > (SELECT MAX(diemhp) FROM DIEMHP WHERE masv = '001')
-------------------- 1 -------------------------

-------------------- 2 -------------------------
SELECT sv.masv, dh.mahp, dh.diemhp
FROM SINHVIEN sv
JOIN DIEMHP dh ON sv.masv = dh.masv
WHERE dh.diemhp > 2 * (SELECT AVG(diemhp) FROM DIEMHP WHERE masv = sv.masv)
-------------------- 2 -------------------------
