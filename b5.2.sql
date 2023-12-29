USE QLSV

-------------------- 1 -------------------------
CREATE PROCEDURE HIENTHI_MaHP
@MaHP varchar(5) AS
IF NOT EXISTS (SELECT * FROM DMHOCPHAN WHERE MaHp=@MaHP)
PRINT N'Không có học phần này'
ELSE
SELECT HoTen FROM SINHVIEN
WHERE MaSV NOT IN (SELECT MaSV FROM DIEMHP
WHERE MaHp=@MaHP)

GO
EXEC HIENTHI_MaHP '001'
-------------------- 1 -------------------------