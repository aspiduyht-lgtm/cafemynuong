-- Thêm các chương trình khuyến mãi tháng 12/2025

INSERT INTO Promotions (Id, Title, Description, Code, Type, Value, MinOrderAmount, MaxUses, UsedCount, StartDate, EndDate, CreatedAt, IsActive)
VALUES 
('promo3', '🎄 Giáng Sinh Vui Vẻ - Giảm 25%', 'Chào đón Giáng Sinh với ưu đãi giảm 25% cho mọi đơn hàng từ 100k', 'XMAS2025', 0, 25, 100000, 200, 0, '2025-12-20', '2025-12-26', '2025-12-01', 1),
('promo4', '🎉 Đón Năm Mới - Giảm 50k', 'Tạm biệt 2025, chào đón 2026 với voucher giảm 50k cho đơn từ 150k', 'NEWYEAR50', 1, 50000, 150000, 150, 0, '2025-12-28', '2026-01-03', '2025-12-01', 1),
('promo5', '☕ Tuần Lễ Cà Phê - Giảm 15%', 'Thưởng thức cà phê đặc biệt với giảm giá 15% cả tháng 12', 'COFFEE15', 0, 15, 50000, 300, 0, '2025-12-01', '2025-12-31', '2025-12-01', 1),
('promo6', '🎁 Mua 2 Tặng 1 Cuối Tuần', 'Miễn phí ship cho đơn hàng từ 80k vào cuối tuần tháng 12', 'FREESHIP12', 2, 0, 80000, 100, 0, '2025-12-01', '2025-12-31', '2025-12-01', 1);
