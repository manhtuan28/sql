USE QLSV

-------------------- 1 -------------------------
CREATE PROCEDURE HIENTHI_Diem
@diemhp numeric(4,1)
AS
IF NOT EXISTS (SELECT * FROM dbo.DIEMHP WHERE diemhp < @diemhp)
PRINT N'Không có sinh viên nào'
ELSE
SELECT dbo.SINHVIEN.masv,hoten,malop,mahp,diemhp
FROM dbo.DIEMHP
INNER JOIN dbo.SINHVIEN ON dbo.DIEMHP.masv = dbo.SINHVIEN.masv
WHERE dbo.DIEMHP.diemhp < @diemhp

GO

EXEC HIENTHI_Diem 5
-------------------- 1 -------------------------