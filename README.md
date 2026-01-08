# Display Wiki（WSL 静态站点）

本目录提供一个最小可用的静态文档站点，适合在 WSL 下开发并通过 Windows 浏览器访问，亦可通过端口转发在局域网访问。

## 结构
- `site/`：对外访问的静态文件目录
  - `index.html`：入口页面（更新此页的目录链接）
  - `assets/`：样式、图片等静态资源
  - `docs/`：各文档页面（HTML）
- `serve.sh`：一键启动静态服务的脚本

## 启动
在仓库根目录执行：

```bash
./serve.sh            # 默认端口 8000，目录 site/
./serve.sh -p 9000    # 指定端口
./serve.sh -d site    # 指定目录（默认就是 site）
```

启动后：
- 同机 Windows 直接访问：`http://localhost:PORT`
- 终端会打印 WSL IP（用于配置 Windows 端口转发）

## 局域网访问（通过 Windows 主机转发）
1. 在 WSL 运行 `./serve.sh -p 8000`（或你需要的端口）。
2. 打开 Windows PowerShell（管理员），执行：

```powershell
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=8000 connectaddress=<WSL-IP> connectport=8000
netsh advfirewall firewall add rule name="WSL Docs 8000" dir=in action=allow protocol=TCP localport=8000
```

3. 局域网设备访问：`http://<Windows主机IP>:8000`
4. 提示：WSL IP 可能在重启后变化，如无法访问更新一次 `portproxy`。

## 写作建议
- 页面放在 `site/docs/`，并在 `site/index.html` 维护导航链接。
- 资源走相对路径（例如 `assets/style.css`、`assets/img.png`）。
- 统一 UTF-8 编码，文件名使用英文与短横线。

## 编译 Sphinx 文档
本仓库已预置了 Sphinx 双语结构。

### 环境准备
```bash
# 创建虚拟环境
python3 -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate

# 安装依赖
pip install -r doc/requirements.txt
```

### 构建文档
```bash
# 构建中英文文档到 site/cn 和 site/en
scripts/build_docs.sh

# 启动服务预览
./serve.sh -p 8080
```

访问：
- 中文文档：http://localhost:8080/cn
- 英文文档：http://localhost:8080/en

### Read the Docs 托管
配置见 `.readthedocs.yaml`。在 RTD 绑定仓库即可自动构建。
