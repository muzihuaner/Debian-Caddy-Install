#!/bin/bash

# Caddy 安装脚本
# 适用于 Debian/Ubuntu 系统
# 需要 root 或 sudo 权限

set -e

# 检查是否以 root 或 sudo 运行
if [ "$(id -u)" -ne 0 ]; then
  echo "请使用 sudo 或以 root 用户运行此脚本"
  exit 1
fi

# 添加必要的依赖
echo "安装基础依赖..."
apt update > /dev/null
apt install -y debian-keyring debian-archive-keyring apt-transport-https curl

# 添加 Caddy 仓库密钥
echo "添加 Caddy GPG 密钥..."
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | \
gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg

# 添加 Caddy 仓库
echo "添加 Caddy 软件仓库..."
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | \
tee /etc/apt/sources.list.d/caddy-stable.list > /dev/null

# 设置文件权限
chmod o+r /usr/share/keyrings/caddy-stable-archive-keyring.gpg
chmod o+r /etc/apt/sources.list.d/caddy-stable.list

# 安装 Caddy
echo "安装 Caddy..."
apt update > /dev/null
apt install -y caddy

# 验证安装
if command -v caddy &> /dev/null; then
  echo -e "\n\033[32mCaddy 安装成功！\033[0m"
  echo "版本信息: $(caddy version)"
  echo -e "\n管理命令:"
  echo "启动服务: systemctl start caddy"
  echo "设置开机启动: systemctl enable caddy"
  echo "查看状态: systemctl status caddy"
else
  echo -e "\n\033[31m错误：Caddy 安装失败\033[0m" >&2
  exit 1
fi
