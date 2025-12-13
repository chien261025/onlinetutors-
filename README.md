# Hệ Thống Tìm Gia Sư Riêng Trực Tuyến

## Tổng Quan
**Hệ Thống Tìm Gia Sư Riêng Trực Tuyến** là một nền tảng web giúp kết nối phụ huynh với gia sư một cách dễ dàng. Hệ thống cho phép phụ huynh tìm kiếm gia sư theo môn học, trình độ và vị trí địa lý. Gia sư cũng có thể tạo hồ sơ để quảng bá dịch vụ giảng dạy của mình, và hệ thống hỗ trợ chức năng quản lý cho các quản trị viên.

## Các Tính Năng
- **Module Người Dùng**: Đăng ký, đăng nhập, quản lý người dùng, phục hồi mật khẩu.
- **Module Ebook**: Quản lý các sách điện tử và tài liệu học tập.
- **Module Đặt Lịch**: Đặt lịch học với gia sư, yêu cầu học thử và quản lý các buổi học.
- **Module Đánh Giá**: Đánh giá gia sư dựa trên chất lượng giảng dạy.
- **Module Mail**: Gửi email thông báo về các hoạt động của người dùng, như đăng ký, thanh toán.
- **Module Khóa Học**: Quản lý các khóa học mà gia sư cung cấp.

## Thành Phần Hệ Thống
- **Frontend**: Giao diện người dùng cho phụ huynh, gia sư và quản trị viên.
- **Backend**: Ứng dụng Spring Boot sử dụng Spring Security, Thymeleaf và MySQL làm cơ sở dữ liệu.
- **Email**: Thông báo qua email sử dụng SendGrid.
- **Docker**: Triển khai ứng dụng bằng Docker.

## Yêu Cầu
- Java 17
- Spring Boot 3.2.3
- Cơ sở dữ liệu MySQL
- Docker (dành cho triển khai)
- SendGrid (dành cho thông báo qua email)

## Cài Đặt
1. Clone repository:
   ```bash
   git clone https://github.com/chien261025/onlinetutors-.git
   cd OnlinePrivateTutorsFinderSystem
