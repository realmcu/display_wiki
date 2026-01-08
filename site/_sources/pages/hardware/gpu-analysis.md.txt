# GPU 方案分析

## 主流嵌入式 GPU 对比

### ARM Mali 系列

#### Mali-G31
- **架构**：Bifrost 第二代
- **核心数**：1-2 核心
- **性能**：1.2 Gpix/s 填充率，50M 三角形/秒
- **功耗**：0.3-0.6W
- **API 支持**：OpenGL ES 3.2, Vulkan 1.0, OpenCL 2.0
- **应用场景**：智能手表、IoT 设备、入门级显示
- **优势**：功耗极低，面积小（<1mm²）
- **劣势**：性能有限，不适合复杂 3D

#### Mali-G52
- **架构**：Bifrost 第二代
- **核心数**：2-4 核心
- **性能**：2.8 Gpix/s 填充率，120M 三角形/秒
- **功耗**：1.0-2.0W
- **API 支持**：OpenGL ES 3.2, Vulkan 1.1, OpenCL 2.0
- **应用场景**：中端手机、车载显示、工业平板
- **优势**：性能功耗平衡好，支持 HDR
- **劣势**：成本较 G31 高

#### Mali-G57
- **架构**：Valhall 第一代
- **核心数**：1-6 核心
- **性能**：4.5 Gpix/s 填充率，200M 三角形/秒
- **功耗**：1.5-3.0W
- **API 支持**：OpenGL ES 3.2, Vulkan 1.1, OpenCL 2.1
- **应用场景**：高端车载、游戏设备、AR/VR
- **优势**：机器学习加速，性能强劲
- **劣势**：功耗和成本较高

### Imagination PowerVR 系列

#### PowerVR GE8300
- **架构**：Rogue 架构
- **核心数**：1 核心
- **性能**：0.8 Gpix/s 填充率，30M 三角形/秒
- **功耗**：0.2-0.4W
- **API 支持**：OpenGL ES 3.2, Vulkan 1.0
- **应用场景**：低端手机、智能家居显示
- **优势**：超低功耗，基于瓦片渲染（TBDR）
- **劣势**：性能较弱

#### PowerVR GE8320
- **架构**：Rogue 架构
- **核心数**：2 核心
- **性能**：1.6 Gpix/s 填充率，60M 三角形/秒
- **功耗**：0.5-1.0W
- **API 支持**：OpenGL ES 3.2, Vulkan 1.0
- **应用场景**：中端手机、车载仪表
- **优势**：带宽效率高，功耗控制好
- **劣势**：生态不如 Mali 完善

#### PowerVR GT7400
- **架构**：Rogue 架构
- **核心数**：4 核心
- **性能**：3.2 Gpix/s 填充率，150M 三角形/秒
- **功耗**：1.5-2.5W
- **API 支持**：OpenGL ES 3.2, Vulkan 1.1
- **应用场景**：高端车载、专业显示设备
- **优势**：光线追踪支持，画质优秀
- **劣势**：驱动支持不如 ARM 广泛

### Vivante GC 系列

#### GC7000L
- **架构**：Halti5 架构
- **核心数**：1 核心
- **性能**：2.0 Gpix/s 填充率，100M 三角形/秒
- **功耗**：0.8-1.5W
- **API 支持**：OpenGL ES 3.2, Vulkan 1.1, OpenCL 1.2
- **应用场景**：车载显示、工业控制、医疗设备
- **优势**：多显示输出，2D 加速强
- **劣势**：3D 性能一般

#### GC7000UL
- **架构**：Halti5 架构
- **核心数**：2 核心
- **性能**：3.5 Gpix/s 填充率，180M 三角形/秒
- **功耗**：1.2-2.0W
- **API 支持**：OpenGL ES 3.2, Vulkan 1.1, OpenCL 2.0
- **应用场景**：高端车载、多屏显示
- **优势**：支持 4K 输出，视频解码加速
- **劣势**：市场占有率较低

#### GC8000
- **架构**：Halti5 架构
- **核心数**：4 核心
- **性能**：5.0 Gpix/s 填充率，250M 三角形/秒
- **功耗**：2.0-3.5W
- **API 支持**：OpenGL ES 3.2, Vulkan 1.1, OpenCL 2.0
- **应用场景**：高性能车载、专业图形工作站
- **优势**：多核心扩展性好，企业级支持
- **劣势**：功耗较高

## 性能对比表

