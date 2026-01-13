#!/bin/bash
# Display Wiki 快速启动脚本

set -e

echo "=== Display Wiki 快速启动 ==="
echo ""

# 检查虚拟环境
if [ ! -d ".venv" ]; then
    echo "创建虚拟环境..."
    python3 -m venv .venv
fi

# 激活虚拟环境
echo "激活虚拟环境..."
source .venv/bin/activate

# 检查依赖
if ! python -c "import sphinx" 2>/dev/null; then
    echo "安装依赖..."
    pip install -r doc/requirements.txt
fi

# 清理并构建
echo "清理旧文件..."
rm -rf site/*

echo "构建文档..."
sphinx-build -b html doc site

# 启动服务
PORT=${1:-8080}
echo ""
echo "=== 构建完成 ==="
echo "启动服务器在端口 $PORT..."
echo ""
./serve.sh -p $PORT
