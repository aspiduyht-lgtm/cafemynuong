-- Script tao database SQL Server cho Cafe Website
-- Chay script nay tren SSMS de tao database moi ma khong anh huong den website hien tai

-- Tao database moi
CREATE DATABASE CafeWebsite_SSMS;
GO

USE CafeWebsite_SSMS;
GO

-- Tao bang Products
CREATE TABLE Products (
    Id NVARCHAR(450) PRIMARY KEY,
    Name NVARCHAR(200) NOT NULL,
    Description NVARCHAR(1000),
    Category INT NOT NULL, -- 0=Coffee, 1=Tea, 2=Smoothie, 3=Juice
    Image NVARCHAR(MAX),
    PriceS DECIMAL(18,2) NOT NULL,
    PriceM DECIMAL(18,2) NOT NULL,
    PriceL DECIMAL(18,2) NOT NULL,
    Available BIT NOT NULL DEFAULT 1,
    CreatedAt DATETIME2 NOT NULL DEFAULT GETDATE()
);

-- Tao bang Users
CREATE TABLE Users (
    Id NVARCHAR(450) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(20) NOT NULL,
    Password NVARCHAR(MAX) NOT NULL,
    CreatedAt DATETIME2 NOT NULL DEFAULT GETDATE(),
    Points INT NOT NULL DEFAULT 0,
    IsActive BIT NOT NULL DEFAULT 1
);

-- Tao unique index cho Email
CREATE UNIQUE INDEX IX_Users_Email ON Users (Email);

-- Tao bang Promotions
CREATE TABLE Promotions (
    Id NVARCHAR(450) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    Description NVARCHAR(MAX),
    Code NVARCHAR(20) NOT NULL,
    Type INT NOT NULL, -- 0=Percentage, 1=FixedAmount, 2=FreeShip
    Value DECIMAL(18,2) NOT NULL,
    MinOrderAmount DECIMAL(18,2) NOT NULL DEFAULT 0,
    MaxUses INT NOT NULL DEFAULT 0,
    UsedCount INT NOT NULL DEFAULT 0,
    StartDate DATETIME2 NOT NULL,
    EndDate DATETIME2 NOT NULL,
    CreatedAt DATETIME2 NOT NULL DEFAULT GETDATE(),
    IsActive BIT NOT NULL DEFAULT 1
);

-- Tao unique index cho Code
CREATE UNIQUE INDEX IX_Promotions_Code ON Promotions (Code);

-- Tao bang Orders
CREATE TABLE Orders (
    Id NVARCHAR(450) PRIMARY KEY,
    UserId NVARCHAR(450),
    CustomerName NVARCHAR(100) NOT NULL,
    CustomerPhone NVARCHAR(20) NOT NULL,
    CustomerEmail NVARCHAR(100),
    CustomerAddress NVARCHAR(500) NOT NULL,
    Notes NVARCHAR(MAX),
    Subtotal DECIMAL(18,2) NOT NULL,
    DiscountAmount DECIMAL(18,2) NOT NULL DEFAULT 0,
    Total DECIMAL(18,2) NOT NULL,
    PromotionCode NVARCHAR(20),
    PromotionId NVARCHAR(450),
    Status INT NOT NULL DEFAULT 0, -- 0=Pending, 1=Confirmed, 2=Preparing, 3=Delivering, 4=Completed, 5=Cancelled
    PaymentMethod INT NOT NULL, -- 0=MoMo, 1=ZaloPay, 2=BankTransfer, 3=COD
    PaymentStatus INT NOT NULL DEFAULT 0, -- 0=Pending, 1=Paid, 2=Failed
    CreatedAt DATETIME2 NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME2 NOT NULL DEFAULT GETDATE(),
    
    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (PromotionId) REFERENCES Promotions(Id)
);

-- Tao bang OrderItems
CREATE TABLE OrderItems (
    Id NVARCHAR(450) PRIMARY KEY,
    OrderId NVARCHAR(450) NOT NULL,
    ProductId NVARCHAR(450) NOT NULL,
    ProductName NVARCHAR(200) NOT NULL,
    Size INT NOT NULL, -- 0=S, 1=M, 2=L
    Quantity INT NOT NULL,
    Price DECIMAL(18,2) NOT NULL,
    Toppings NVARCHAR(MAX), -- JSON string chua danh sach toppings
    
    FOREIGN KEY (OrderId) REFERENCES Orders(Id) ON DELETE CASCADE
);

