USE QLSV

-------------------- 1 -------------------------
SELECT TOP 1 sv.masv,sv.hoten,AVG(diem.diemhp) AS tbchp
FROM dbo.SINHVIEN sv
JOIN dbo.DIEMHP diem ON sv.masv = diem.masv
GROUP BY sv.masv, sv.hoten
ORDER BY tbchp DESC
-------------------- 1 -------------------------

-------------------- 2 -------------------------
SELECT TOP 1 sv.masv,sv.hoten,COUNT(diem.mahp) AS sohocphan_duoi5
FROM dbo.SINHVIEN sv
JOIN dbo.DIEMHP diem ON sv.masv = diem.masv
WHERE diem.diemhp < 5
GROUP BY sv.masv, sv.hoten
ORDER BY sohocphan_duoi5 DESC
-------------------- 2 -------------------------

-------------------- 3 -------------------------
SELECT TOP 1 hp.mahp,hp.tenhp,COUNT(diem.masv) AS sosinhvien_duoi5
FROM dbo.DMHOCPHAN hp
JOIN dbo.DIEMHP diem ON hp.mahp = diem.mahp
WHERE diem.diemhp < 5
GROUP BY hp.mahp, hp.tenhp
ORDER BY sosinhvien_duoi5 DESC
-------------------- 3 -------------------------

-------------------- 4 -------------------------
SELECT TOP 5 sv.masv,sv.hoten,AVG(diem.diemhp) AS tbchp
FROM dbo.SINHVIEN sv
JOIN dbo.DIEMHP diem ON sv.masv = diem.masv
GROUP BY sv.masv, sv.hoten
ORDER BY tbchp ASC
-------------------- 4 -------------------------
