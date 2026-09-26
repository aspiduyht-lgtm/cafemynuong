using CafeWebsite.Data;
using CafeWebsite.Models;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;
using System.Text;

namespace CafeWebsite;

public static class AddPromotions
{
    public static void AddDecember2025Promotions(CafeDbContext context)
    {
        var promotions = new[]
        {
            new Promotion
            {
                Id = "promo3",
                Title = "🎄 Giáng Sinh Vui Vẻ - Giảm 25%",
                Description = "Chào đón Giáng Sinh với ưu đãi giảm 25% cho mọi đơn hàng từ 100k",
                Code = "XMAS2025",
                Type = PromotionType.Percentage,
                Value = 25,
                MinOrderAmount = 100000,
                MaxUses = 200,
                StartDate = new DateTime(2025, 12, 20),
                EndDate = new DateTime(2025, 12, 26),
                IsActive = true,
                CreatedAt = new DateTime(2025, 12, 1)
            },
            new Promotion
            {
                Id = "promo4",
                Title = "🎉 Đón Năm Mới - Giảm 50k",
                Description = "Tạm biệt 2025, chào đón 2026 với voucher giảm 50k cho đơn từ 150k",
                Code = "NEWYEAR50",
                Type = PromotionType.FixedAmount,
                Value = 50000,
                MinOrderAmount = 150000,
                MaxUses = 150,
                StartDate = new DateTime(2025, 12, 28),
                EndDate = new DateTime(2026, 1, 3),
                IsActive = true,
                CreatedAt = new DateTime(2025, 12, 1)
            },
            new Promotion
            {
                Id = "promo5",
                Title = "☕ Tuần Lễ Cà Phê - Giảm 15%",
                Description = "Thưởng thức cà phê đặc biệt với giảm giá 15% cả tháng 12",
                Code = "COFFEE15",
                Type = PromotionType.Percentage,
                Value = 15,
                MinOrderAmount = 50000,
                MaxUses = 300,
                StartDate = new DateTime(2025, 12, 1),
                EndDate = new DateTime(2025, 12, 31),
                IsActive = true,
                CreatedAt = new DateTime(2025, 12, 1)
            },
            new Promotion
            {
                Id = "promo6",
                Title = "🎁 Mua 2 Tặng 1 Cuối Tuần",
                Description = "Miễn phí ship cho đơn hàng từ 80k vào cuối tuần tháng 12",
                Code = "FREESHIP12",
                Type = PromotionType.FreeShip,
                Value = 0,
                MinOrderAmount = 80000,
                MaxUses = 100,
                StartDate = new DateTime(2025, 12, 1),
                EndDate = new DateTime(2025, 12, 31),
                IsActive = true,
                CreatedAt = new DateTime(2025, 12, 1)
            }
        };

        foreach (var promo in promotions)
        {
            if (!context.Promotions.Any(p => p.Code == promo.Code))
            {
                context.Promotions.Add(promo);
            }
        }
        
        context.SaveChanges();
    }
    
    public static void AddAdminUser(CafeDbContext context)
    {
        if (!context.Users.Any(u => u.Email == "admin@ductam.com"))
        {
            var admin = new User
            {
                FullName = "Admin",
                Email = "admin@ductam.com",
                Phone = "0123456789",
                Password = HashPassword("Admin@123"),
                IsActive = true,
                Points = 0
            };
            
            context.Users.Add(admin);
            context.SaveChanges();
        }
    }
    
    private static string HashPassword(string password)
    {
        using var sha256 = SHA256.Create();
        var hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
        return Convert.ToBase64String(hashedBytes);
    }
}
