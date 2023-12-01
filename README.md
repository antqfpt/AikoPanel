# AikoPanel Version 3

## Nhánh này hỗ trợ các backend sau

- [Aiko-Server](https://github.com/AikoPanel/AikoServer)

**Lưu Ý** : Nhánh này chỉ hỗ trợ mỗi AikoServer Backend

## Bước di chuyển từ phiên bản gốc

Thực hiện các bước sau để chuyển các tệp của bảng điều khiển:

```
git remote set-url origin https://github.com/AikoPanel/AikoPanel
git checkout master  
./update.sh  
```

Thực hiện các bước sau để làm mới cài đặt bộ nhớ cache và khởi động lại hàng đợi:

```
php artisan config:clear
php artisan config:cache
php artisan horizon:terminate
```

# **AikoPanel**

- PHP 7.4 + Loader Ioncube
- Composer
- MariaDB 10.7+
- Redis
- Laravel

## Demo
[Demo](https://demo.aikopanel.com)

## Tài liệu
[Click](https://docs.aikoapnel.com) - Sẽ hỗ trợ trong thời gian sắp tới

## Cộng đồng
🔔Kênh Telegram: [@aikopanel](https://t.me/aikopanel)

## Cách Phản hồi
Làm theo mẫu trong vấn đề để gửi câu hỏi của bạn một cách chính xác, và chúng tôi sẽ có người theo dõi với bạn.
