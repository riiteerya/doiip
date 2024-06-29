#!/bin/bash

# Đường dẫn tới file chứa danh sách IP trên GitHub
IP_FILE="https://raw.githubusercontent.com/riiteerya/doiip/main/changeip/ips.txt"

# Đọc địa chỉ IP từ danh sách
IP=$(curl -s $IP_FILE | head -n 1)

# Thay đổi địa chỉ IP cho interface eth0 (thay eth0 nếu cần thiết)
sudo ifconfig eth0 $IP netmask 255.255.255.0

# Xóa dòng đầu tiên trong file để chuẩn bị cho lần lặp tiếp theo
curl -s $IP_FILE | sed -i '1d'
