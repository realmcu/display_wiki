#!/bin/bash
set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SERVICE_NAME="display-wiki"
SYSTEM_SYSTEMD_DIR="/etc/systemd/system"
SERVICE_FILE="$SYSTEM_SYSTEMD_DIR/$SERVICE_NAME.service"
TEMPLATE_FILE="$PROJECT_DIR/systemd/$SERVICE_NAME.service.template"

# 检查 root 权限
if [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run with sudo"
    echo "Usage: sudo ./install-service.sh"
    exit 1
fi

echo "==> Installing Display Wiki systemd service (system-wide)..."

# 替换模板中的路径和用户并生成服务文件
sed -e "s|PROJECT_DIR|$PROJECT_DIR|g" \
    -e "s|PROJECT_USER|$SUDO_USER|g" \
    "$TEMPLATE_FILE" > "$SERVICE_FILE"

echo "✓ Service file created: $SERVICE_FILE"

# 重载 systemd 配置
systemctl daemon-reload
echo "✓ Systemd daemon reloaded"

# 启用服务
systemctl enable "$SERVICE_NAME"
echo "✓ Service enabled (auto-start on boot)"

# 启动服务
systemctl start "$SERVICE_NAME"
echo "✓ Service started"

# 显示状态
echo ""
echo "==> Service status:"
systemctl status "$SERVICE_NAME" --no-pager

echo ""
echo "==> Service installed successfully!"
echo "    URL: http://localhost:8080"
echo ""
echo "Useful commands:"
echo "  sudo systemctl status $SERVICE_NAME    # 查看状态"
echo "  sudo systemctl stop $SERVICE_NAME      # 停止服务"
echo "  sudo systemctl restart $SERVICE_NAME   # 重启服务"
echo "  sudo journalctl -u $SERVICE_NAME -f    # 查看日志"
echo "  sudo systemctl disable $SERVICE_NAME   # 禁用自启动"
