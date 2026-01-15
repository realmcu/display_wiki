#!/bin/bash
set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SERVICE_NAME="display-wiki"
USER_SYSTEMD_DIR="$HOME/.config/systemd/user"
SERVICE_FILE="$USER_SYSTEMD_DIR/$SERVICE_NAME.service"
TEMPLATE_FILE="$PROJECT_DIR/systemd/$SERVICE_NAME.service.template"

echo "==> Installing Display Wiki systemd service..."

# 创建 systemd 用户目录
mkdir -p "$USER_SYSTEMD_DIR"

# 替换模板中的路径并生成服务文件
sed "s|PROJECT_DIR|$PROJECT_DIR|g" "$TEMPLATE_FILE" > "$SERVICE_FILE"

echo "✓ Service file created: $SERVICE_FILE"

# 重载 systemd 配置
systemctl --user daemon-reload
echo "✓ Systemd daemon reloaded"

# 启用服务
systemctl --user enable "$SERVICE_NAME"
echo "✓ Service enabled (auto-start on login)"

# 启动服务
systemctl --user start "$SERVICE_NAME"
echo "✓ Service started"

# 显示状态
echo ""
echo "==> Service status:"
systemctl --user status "$SERVICE_NAME" --no-pager

echo ""
echo "==> Service installed successfully!"
echo "    URL: http://localhost:8080"
echo ""
echo "Useful commands:"
echo "  systemctl --user status $SERVICE_NAME    # 查看状态"
echo "  systemctl --user stop $SERVICE_NAME      # 停止服务"
echo "  systemctl --user restart $SERVICE_NAME   # 重启服务"
echo "  journalctl --user -u $SERVICE_NAME -f    # 查看日志"
echo "  systemctl --user disable $SERVICE_NAME   # 禁用自启动"
echo ""
echo "Optional: Enable service to run without login"
echo "  loginctl enable-linger $USER"
