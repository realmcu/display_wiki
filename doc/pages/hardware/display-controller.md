# Display Controller 规格说明

## 概述

Bee3pro Display Controller 是一款高性能显示控制器，支持多种显示接口和数据格式。

**版本信息：** V 1.1 (2022/11/25)

## 主要特性

- 支持多种显示接口（MIPI DSI、DBI、SPI、eDPI）
- 灵活的像素格式转换（RGB565、RGB888、ARGB8888）
- 内置 DMA 控制器，支持高效数据传输
- Tear Effect 同步机制
- 可配置的时序参数

## 系统架构

Display Controller 主要包含以下模块：

- **DMA 控制器**：负责从内存读取图像数据
- **格式转换模块**：支持多种 RGB 格式互转
- **接口控制器**：支持 MIPI/DBI/SPI/eDPI 等接口
- **时序控制**：管理显示时序和同步信号

## 接口说明

### MIPI DSI 接口

Display Controller 支持 MIPI DSI 接口，主要信号包括：

- 数据通道（Data Lanes）
- 时钟通道（Clock Lane）
- 控制信号

详细信号定义参见硬件集成手册。

### DBI 接口

支持 DBI Type B 和 Type C 接口：

- **DBI-B**：8/9/16/18 位并行接口
- **DBI-C**：SPI 串行接口

### SPI 接口

支持标准 SPI 接口，可配置：

- 时钟极性和相位
- 数据位宽
- 传输模式（单/双/四线）

### eDPI 接口

支持嵌入式显示并行接口（embedded Display Parallel Interface），适用于传统 RGB 接口屏幕。

## 像素格式

### 支持的输入格式

- **ARGB8888**：32 位真彩色 + Alpha 通道
- **RGB888**：24 位真彩色
- **RGB565**：16 位高彩色
- **BGR565**：16 位高彩色（字节序相反）

### 格式转换

Display Controller 支持以下格式转换：

#### RGB565 → RGB888

将 16 位 RGB565 扩展为 24 位 RGB888：

- R[4:0] → R[7:3]，低 3 位补 0
- G[5:0] → G[7:2]，低 2 位补 0  
- B[4:0] → B[7:3]，低 3 位补 0

#### ARGB8888 → RGB888

丢弃 Alpha 通道，保留 RGB 分量。

#### RGB888 → RGB565

压缩 24 位到 16 位：

- R[7:3] → R[4:0]
- G[7:2] → G[5:0]
- B[7:3] → B[4:0]

### 字节序配置

支持 8 位和 16 位字节序交换（Byte Swap），适配不同的内存布局。

## DMA 配置

### DMA 通道

Display Controller 内置 DMA 控制器，支持多通道数据传输。

#### Channel 0 寄存器

主要寄存器包括：

- **CTR0**：控制寄存器，配置传输模式
- **CFG0**：配置寄存器，设置源/目标参数
- **SSTAT/DSTAT**：源/目标状态寄存器
- **SSTATAR/DSTATAR**：源/目标地址寄存器

### 传输模式

- **Memory to Peripheral**：从内存传输到显示接口
- **Burst 传输**：支持突发传输提高效率
- **中断机制**：传输完成/错误中断

## Tear Effect 同步

Tear Effect（TE）信号用于同步显示刷新，避免画面撕裂。

### TE 模式

1. **V-Blanking 模式**：在垂直消隐期间触发
2. **V-Blanking + H-Blanking 模式**：在垂直和水平消隐期间触发
3. **指定行模式**：到达指定扫描行时触发

### 使用场景

- **主机快于屏幕**：等待 TE 信号后更新数据
- **主机慢于屏幕**：屏幕自刷新，主机按需更新

## 时序参数

### 屏幕参数示例

典型的屏幕时序参数包括：

- **水平参数**：
  - 有效像素宽度（Active Width）
  - 前肩（HFP - Horizontal Front Porch）
  - 同步宽度（HSW - Horizontal Sync Width）
  - 后肩（HBP - Horizontal Back Porch）

- **垂直参数**：
  - 有效像素高度（Active Height）
  - 前肩（VFP - Vertical Front Porch）
  - 同步宽度（VSW - Vertical Sync Width）
  - 后肩（VBP - Vertical Back Porch）

### 时钟配置

- 像素时钟频率
- MIPI 时钟频率
- 刷新率计算

## 调试功能

### MIPI 调试组

提供 MIPI 接口调试寄存器组，用于：

- 信号质量监测
- 错误计数
- 状态查询

### 常见问题排查

1. **显示异常**：检查格式配置和时序参数
2. **撕裂现象**：启用 TE 同步
3. **性能问题**：优化 DMA 配置和 Burst 大小

## 寄存器映射

详细的寄存器地址映射和位域定义，请参考完整的寄存器手册。

主要寄存器组：

- **0x0000 - 0x00FF**：全局控制寄存器
- **0x0100 - 0x01FF**：DMA 寄存器
- **0x0200 - 0x02FF**：接口配置寄存器
- **0x0300 - 0x03FF**：时序控制寄存器

## 参考资料

- [完整规格文档](../../_static/Bee4_Display_Controller_SPEC.pdf)（如有 PDF 版本）
- MIPI DSI 规范
- DBI 接口规范

## 相关章节

- [显示规格](display-specs.md)
- [驱动芯片](driver-chips.md)
- [接口说明](interface.md)