| GPU 型号 | 架构 | 核心数 | 填充率 | 三角形/秒 | 功耗 | API 支持 | 适用场景 |
|---------|------|--------|--------|----------|------|----------|---------|
| Mali-G31 | Bifrost | 1-2 | 1.2 Gpix/s | 50M | 0.3-0.6W | ES3.2/VK1.0 | 智能手表、IoT |
| Mali-G52 | Bifrost | 2-4 | 2.8 Gpix/s | 120M | 1.0-2.0W | ES3.2/VK1.1 | 中端手机、车载 |
| Mali-G57 | Valhall | 1-6 | 4.5 Gpix/s | 200M | 1.5-3.0W | ES3.2/VK1.1 | 高端车载、AR/VR |
| PowerVR GE8300 | Rogue | 1 | 0.8 Gpix/s | 30M | 0.2-0.4W | ES3.2/VK1.0 | 低端手机、智能家居 |
| PowerVR GE8320 | Rogue | 2 | 1.6 Gpix/s | 60M | 0.5-1.0W | ES3.2/VK1.0 | 中端手机、仪表 |
| PowerVR GT7400 | Rogue | 4 | 3.2 Gpix/s | 150M | 1.5-2.5W | ES3.2/VK1.1 | 高端车载 |
| GC7000L | Halti5 | 1 | 2.0 Gpix/s | 100M | 0.8-1.5W | ES3.2/VK1.1 | 车载、工控 |
| GC7000UL | Halti5 | 2 | 3.5 Gpix/s | 180M | 1.2-2.0W | ES3.2/VK1.1 | 高端车载 |
| GC8000 | Halti5 | 4 | 5.0 Gpix/s | 250M | 2.0-3.5W | ES3.2/VK1.1 | 专业图形 |

## 技术特性对比

### 渲染架构
- **ARM Mali**：立即模式渲染（IMR），适合通用场景
- **PowerVR**：基于瓦片的延迟渲染（TBDR），带宽效率高
- **Vivante**：混合架构，2D/3D 均衡

### 功耗效率
1. **最佳**：PowerVR GE 系列（TBDR 架构优势）
2. **优秀**：Mali-G31（专为低功耗优化）
3. **良好**：Vivante GC7000L、Mali-G52
4. **一般**：Mali-G57、GC8000（高性能代价）

### 驱动支持
1. **最佳**：ARM Mali（Linux 主线内核支持，社区活跃）
2. **良好**：PowerVR（官方驱动稳定）
3. **一般**：Vivante（依赖厂商支持）

### 生态系统
- **ARM Mali**：最广泛，工具链完善（Mali Offline Compiler, Streamline）
- **PowerVR**：中等，有 PVRTune 等专业工具
- **Vivante**：较小，主要依赖 NXP 等合作伙伴

## 应用场景推荐

### 智能手表 / IoT 设备
**推荐**：Mali-G31 或 PowerVR GE8300
- 功耗 < 0.5W
- 支持基础 UI 动画
- 成本敏感

### 车载仪表盘
**推荐**：Mali-G52 或 PowerVR GE8320
- 分辨率 800x480 - 1280x720
- 支持多层合成
- 温度范围 -40°C ~ 85°C

### 车载中控屏
**推荐**：Mali-G57 或 GC7000UL
- 分辨率 1920x1080 或更高
- 支持 3D 导航
- 视频解码加速

### 工业 HMI
**推荐**：GC7000L 或 Mali-G52
- 多显示输出
- 长期供货保证
- 稳定性优先

### AR/VR 设备
**推荐**：Mali-G57 或 PowerVR GT7400
- 高刷新率（90Hz+）
- 低延迟渲染
- 机器学习加速

## 软件渲染方案

当无 GPU 或 GPU 性能不足时，可采用软件渲染：

### 方案选择
1. **LittlevGL (LVGL)**：轻量级 GUI，CPU 渲染
2. **Cairo**：2D 矢量图形库
3. **Skia**：Google 的 2D 图形引擎
4. **TinyGL**：精简版 OpenGL 软件实现

### 优化策略
- 使用 NEON/SIMD 指令加速
- 减少重绘区域（脏矩形）
- 降低色深（RGB565 代替 RGB888）
- 使用 DMA2D 硬件加速（如 STM32）
- 预渲染静态内容

### 性能参考
- **LVGL + NEON**：480x320@30fps（Cortex-A7 @ 1GHz）
- **Cairo**：800x480@15fps（Cortex-A53 @ 1.5GHz）
- **Skia**：1280x720@10fps（Cortex-A53 @ 1.5GHz）

## 选型建议

### 按功耗选择
- **< 0.5W**：Mali-G31, PowerVR GE8300
- **0.5-1.5W**：Mali-G52, PowerVR GE8320, GC7000L
- **1.5-3W**：Mali-G57, PowerVR GT7400, GC7000UL

### 按性能选择
- **入门级**（< 1 Gpix/s）：Mali-G31, PowerVR GE8300
- **中端**（1-3 Gpix/s）：Mali-G52, PowerVR GE8320, GC7000L
- **高端**（> 3 Gpix/s）：Mali-G57, PowerVR GT7400, GC8000

### 按生态选择
- **开源优先**：ARM Mali（主线内核支持）
- **商业支持**：PowerVR（官方技术支持）
- **NXP 平台**：Vivante GC（i.MX 系列集成）

## 参考资源

- [ARM Mali GPU 官方文档](https://developer.arm.com/ip-products/graphics-and-multimedia/mali-gpus)
- [Imagination PowerVR 技术白皮书](https://www.imaginationtech.com/products/gpu/)
- [Vivante GPU 驱动开源项目](https://github.com/etnaviv/etna_viv)
- [Phoronix GPU 性能测试](https://www.phoronix.com/)