-- Chen du lieu mau cho Products
INSERT INTO Products (Id, Name, Description, Category, Image, PriceS, PriceM, PriceL, Available, CreatedAt) VALUES
('1', N'Espresso Đậm Đà', N'Cà phê espresso nguyên chất với hương vị đậm đà, thơm ngon.', 0, 'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&w=400', 25000, 35000, 45000, 1, '2024-01-01'),
('2', N'Cappuccino Creamy', N'Sự kết hợp hoàn hảo giữa espresso và sữa tạo bọt mịn màng.', 0, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=400', 35000, 45000, 55000, 1, '2024-01-01'),
('3', N'Trà Sữa Trân Châu', N'Trà sữa truyền thống với trân châu đen mềm mịn.', 1, 'https://images.pexels.com/photos/4021971/pexels-photo-4021971.jpeg?auto=compress&cs=tinysrgb&w=400', 30000, 40000, 50000, 1, '2024-01-01'),
('4', N'Sinh Tố Bơ', N'Sinh tố bơ béo ngậy với sữa đặc ngọt ngào.', 2, 'https://images.pexels.com/photos/1092730/pexels-photo-1092730.jpeg?auto=compress&cs=tinysrgb&w=400', 35000, 45000, 55000, 1, '2024-01-01'),
('5', N'Nước Ép Cam Tươi', N'Nước ép cam tươi 100% từ cam ngọt Việt Nam.', 3, 'https://images.pexels.com/photos/162671/orange-juice-vitamins-drink-fresh-162671.jpeg?auto=compress&cs=tinysrgb&w=400', 25000, 35000, 45000, 1, '2024-01-01');

-- Chen du lieu mau cho Promotions
INSERT INTO Promotions (Id, Title, Description, Code, Type, Value, MinOrderAmount, MaxUses, UsedCount, StartDate, EndDate, IsActive, CreatedAt) VALUES
('promo1', N'Giảm 20% cho thành viên mới', N'Chào mừng thành viên mới với ưu đãi giảm 20%', 'WELCOME20', 0, 20, 50000, 100, 0, '2024-01-01', '2024-12-31', 1, '2024-01-01'),
('promo2', N'Giảm 30k cho đơn từ 200k', N'Giảm ngay 30.000đ cho đơn hàng từ 200.000đ', 'SAVE30K', 1, 30000, 200000, 50, 0, '2024-01-01', '2024-06-30', 1, '2024-01-01');

-- Chen du lieu mau cho Users
INSERT INTO Users (Id, FullName, Email, Phone, Password, CreatedAt, Points, IsActive) VALUES
('user1', N'Nguyễn Văn An', 'nguyenvanan@email.com', '0901234567', 'hashed_password_1', '2024-01-01', 100, 1),
('user2', N'Trần Thị Bình', 'tranthibinh@email.com', '0912345678', 'hashed_password_2', '2024-01-02', 50, 1),
('user3', N'Lê Văn Cường', 'levancuong@email.com', '0923456789', 'hashed_password_3', '2024-01-03', 200, 1);

-- Chen du lieu mau cho Orders
INSERT INTO Orders (Id, UserId, CustomerName, CustomerPhone, CustomerEmail, CustomerAddress, Notes, Subtotal, DiscountAmount, Total, PromotionCode, PromotionId, Status, PaymentMethod, PaymentStatus, CreatedAt, UpdatedAt) VALUES
('order1', 'user1', N'Nguyễn Văn An', '0901234567', 'nguyenvanan@email.com', N'123 Đường ABC, Quận 1, TP.HCM', N'Giao hàng nhanh', 70000, 14000, 56000, 'WELCOME20', 'promo1', 4, 0, 1, '2024-01-15', '2024-01-15'),
('order2', 'user2', N'Trần Thị Bình', '0912345678', 'tranthibinh@email.com', N'456 Đường XYZ, Quận 2, TP.HCM', N'Ít đường', 85000, 0, 85000, NULL, NULL, 2, 3, 0, '2024-01-16', '2024-01-16'),
('order3', 'user3', N'Lê Văn Cường', '0923456789', 'levancuong@email.com', N'789 Đường DEF, Quận 3, TP.HCM', N'Thêm đá', 220000, 30000, 190000, 'SAVE30K', 'promo2', 1, 1, 1, '2024-01-17', '2024-01-17');

-- Chen du lieu mau cho OrderItems
INSERT INTO OrderItems (Id, OrderId, ProductId, ProductName, Size, Quantity, Price, Toppings) VALUES
('item1', 'order1', '1', N'Espresso Đậm Đà', 1, 2, 35000, '[]'),
('item2', 'order2', '2', N'Cappuccino Creamy', 0, 1, 35000, '["Thêm kem"]'),
('item3', 'order2', '3', N'Trà Sữa Trân Châu', 1, 1, 40000, '["Trân châu đen", "Thạch dừa"]'),
('item4', 'order3', '4', N'Sinh Tố Bơ', 2, 2, 55000, '["Thêm sữa đặc"]'),
('item5', 'order3', '5', N'Nước Ép Cam Tươi', 2, 2, 45000, '["Ít đường"]'),
('item6', 'order3', '1', N'Espresso Đậm Đà', 2, 1, 45000, '[]');

GO

-- Tao view de xem thong tin don hang chi tiet
CREATE VIEW vw_OrderDetails AS
SELECT 
    o.Id AS OrderId,
    o.CustomerName,
    o.CustomerPhone,
    o.CustomerEmail,
    o.CustomerAddress,
    o.Total,
    o.Status,
    o.PaymentMethod,
    o.PaymentStatus,
    o.CreatedAt,
    oi.ProductName,
    oi.Size,
    oi.Quantity,
    oi.Price,
    oi.Toppings,
    p.Title AS PromotionTitle,
    p.Code AS PromotionCode,
    o.DiscountAmount
FROM Orders o
LEFT JOIN OrderItems oi ON o.Id = oi.OrderId
LEFT JOIN Promotions p ON o.PromotionId = p.Id;

GO

-- Tao view de xem thong ke san pham ban chay
CREATE VIEW vw_ProductStats AS
SELECT 
    p.Id,
    p.Name,
    p.Category,
    ISNULL(SUM(oi.Quantity), 0) AS TotalSold,
    ISNULL(SUM(oi.Quantity * oi.Price), 0) AS TotalRevenue
FROM Products p
LEFT JOIN OrderItems oi ON p.Id = oi.ProductId
LEFT JOIN Orders o ON oi.OrderId = o.Id AND o.Status = 4 -- Chi tinh don hang hoan thanh
GROUP BY p.Id, p.Name, p.Category;

GO

-- Tao stored procedure de lay thong ke theo thang
CREATE PROCEDURE sp_GetMonthlyStats
    @Year INT,
    @Month INT
AS
BEGIN
    SELECT 
        COUNT(*) AS TotalOrders,
        SUM(Total) AS TotalRevenue,
        AVG(Total) AS AverageOrderValue,
        COUNT(DISTINCT UserId) AS UniqueCustomers
    FROM Orders 
    WHERE YEAR(CreatedAt) = @Year 
    AND MONTH(CreatedAt) = @Month
    AND Status = 4; -- Chi tinh don hang hoan thanh
END;

GO

-- Tao function de tinh diem thuong cho khach hang
CREATE FUNCTION fn_CalculatePoints(@OrderTotal DECIMAL(18,2))
RETURNS INT
AS
BEGIN
    DECLARE @Points INT;
    SET @Points = FLOOR(@OrderTotal / 10000); -- 1 diem cho moi 10,000 VND
    RETURN @Points;
END;

GO

PRINT N'Database CafeWebsite_SSMS đã được tạo thành công!';
PRINT N'Bạn có thể sử dụng các view và stored procedure sau:';
PRINT N'- View: vw_OrderDetails - Xem chi tiết đơn hàng';
PRINT N'- View: vw_ProductStats - Thống kê sản phẩm bán chạy';
PRINT N'- Stored Procedure: sp_GetMonthlyStats - Thống kê theo tháng';
PRINT N'- Function: fn_CalculatePoints - Tính điểm thưởng';
PRINT N'';
PRINT N'Ví dụ sử dụng:';
PRINT N'SELECT * FROM vw_OrderDetails;';
PRINT N'SELECT * FROM vw_ProductStats ORDER BY TotalSold DESC;';
PRINT N'EXEC sp_GetMonthlyStats 2024, 1;';
PRINT N'SELECT dbo.fn_CalculatePoints(100000) AS Points;';