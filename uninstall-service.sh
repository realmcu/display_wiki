#!/bin/bash
set -e

SERVICE_NAME="display-wiki"

echo "==> Uninstalling Display Wiki systemd service..."

# 停止服务
if systemctl --user is-active --quiet "$SERVICE_NAME"; then
    systemctl --user stop "$SERVICE_NAME"
    echo "✓ Service stopped"
fi

# 禁用服务
if systemctl --user is-enabled --quiet "$SERVICE_NAME" 2>/dev/null; then
    systemctl --user disable "$SERVICE_NAME"
    echo "✓ Service disabled"
fi

# 删除服务文件
SERVICE_FILE="$HOME/.config/systemd/user/$SERVICE_NAME.service"
if [ -f "$SERVICE_FILE" ]; then
    rm "$SERVICE_FILE"
    echo "✓ Service file removed: $SERVICE_FILE"
fi

# 重载配置
systemctl --user daemon-reload
echo "✓ Systemd daemon reloaded"

echo ""
echo "==> Service uninstalled successfully!"
