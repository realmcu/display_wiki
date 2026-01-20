#!/bin/bash
set -e

SERVICE_NAME="display-wiki"

# 检查 root 权限
if [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run with sudo"
    echo "Usage: sudo ./uninstall-service.sh"
    exit 1
fi

echo "==> Uninstalling Display Wiki systemd service..."

# 停止服务
if systemctl is-active --quiet "$SERVICE_NAME"; then
    systemctl stop "$SERVICE_NAME"
    echo "✓ Service stopped"
fi

# 禁用服务
if systemctl is-enabled --quiet "$SERVICE_NAME" 2>/dev/null; then
    systemctl disable "$SERVICE_NAME"
    echo "✓ Service disabled"
fi

# 删除服务文件
SERVICE_FILE="/etc/systemd/system/$SERVICE_NAME.service"
if [ -f "$SERVICE_FILE" ]; then
    rm "$SERVICE_FILE"
    echo "✓ Service file removed: $SERVICE_FILE"
fi

# 重载配置
systemctl daemon-reload
echo "✓ Systemd daemon reloaded"

echo ""
echo "==> Service uninstalled successfully!"
