USE QLSV

-------------------- 1 -------------------------
SELECT masv,hoten 
FROM dbo.SINHVIEN
WHERE masv NOT IN (SELECT masv FROM dbo.DIEMHP)
-------------------- 1 -------------------------

-------------------- 2 -------------------------
SELECT masv,hoten
FROM dbo.SINHVIEN
WHERE masv NOT IN (SELECT masv FROM dbo.DIEMHP WHERE mahp='001')
-------------------- 2 -------------------------

-------------------- 3 -------------------------
SELECT mahp,tenhp
FROM dbo.DMHOCPHAN
WHERE mahp NOT IN (SELECT mahp FROM dbo.DIEMHP WHERE diemhp < 5)
-------------------- 3 -------------------------

-------------------- 4 -------------------------
SELECT DISTINCT dbo.SINHVIEN.masv,hoten
FROM dbo.SINHVIEN
WHERE dbo.SINHVIEN.masv NOT IN (SELECT DISTINCT masv FROM dbo.DIEMHP WHERE diemhp < 5)
-------------------- 4 -------------------------