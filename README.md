# ☕ WEBSITE BÁN CAFE VÀ ĐỒ UỐNG GIẢI KHÁT - ASP.NET CORE 9.0

> **Báo cáo Đồ án Chuyên ngành Công nghệ Thông tin**  
> **Trường Đại học Trà Vinh (TVU) - Trường Kỹ thuật và Công nghệ**  
> **Sinh viên thực hiện:** Lê Thị Mỹ Nương  
> **Giảng viên hướng dẫn:** TS Nguyễn Nhứt Lam  

---

## 🌟 GIỚI THIỆU DỰ ÁN
Dự án **Website Bán Cafe & Giải Khát** là ứng dụng thương mại điện tử chuyên ngành F&B được xây dựng trên nền tảng công nghệ hiện đại **ASP.NET Core 9.0 (.NET 9)** kết hợp **Entity Framework Core 9.0**.

Hệ thống cung cấp giải pháp toàn diện từ đặt món trực tuyến, tùy biến linh hoạt dung tích ly (Size S/M/L), chọn Topping kèm theo, quản lý giỏ hàng thông minh qua Session, động cơ khuyến mãi Voucher đa dạng, đến bảng điều khiển Admin quản trị đơn hàng tập trung.

---

## 🚀 TÍNH NĂNG NỔI BẬT

### 1. Phân hệ Khách hàng (Customer)
- **Thực đơn trực quan:** Khám phá danh mục đồ uống đa dạng: Cà phê nguyên chất, Trà sữa, Sinh tố hoa quả, Nước ép tươi.
- **Tùy chọn đặc thù F&B:**
  - Tùy chọn 3 mức dung tích: **Size S (Nhỏ) / Size M (Vừa) / Size L (Lớn)**.
  - Tùy chọn Topping phong phú: Trân châu đen, thạch trái cây, pudding trứng, kem cheese.
  - Tự động cộng dồn và cập nhật đơn giá theo thời gian thực (Real-time).
- **Quản lý Giỏ hàng qua Session:** Tuần tự hóa JSON, phân tách rạch ròi các món cùng tên nhưng khác Size hoặc khác Topping.
- **Hệ thống Mã khuyến mãi (Promotion Engine):**
  - Giảm theo % giá trị đơn hàng (Ví dụ: `WELCOME20`, `COFFEE15`).
  - Giảm tiền mặt trực tiếp (Ví dụ: `SAVE30K`, `NEWYEAR50`).
  - Miễn phí vận chuyển (Ví dụ: `FREESHIP12` cho đơn từ 80k).
- **Thanh toán đa dạng:** Hỗ trợ COD (tiền mặt khi nhận), quét mã QR Ví MoMo / ZaloPay và Chuyển khoản ngân hàng.
- **Hệ thống Thành viên:** Đăng ký, đăng nhập tài khoản bảo mật và tích điểm thưởng (Loyalty Points) sau mỗi đơn hàng.

### 2. Phân hệ Quản trị viên (Admin)
- **Dashboard tổng quan:** Thống kê nhanh tình trạng đơn hàng và kho thức uống.
- **Quản lý Thực đơn (CRUD):** Thêm món mới kèm upload ảnh, cập nhật giá niêm yết theo Size, bật/tắt công tắc `Available` khi hết nguyên liệu.
- **Quản lý Vòng đời đơn hàng:** Cập nhật 6 trạng thái xử lý thực tế:  
  `Pending (Chờ duyệt)` ➔ `Confirmed (Đã nhận)` ➔ `Preparing (Đang pha chế)` ➔ `Delivering (Đang giao)` ➔ `Completed (Hoàn tất)`.
- **Quản trị Chiến dịch Khuyến mãi:** Tạo mã voucher mới, cấu hình ngày bắt đầu/kết thúc và giới hạn số lượt áp dụng.

---

## 🛠️ CÔNG NGHỆ SỬ DỤNG
- **Backend:** C# 13, ASP.NET Core 9.0 MVC.
- **Database & ORM:** Entity Framework Core 9.0, SQLite (`cafe.db`) sẵn sàng chuyển đổi Microsoft SQL Server.
- **Frontend:** HTML5, CSS3, Bootstrap 5, JavaScript Fetch API.
- **Architecture:** Mô hình MVC kết hợp Dependency Injection (`CartService`).

---

## 💻 HƯỚNG DẪN CÀI ĐẶT & CHẠY DỰ ÁN

### Yêu cầu môi trường
- Đã cài đặt [.NET 9.0 SDK](https://dotnet.microsoft.com/download/dotnet/9.0) trở lên.
- Visual Studio 2022 (v17.12+) hoặc Visual Studio Code.

### Các bước khởi chạy:
```bash
# 1. Clone repository về máy tính
git clone https://github.com/<USERNAME>/CafeWebsite.git
cd CafeWebsite

# 2. Phục hồi các gói thư viện
dotnet restore

# 3. Khởi chạy ứng dụng
dotnet run
```
Truy cập trình duyệt tại địa chỉ: `http://localhost:5259`

---

## 📊 TÀI KHOẢN QUẢN TRỊ MẶC ĐỊNH
- **Email:** `admin@ductam.com` hoặc `admin@mynuong.com`
- **Mật khẩu:** Đã được mã hóa băm an toàn trong CSDL.

---

## 📁 TÀI LIỆU KÈM THEO
- **Slide thuyết trình PowerPoint (.pptx):** Đã nhúng logo ĐH Trà Vinh và hình ảnh sản phẩm thực tế, lưu tại thư mục gốc của repository.
