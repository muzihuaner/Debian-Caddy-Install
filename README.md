# Debian-Caddy-Install

### 使用说明：

### 运行脚本：

```
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/muzihuaner/Debian-Caddy-Install/main/install_caddy.sh)"
```

### 脚本功能：

1. 自动检测 root 权限
2. 安装必要依赖
3. 添加官方 Caddy 仓库和 GPG 密钥
4. 设置正确的文件权限
5. 安装最新版 Caddy
6. 验证安装并显示管理命令

### 安装后管理：

- 启动服务：`sudo systemctl start caddy`
- 开机自启：`sudo systemctl enable caddy`
- 配置文件：`/etc/caddy/Caddyfile`
- 日志查看：`journalctl -u caddy`

### 注意事项：

1. 脚本仅适用于 Debian/Ubuntu 及其衍生系统
2. 会覆盖现有 `/etc/apt/sources.list.d/caddy-stable.list`
3. 需要稳定的网络连接来下载资源
4. 安装后 Caddy 服务不会自动启动，需手动启动

如果需要自定义配置，安装后编辑 `/etc/caddy/Caddyfile` 并重启服务：`sudo systemctl restart caddy`