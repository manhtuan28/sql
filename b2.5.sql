USE QLSV
-------------------- 1 -------------------------
SELECT hocky,masv,SUM(diemhp*sodvht)/SUM(sodvht) AS diemtbc
FROM dbo.DMHOCPHAN
INNER JOIN dbo.DIEMHP ON DIEMHP.mahp = DMHOCPHAN.mahp
WHERE hocky=1
GROUP BY hocky,masv
ORDER BY hocky
-------------------- 1 -------------------------

-------------------- 2 -------------------------
SELECT sv.masv,sv.hoten,COUNT(CASE WHEN dh.diemhp < 5 THEN 1 ELSE NULL END) AS hocphanthieudiem
FROM dbo.SINHVIEN sv
JOIN dbo.DIEMHP dh ON sv.masv = dh.masv
GROUP BY sv.masv, sv.hoten
ORDER BY sv.masv;
-------------------- 2 -------------------------

-------------------- 3 -------------------------
SELECT dhp.mahp,dhp.tenhp,COUNT(CASE WHEN dh.diemhp < 5 THEN 1 ELSE NULL END) AS sinhvienthieudiem
FROM dbo.DMHOCPHAN dhp
JOIN dbo.DIEMHP dh ON dhp.mahp = dh.mahp
GROUP BY dhp.mahp, dhp.tenhp
ORDER BY dhp.mahp;
-------------------- 3 -------------------------

-------------------- 4 -------------------------
SELECT sv.masv,sv.hoten,SUM(CASE WHEN dh.diemhp < 5 THEN dhp.sodvht ELSE 0 END) AS sodvhtthieudiem
FROM dbo.SINHVIEN sv
JOIN dbo.DIEMHP dh ON sv.masv = dh.masv
JOIN dbo.DMHOCPHAN dhp ON dh.mahp = dhp.mahp
GROUP BY sv.masv, sv.hoten
ORDER BY sv.masv;
-------------------- 4 -------------------------
