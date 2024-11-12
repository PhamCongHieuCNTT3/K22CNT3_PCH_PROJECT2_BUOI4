CREATE DATABASE PCHSampleDb;
GO

USE PCHSampleDb;
GO

CREATE TABLE QUAN_TRI( 
    ID INT PRIMARY KEY IDENTITY, 
    TaiKhoan VARCHAR(25) UNIQUE,
    MatKhau VARCHAR(255),
    TrangThai TINYINT
);
GO

CREATE TABLE LOAI_SAN_PHAM(
    ID INT PRIMARY KEY IDENTITY,
    MaLoai VARCHAR(255) UNIQUE,
    TenLoai NVARCHAR(255),
    TrangThai TINYINT
);
GO

CREATE TABLE SAN_PHAM(
    ID INT PRIMARY KEY IDENTITY, 
    MaSanPham VARCHAR(255) UNIQUE, 
    TenSanPham NVARCHAR(255),
    HinhAnh NVARCHAR(255),
    SoLuong INT,
    DonGia FLOAT,
    MaLoai INT REFERENCES LOAI_SAN_PHAM(ID),
    TrangThai TINYINT
);
GO

CREATE TABLE KHACH_HANG(
    ID INT PRIMARY KEY IDENTITY,
    MaKhachHang VARCHAR(255) UNIQUE,
    HoTenKhachHang NVARCHAR(255),
    Email VARCHAR(255) UNIQUE, 
    MatKhau VARCHAR(255),
    DienThoai VARCHAR(10) UNIQUE,
    DiaChi NVARCHAR(255),
    NgayDangKy DATETIME,
    TrangThai TINYINT
);
GO

CREATE TABLE HOA_DON(
    ID INT PRIMARY KEY IDENTITY, 
    MaHoaDon VARCHAR(255) UNIQUE, 
    MaKhachHang INT REFERENCES KHACH_HANG(ID), 
    NgayHoaDon DATETIME,
    NgayNhan DATETIME,
    HoTenKhachHang NVARCHAR(255),
    Email VARCHAR(255),
    DienThoai VARCHAR(10),
    DiaChi NVARCHAR(255),
    TongTriGia FLOAT,
    TrangThai TINYINT
);
GO

CREATE TABLE CT_HOA_DON(
    ID INT PRIMARY KEY IDENTITY,
    HoaDonID INT REFERENCES HOA_DON(ID), 
    SanPhamID INT REFERENCES SAN_PHAM(ID), 
    SoLuongMua INT,
    DonGiaMua FLOAT,
    ThanhTien FLOAT,
    TrangThai TINYINT
);
GO
INSERT INTO QUAN_TRI (TaiKhoan, MatKhau, TrangThai)
VALUES 
    ('admin', 'password123', 1),
    ('user1', 'user1pass', 1),
    ('user2', 'user2pass', 0);
GO
INSERT INTO LOAI_SAN_PHAM (MaLoai, TenLoai, TrangThai)
VALUES 
    ('LSP001', N'Điện thoại', 1),
    ('LSP002', N'Laptop', 1),
    ('LSP003', N'Phụ kiện', 1);
GO
INSERT INTO SAN_PHAM (MaSanPham, TenSanPham, HinhAnh, SoLuong, DonGia, MaLoai, TrangThai)
VALUES 
    ('SP001', N'iPhone 13', 'iphone13.png', 100, 999.99, 1, 1),
    ('SP002', N'MacBook Pro', 'macbookpro.png', 50, 1999.99, 2, 1),
    ('SP003', N'AirPods Pro', 'airpods.png', 200, 249.99, 3, 1);
GO
INSERT INTO KHACH_HANG (MaKhachHang, HoTenKhachHang, Email, MatKhau, DienThoai, DiaChi, NgayDangKy, TrangThai)
VALUES 
    ('KH001', N'Nguyễn Văn A', 'nguyenvana@example.com', 'khachhang1', '0912345678', N'Hà Nội', GETDATE(), 1),
    ('KH002', N'Lê Thị B', 'lethib@example.com', 'khachhang2', '0987654321', N'Hồ Chí Minh', GETDATE(), 1);
GO
INSERT INTO HOA_DON (MaHoaDon, MaKhachHang, NgayHoaDon, NgayNhan, HoTenKhachHang, Email, DienThoai, DiaChi, TongTriGia, TrangThai)
VALUES 
    ('HD001', 1, GETDATE(), DATEADD(day, 3, GETDATE()), N'Nguyễn Văn A', 'nguyenvana@example.com', '0912345678', N'Hà Nội', 1249.98, 1),
    ('HD002', 2, GETDATE(), DATEADD(day, 4, GETDATE()), N'Lê Thị B', 'lethib@example.com', '0987654321', N'Hồ Chí Minh', 1999.99, 1);
GO
SELECT * FROM QUAN_TRI;
GO

SELECT * FROM LOAI_SAN_PHAM;
GO

SELECT * FROM SAN_PHAM;
GO

SELECT * FROM KHACH_HANG;
GO

SELECT * FROM HOA_DON;
GO

SELECT * FROM CT_HOA_DON;
GO

DROP TABLE CT_HOA_DON;
GO

DROP TABLE HOA_DON;
GO

DROP TABLE KHACH_HANG;
GO

DROP TABLE SAN_PHAM;
GO

DROP TABLE LOAI_SAN_PHAM;
GO

DROP TABLE QUAN_TRI;
GO







