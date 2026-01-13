# Display Wiki 文档站点

基于 Sphinx 的显示技术文档站点，支持本地开发和 Read the Docs 托管。

## 快速开始

### 一键启动（推荐）
```bash
git clone https://gitee.com/realmcu_admin/display_wiki.git
cd display_wiki
./quickstart.sh        # 默认端口 8080
./quickstart.sh 9000   # 指定端口 9000
```

脚本会自动：
1. 创建虚拟环境（如不存在）
2. 安装依赖（如未安装）
3. 清理并构建文档
4. 启动预览服务器

### 手动步骤

#### 1. 克隆仓库
```bash
git clone https://gitee.com/realmcu_admin/display_wiki.git
cd display_wiki
```

#### 2. 环境准备
```bash
# 创建虚拟环境
python3 -m venv .venv

# 激活虚拟环境
source .venv/bin/activate  # Linux/macOS/WSL
# Windows: .venv\Scripts\activate

# 安装依赖
pip install -r doc/requirements.txt
```

### 3. 构建文档
```bash
# 清理旧文件并构建（推荐）
rm -rf site/* && sphinx-build -b html doc site

# 或使用构建脚本（需要 sphinx-build 在 PATH）
scripts/build_docs.sh
```

### 4. 本地预览
```bash
# 启动静态服务器
./serve.sh -p 8080

# 浏览器访问
# http://localhost:8080
```

## 项目结构
```
display_wiki/
├── doc/                    # Sphinx 源文件
│   ├── conf.py            # Sphinx 配置
│   ├── index.rst          # 文档入口
│   ├── pages/             # 文档页面（Markdown）
│   ├── _static/           # 静态资源（CSS、图片、PDF）
│   ├── _templates/        # 模板文件
│   └── requirements.txt   # Python 依赖
├── site/                  # 构建输出目录（HTML）
├── scripts/               # 辅助脚本
│   └── build_docs.sh     # 构建脚本
├── serve.sh              # 本地预览服务器
└── .readthedocs.yaml     # Read the Docs 配置
```

## 开发工作流

### 编辑文档
1. 在 `doc/pages/` 下编辑 Markdown 文件
2. 在 `doc/index.rst` 中更新目录结构（如需要）

### 构建与预览
```bash
# 清理并重新构建（避免缓存问题）
rm -rf site/* && source .venv/bin/activate && sphinx-build -b html doc site

# 启动预览服务器
./serve.sh -p 8080
```

### 提交更改
```bash
git add -A
git commit -m "更新文档内容"
git push
```

## 常见问题

### Q: 构建后浏览器显示旧内容？
**A**: Sphinx 增量构建可能导致旧文件残留，使用以下命令清理：
```bash
rm -rf site/*
sphinx-build -b html doc site
```

### Q: `sphinx-build: command not found`？
**A**: 确保已激活虚拟环境：
```bash
source .venv/bin/activate
```

### Q: WSL 下如何从 Windows 浏览器访问？
**A**: 
1. 启动服务：`./serve.sh -p 8080`
2. Windows 浏览器访问：`http://localhost:8080`
3. 如需局域网访问，参考下方端口转发配置

## WSL 局域网访问配置

### 1. 启动服务
```bash
./serve.sh -p 8080
# 记录终端显示的 WSL IP（如 172.21.191.96）
```

### 2. Windows 端口转发（管理员 PowerShell）
```powershell
# 添加端口转发规则
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=8080 connectaddress=<WSL-IP> connectport=8080

# 添加防火墙规则
netsh advfirewall firewall add rule name="WSL Docs 8080" dir=in action=allow protocol=TCP localport=8080
```

### 3. 局域网访问
```
http://<Windows主机IP>:8080
```

**注意**：WSL IP 可能在重启后变化，需重新配置 portproxy。

## Read the Docs 托管

本项目已配置 `.readthedocs.yaml`，在 Read the Docs 绑定仓库即可自动构建。

配置要点：
- Python 版本：3.12
- 依赖文件：`doc/requirements.txt`
- 构建命令：`sphinx-build -b html doc $READTHEDOCS_OUTPUT/html`

## 依赖说明

主要依赖（见 `doc/requirements.txt`）：
- `sphinx>=8.0`: 文档生成引擎
- `sphinx-rtd-theme`: Read the Docs 主题
- `myst-parser`: Markdown 支持
- `sphinxcontrib-mermaid`: Mermaid 图表支持

## 贡献指南

详见 `AGENTS.md` 文档规范。

## 许可证

（待补充）
