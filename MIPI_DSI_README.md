# MIPI DSI 学习文档

## 📚 文档说明

本文档基于 **IL79400A LCD驱动芯片规格书** 提取并整理，全面介绍 MIPI DSI（Display Serial Interface）接口技术。

## 📁 文档位置

- **源文件**: `doc/pages/hardware/mipi-dsi.md`
- **生成的HTML**: `site/pages/hardware/mipi-dsi.html`

## 🎯 文档内容

### 核心章节（共16个主要章节）

1. **MIPI DSI 概述** - 技术介绍、规格、应用场景
2. **接口信号定义** - 引脚配置、信号极性交换
3. **物理层（D-PHY）** - 通道类型、状态编码
4. **工作模式详解** - LPM/ULPM/HSCM 模式及切换
5. **Escape Mode** - 特殊命令传输模式
6. **数据包格式** - 包结构、数据类型、ECC
7. **Command Mode vs Video Mode** - 两种工作模式对比
8. **时序参数** - 详细的时序规范
9. **控制器架构** - IL79400A MIPI DSI 控制器详解
10. **BTA 总线转向** - 双向通信机制
11. **错误处理** - 错误检测与纠正
12. **电气特性** - DC参数、终端匹配
13. **实际应用指南** - 硬件设计、软件示例、功耗优化
14. **调试技巧** - 常见问题排查、示波器/软件调试
15. **接口对比** - MIPI DSI vs SPI/RGB，选型建议
16. **参考资料** - 标准文档、术语表

### 特色内容

✅ **真实芯片数据**: 基于 IL79400A 规格书提取  
✅ **完整技术细节**: 包含引脚定义、时序参数、电气特性  
✅ **实用代码示例**: C语言初始化、数据传输、错误检测代码  
✅ **调试指导**: 硬件测试、软件调试方法  
✅ **对比分析**: MIPI DSI vs SPI/RGB 详细对比  
✅ **应用建议**: 功耗优化、接口选型指导  

## 🔧 如何使用

### 查看文档

#### 方法1: 启动本地服务器

```bash
# 在项目根目录执行
./serve.sh -p 8000 -d site

# 然后在浏览器访问
# http://localhost:8000/pages/hardware/mipi-dsi.html
```

#### 方法2: 直接打开HTML文件

```bash
# 使用浏览器打开
firefox site/pages/hardware/mipi-dsi.html
# 或
google-chrome site/pages/hardware/mipi-dsi.html
```

#### 方法3: 查看源文件

```bash
# Markdown 源文件
cat doc/pages/hardware/mipi-dsi.md
```

### 重新构建文档

如果修改了源文件，需要重新构建：

```bash
# 激活虚拟环境并构建
source .venv/bin/activate
sphinx-build -b html doc site

# 或使用构建脚本
./scripts/build_docs.sh
```

## 📖 文档导航

在 Display Wiki 站点中，可通过以下路径访问：

```
首页 → 硬件平台 → MIPI DSI 接口详解
```

硬件平台章节现已包含：

- 显示规格
- 驱动芯片
- 接口类型
- **MIPI DSI 接口详解** ← 新增
- 显示控制器
- 2D vs 3D GPU
- GPU 概述
- PSRAM 带宽
- 摄像头分析
- 缓冲区旋转

## 🎓 适用对象

- **硬件工程师**: 了解 MIPI DSI 硬件设计要点
- **软件开发者**: 学习 MIPI DSI 编程接口和初始化流程
- **系统架构师**: 评估不同显示接口方案
- **调试工程师**: 掌握 MIPI DSI 调试技巧
- **技术学习者**: 系统学习 MIPI DSI 技术

## 📊 技术规格摘要

基于 IL79400A 芯片：

| 规格项 | 参数 |
|--------|------|
| DSI 版本 | v1.2 |
| D-PHY 版本 | v1.1 |
| 数据通道数 | 1 Lane |
| 最大速率 | 750 Mbps |
| 工作模式 | Command Mode / Video Mode |
| 压缩支持 | 1/2 数据压缩 |
| 内置RAM | 400×400×24bits×1/2 |

## 🔍 快速查找

### 引脚定义

见 **第2章 - 接口信号定义**

### 初始化代码

见 **第13.2节 - 软件初始化流程**

### 时序参数

见 **第8章 - MIPI DSI 时序参数**

### 错误调试

见 **第14章 - 调试技巧**

### 接口选型

见 **第15章 - 与其他接口对比**

## 📝 文档版本

- **版本**: v1.0
- **创建日期**: 2025-02-13
- **基于芯片**: IL79400A LCD Driver IC
- **参考规格书**: LCD驱动芯片规格书IL79400A.pdf

## 🤝 贡献

如需补充或修正文档内容，请编辑：

```
doc/pages/hardware/mipi-dsi.md
```

然后重新构建文档。

## 📚 相关文档

- [显示接口对比](interface.md)
- [驱动芯片介绍](driver-chips.md)
- [硬件平台概述](index.md)

---

**Display Wiki Team** | 2025
