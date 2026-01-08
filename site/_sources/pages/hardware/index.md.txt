# 硬件平台

本节介绍支持的显示硬件平台。

## 显示屏规格

### 分辨率支持
- 240x240
- 320x240
- 480x480
- 800x480

### 接口类型
- SPI
- RGB
- MIPI DSI

## 驱动芯片

常用显示驱动芯片列表。

## 接口说明

详细的硬件接口定义和连接方式。

## GPU 方案分析

### 硬件 GPU 加速

#### 支持的 GPU
- ARM Mali GPU
- PowerVR GPU
- Vivante GC 系列

#### 性能对比
| GPU 型号 | 填充率 | 三角形/秒 | 功耗 |
|---------|--------|----------|------|
| Mali-G31 | 1.2 Gpix/s | 50M | 低 |
| GC7000L | 2.0 Gpix/s | 100M | 中 |

#### 应用场景
- 3D 界面渲染
- 视频硬件解码
- 图像后处理

### 软件渲染方案

无 GPU 时的软件渲染优化策略。

## Camera 接口方案分析

### 接口类型

#### DVP (Digital Video Port)
- 并行接口
- 8/10/12 bit 数据宽度
- 适合低分辨率应用

#### MIPI CSI
- 串行高速接口
- 支持多 lane 配置
- 适合高分辨率摄像头

### 连接方案

```
Camera Sensor -> ISP -> Display Controller -> LCD
              ↓
           Memory Buffer
```

### 性能参数
- 最大分辨率：1920x1080 @ 30fps
- 数据带宽：MIPI CSI-2 (4-lane, 1.5Gbps/lane)
- 延迟：< 100ms

### 应用示例
- 实时预览
- 拍照显示
- 视频录制
