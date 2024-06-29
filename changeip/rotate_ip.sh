#!/bin/bash

# Đường dẫn tới file chứa danh sách IP
IP_FILE="/path/to/ips.txt"

# Đọc địa chỉ IP từ danh sách
IP=$(head -n 1 $IP_FILE)

# Thay đổi địa chỉ IP cho interface eth0 (thay eth0 nếu cần thiết)
sudo ifconfig eth0 $IP netmask 255.255.255.0

# Xóa dòng đầu tiên trong file để chuẩn bị cho lần lặp tiếp theo
sed -i '1d' $IP_FILE
