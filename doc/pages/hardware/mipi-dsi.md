# MIPI DSI 接口详解

本文档基于 IL79400A LCD驱动芯片规格书整理，详细介绍MIPI DSI（Display Serial Interface）接口技术。

## 1. MIPI DSI 概述

### 1.1 什么是 MIPI DSI

MIPI DSI（Mobile Industry Processor Interface - Display Serial Interface）是由MIPI联盟制定的专门用于移动显示设备的高速串行接口标准。它是移动设备中连接处理器和显示屏的主流接口技术。

### 1.2 IL79400A 的 MIPI DSI 支持

IL79400A-XX 支持的 MIPI DSI 规格：

- **DSI 版本**: DSI version 1.2
- **D-PHY 版本**: D-PHY version 1.1
- **数据通道**: 支持 1 个数据通道（Data Lane）
- **时钟通道**: 1 个时钟通道（Clock Lane）
- **最大速率**: 750 Mbps
- **工作模式**: Command Mode（命令模式）和 Video Mode（视频模式）
- **数据传输方向**: 双向传输
- **EMI特性**: 低EMI噪声

### 1.3 应用场景

MIPI DSI 接口在 IL79400A 中主要用于：

- 智能手表（Smart Watch）
- 智能手环（Smart Band）
- 物联网设备（IoT Devices）
- 其他可穿戴设备

这些应用场景需要低功耗、高速数据传输和紧凑的接口设计。

## 2. 接口信号定义

### 2.1 MIPI DSI 信号引脚

IL79400A 的 MIPI DSI 接口包含以下信号：

| 信号名称 | 类型 | 描述 |
|---------|------|------|
| HSSI_CLK_P | 输入 | MIPI DSI 差分时钟对正端 |
| HSSI_CLK_N | 输入 | MIPI DSI 差分时钟对负端 |
| HSSI_D0_P | I/O | MIPI DSI 差分数据对正端（Data Lane 0）|
| HSSI_D0_N | I/O | MIPI DSI 差分数据对负端（Data Lane 0）|
| VG_HSSI | 电源 | MIPI DSI 模拟地 |

### 2.2 信号配置

IL79400A 支持通过 **PSWAP** 硬件引脚控制 MIPI DSI 输出信号的极性交换：

| PSWAP | HSSI_CLK_P | HSSI_CLK_N | HSSI_D0_P | HSSI_D0_N |
|-------|------------|------------|-----------|-----------|
| 0 | CLK+ | CLK- | D0+ | D0- |
| 1 | CLK- | CLK+ | D0- | D0+ |

**注意事项**：
- 如果不使用 MIPI DSI 接口，应将引脚固定到 VG_HSSI
- 如果使用 Deep Standby 模式，在发送深度待机命令后，需要将这些引脚拉到 VG_HSSI

### 2.3 接口使能控制

MIPI DSI 接口通过外部 **IM[1:0]** 引脚使能或禁用：

| IM[1] | IM[0] | 接口模式 |
|-------|-------|---------|
| 0 | 0 | MIPI DSI |
| 0 | 1 | SPI (3-wire/4-wire) |
| 1 | 0 | MCU Interface |
| 1 | 1 | Quad SPI |

## 3. MIPI DSI 物理层（D-PHY）

### 3.1 通道类型

MIPI DSI 使用差分信号传输，包含两种类型的通道：

#### 3.1.1 时钟通道（Clock Lane）

- **信号**: HSSI_CLK_P / HSSI_CLK_N
- **功能**: 提供同步时钟
- **工作模式**:
  - Low Power Mode (LPM) - 低功耗模式
  - Ultra-Low Power Mode (ULPM) - 超低功耗模式
  - High Speed Clock Mode (HSCM) - 高速时钟模式

#### 3.1.2 数据通道（Data Lane）

- **信号**: HSSI_D0_P / HSSI_D0_N
- **数量**: 1 个数据通道
- **功能**: 传输显示数据和命令
- **工作模式**:
  - Low Power (LP) - 低功耗模式
  - High Speed (HS) - 高速模式

### 3.2 通道状态编码

MIPI DSI 使用差分对的电压电平来表示不同的状态：

| 状态代码 | DATA_P | DATA_N | 高速模式 (HS) | 低功耗模式 (LP) |
|---------|--------|--------|--------------|----------------|
| LP-00 | 低 | 低 | - | LP-00 |
| LP-01 | 低 | 高 | - | LP-01 |
| LP-10 | 高 | 低 | - | LP-10 |
| LP-11 | 高 | 高 | - | LP-11 |
| HS-0 | 低 | 高 | HS-0 | - |
| HS-1 | 高 | 低 | HS-1 | - |

**关键概念**：

- **低功耗模式（LP）**: 每条差分线独立工作（单端模式），差分接收器禁用，终端电阻断开，功耗极低
- **高速模式（HS）**: 差分对工作，终端电阻使能，用于高速数据传输

## 4. 工作模式详解

### 4.1 时钟通道工作模式

#### 4.1.1 低功耗模式（LPM）

- 时钟通道处于 LP-11 状态
- 单端模式工作
- 适合传输控制信息和低速数据

#### 4.1.2 超低功耗模式（ULPM）

- 时钟通道处于 LP-00 状态
- 功耗最低
- 用于待机状态

#### 4.1.3 高速时钟模式（HSCM）

- 差分时钟工作
- 高速数据传输时使用
- 速率最高可达 750 Mbps

### 4.2 模式切换

时钟通道可以在三种模式之间切换：

```
Power ON / HW Reset / SW Reset
        ↓
    LP-01 (LPM)
        ↓
    LP-11 (LPM) ←→ ULPM (LP-00)
        ↓
    HSCM (高速时钟)
```

**模式切换序列**：

1. **LPM → ULPM**: LP-11 → LP-10 → LP-00
2. **ULPM → LPM**: LP-00 → LP-01 → LP-11
3. **LPM → HSCM**: LP-11 → LP-01 → LP-00 → HS 时钟启动
4. **HSCM → LPM**: HS 时钟停止 → LP-00 → LP-11

### 4.3 数据通道工作模式

数据通道有两种主要模式：

#### 4.3.1 低功耗模式（LP）

- 用于传输命令和控制信息
- 低速、低功耗
- 单端信号传输

#### 4.3.2 高速模式（HS）

- 用于传输显示数据
- 高速差分信号传输
- 需要时钟通道处于 HSCM 模式

## 5. Escape Mode（逃逸模式）

### 5.1 Escape Mode 概述

Escape Mode 是 MIPI DSI 中一种特殊的低功耗传输模式，用于：

- 传输特殊命令
- 执行低速外设接口操作
- 触发特定功能

### 5.2 Escape 命令

常见的 Escape 命令包括：

| 命令类型 | 描述 |
|---------|------|
| Low Power Data Transmission (LPDT) | 低功耗数据传输 |
| Ultra Low Power State (ULPS) | 进入超低功耗状态 |
| Reset Trigger | 复位触发 |
| Trigger Message | 触发消息 |

### 5.3 Escape Mode 进入和退出序列

**进入序列**：
```
LP-11 → LP-10 → LP-00 → LP-01 → LP-00 (Entry Command)
```

**退出序列**：
```
LP-10 → LP-11 (返回 LP 模式)
```

## 6. MIPI DSI 数据包格式

### 6.1 数据包结构

MIPI DSI 传输的基本单位是数据包（Packet），包含以下部分：

```
┌──────────────────────────────────────────────────────────┐
│ Packet Header (4 bytes) │ Payload (0-65535 bytes) │ Footer │
└──────────────────────────────────────────────────────────┘
```

**Packet Header 结构**：

| 字段 | 位宽 | 描述 |
|------|------|------|
| Data ID (DI) | 8 bits | 数据类型标识 |
| Word Count (WC) | 16 bits | 有效载荷字节数 |
| ECC | 8 bits | 错误校正码 |

### 6.2 数据类型（Data Type）

#### 6.2.1 从 MCU 到显示模块的数据类型

| 数据类型代码 | 描述 |
|-------------|------|
| 0x05 | DCS 短写，无参数 |
| 0x15 | DCS 短写，1个参数 |
| 0x39 | DCS 长写 |
| 0x03 | 通用短读，无参数 |
| 0x13 | 通用短读，1个参数 |
| 0x23 | 通用短读，2个参数 |
| 0x06 | DCS 读 |
| 0x37 | Set Maximum Return Packet Size |

#### 6.2.2 从显示模块到 MCU 的数据类型

| 数据类型代码 | 描述 |
|-------------|------|
| 0x02 | 应答：Acknowledge and Error Report |
| 0x1C | 通用长读响应 |
| 0x21 | 通用短读响应，1 byte |
| 0x22 | 通用短读响应，2 bytes |

### 6.3 错误校正码（ECC）

MIPI DSI 使用 ECC 来检测和纠正传输错误：

- **检测能力**: 可以检测 2 位错误
- **纠正能力**: 可以纠正 1 位错误
- **应用**: 仅应用于 Packet Header

## 7. Command Mode vs Video Mode

### 7.1 Command Mode（命令模式）

**特点**：

- 主机通过发送命令和数据来更新显示
- 显示数据存储在 LCD 驱动芯片的帧缓冲区（Frame Buffer）中
- 适合静态或低帧率显示
- 功耗较低

**数据流**：
```
Host → DSI Command → LCD Driver RAM → Display Panel
```

**IL79400A 支持的 Command Mode 特性**：

- 内置 1/2 压缩 RAM（400 × 400 × 24bits × 1/2）
- 支持部分更新（Partial Update）
- 支持 Tearing Effect 信号同步

### 7.2 Video Mode（视频模式）

**特点**：

- 主机连续发送显示数据流
- 类似于传统的 RGB 接口
- 适合动态视频内容
- 需要持续的数据传输

**数据流**：
```
Host → DSI Video Stream → Display Panel (实时刷新)
```

**IL79400A 支持的 Video Mode 特性**：

- 支持 Bypass RAM Video Mode
- 最大分辨率：(120~400) RGB × 2N (最大 960)

### 7.3 模式选择建议

| 应用场景 | 推荐模式 | 原因 |
|---------|---------|------|
| 智能手表表盘 | Command Mode | 静态显示，功耗低 |
| 视频播放 | Video Mode | 动态内容，帧率高 |
| 用户界面 | Command Mode | 部分更新效率高 |
| 游戏画面 | Video Mode | 实时渲染需求 |

## 8. MIPI DSI 时序参数

### 8.1 时钟通道时序

| 参数 | 符号 | 最小值 | 典型值 | 最大值 | 单位 |
|------|------|-------|-------|-------|------|
| 时钟周期 | t_CLKPERIOD | - | - | 1.33 | ns |
| 时钟频率 | f_CLK | - | - | 750 | MHz |
| 时钟占空比 | - | 45 | 50 | 55 | % |

### 8.2 数据通道时序

| 参数 | 符号 | 描述 |
|------|------|------|
| 数据建立时间 | t_HS-SETUP | 高速模式数据相对时钟的建立时间 |
| 数据保持时间 | t_HS-HOLD | 高速模式数据相对时钟的保持时间 |
| LP 状态最小持续时间 | t_LP-MIN | 低功耗状态最小维持时间 |

### 8.3 模式转换时序

| 转换类型 | 时序参数 |
|---------|---------|
| LP → HS | t_LP-HS |
| HS → LP | t_HS-LP |
| LP-11 → ULPM | t_LP-ULPM |
| ULPM → LP-11 | t_ULPM-LP |

## 9. MIPI DSI 控制器架构

### 9.1 IL79400A MIPI DSI 控制器组成

IL79400A 的 MIPI DSI 控制器由以下模块组成：

```
┌────────────────────────────────────────────────────┐
│                  MIPI DSI 控制器                    │
├────────────────────────────────────────────────────┤
│  D-PHY Controller (物理层控制器)                    │
│  ├─ Analog Transceiver (模拟收发器)                │
│  └─ Lane Management (通道管理)                      │
├────────────────────────────────────────────────────┤
│  Protocol Control Unit (PCU) - 协议控制单元         │
│  ├─ 控制数据流                                      │
│  └─ 管理数据包传输                                  │
├────────────────────────────────────────────────────┤
│  Packet Processing Unit (PPU) - 数据包处理单元      │
│  ├─ 数据包分发                                      │
│  └─ 数据包合并                                      │
├────────────────────────────────────────────────────┤
│  ECC Generating Circuit - ECC 生成电路              │
│  └─ 生成和校验错误校正码                            │
└────────────────────────────────────────────────────┘
```

### 9.2 数据处理流程

**发送数据流程**：

1. 应用层数据 → PPU（打包）
2. PPU → PCU（添加协议头）
3. PCU → ECC Circuit（生成 ECC）
4. ECC Circuit → D-PHY Controller
5. D-PHY Controller → Analog Transceiver → 物理通道

**接收数据流程**：

1. 物理通道 → Analog Transceiver
2. Analog Transceiver → D-PHY Controller
3. D-PHY Controller → ECC Circuit（校验 ECC）
4. ECC Circuit → PCU（解析协议）
5. PCU → PPU（解包）
6. PPU → 应用层

## 10. BTA (Bus Turn-Around) 总线转向

### 10.1 BTA 概述

BTA 是 MIPI DSI 中实现双向通信的机制，允许数据通道从发送模式切换到接收模式。

### 10.2 BTA 时序

**从 MCU 到显示模块的 BTA**：

```
MCU 发送数据 → 发送 BTA 请求 → 总线转向 → 显示模块发送响应 → 总线转回
```

**从显示模块到 MCU 的 BTA**：

```
显示模块准备数据 → 总线转向 → 显示模块发送数据 → BTA 完成 → 总线转回
```

### 10.3 BTA 应用场景

- 读取显示状态寄存器
- 读取显示 ID
- 读取错误状态
- 读取显示内容（Read Memory）

## 11. 错误处理

### 11.1 错误类型

MIPI DSI 支持以下错误检测：

| 错误类型 | 描述 |
|---------|------|
| ECC 单比特错误 | 可自动纠正 |
| ECC 双比特错误 | 检测到但无法纠正 |
| CRC 错误 | 数据载荷校验失败 |
| 协议违规 | 不符合 DSI 协议规范 |
| SOT 错误 | Start of Transmission 同步错误 |

### 11.2 错误报告

IL79400A 提供错误读取命令：

- **命令**: Read Number of the Errors on DSI (0x05)
- **功能**: 读取 DSI 接口上的错误计数
- **错误标志**: D[3] 引脚可输出错误报告标志

### 11.3 错误处理流程

```
┌─────────────────┐
│ 检测到错误       │
├─────────────────┤
│ ECC/CRC 校验     │
├─────────────────┤
│ 单比特错误？     │
│   是 → 自动纠正  │
│   否 → 报告错误  │
├─────────────────┤
│ 更新错误计数器   │
├─────────────────┤
│ 设置错误标志     │
│ (D[3] 引脚)     │
└─────────────────┘
```

## 12. 电气特性

### 12.1 DC 特性

#### 12.1.1 低功耗模式 DC 特性

| 参数 | 符号 | 最小值 | 典型值 | 最大值 | 单位 |
|------|------|-------|-------|-------|------|
| 输入高电平 | V_IH-LP | 0.6 × VDDIO | - | VDDIO | V |
| 输入低电平 | V_IL-LP | 0 | - | 0.3 × VDDIO | V |
| 输出高电平 | V_OH-LP | 0.8 × VDDIO | - | VDDIO | V |
| 输出低电平 | V_OL-LP | 0 | - | 0.15 × VDDIO | V |

#### 12.1.2 高速模式 DC 特性

| 参数 | 符号 | 最小值 | 典型值 | 最大值 | 单位 |
|------|------|-------|-------|-------|------|
| 差分输入电压 | V_ID | 140 | 200 | 270 | mV |
| 共模电压 | V_CM | 70 | 150 | 250 | mV |

### 12.2 终端匹配

- **差分阻抗**: 100Ω ± 15%
- **终端电阻**: 在高速模式下自动使能
- **低功耗模式**: 终端电阻断开以降低功耗

## 13. 实际应用指南

### 13.1 硬件设计注意事项

1. **差分对走线**:
   - 保持等长（长度差 < 5mm）
   - 阻抗控制在 100Ω ± 10%
   - 避免走线拐角过大

2. **电源去耦**:
   - 在 VG_HSSI 附近放置去耦电容（100nF + 10uF）
   - 保持电源干净稳定

3. **信号完整性**:
   - 避免跨越电源分割
   - 远离高频干扰源
   - 添加 EMI 滤波

### 13.2 软件初始化流程

```c
// 1. 硬件复位
GPIO_ResetPin(LCD_RESET_PIN, LOW);
delay_ms(10);
GPIO_ResetPin(LCD_RESET_PIN, HIGH);
delay_ms(120);

// 2. 配置 IM[1:0] 选择 MIPI DSI 模式
GPIO_SetPin(IM0, LOW);
GPIO_SetPin(IM1, LOW);

// 3. 发送初始化命令序列
DSI_SendCommand(0x01);  // Software Reset
delay_ms(120);

DSI_SendCommand(0x11);  // Sleep Out
delay_ms(120);

// 4. 配置显示参数
DSI_SendCommand_Param(0x3A, 0x55);  // Pixel Format: 16-bit/pixel

// 5. 开启显示
DSI_SendCommand(0x29);  // Display ON
```

### 13.3 Command Mode 数据传输示例

```c
// 设置列地址范围
uint8_t caset_data[] = {
    (start_col >> 8) & 0xFF,
    start_col & 0xFF,
    (end_col >> 8) & 0xFF,
    end_col & 0xFF
};
DSI_SendLongCommand(0x2A, caset_data, 4);

// 设置行地址范围
uint8_t raset_data[] = {
    (start_row >> 8) & 0xFF,
    start_row & 0xFF,
    (end_row >> 8) & 0xFF,
    end_row & 0xFF
};
DSI_SendLongCommand(0x2B, raset_data, 4);

// 写入显示数据
DSI_SendCommand(0x2C);  // Memory Write
DSI_SendPixelData(pixel_buffer, pixel_count);
```

### 13.4 读取显示状态

```c
// 设置最大返回数据包大小
uint8_t max_return_size[] = {0x04, 0x00};  // 4 bytes
DSI_SendLongCommand(0x37, max_return_size, 2);

// 读取显示 ID
uint8_t display_id[4];
DSI_ReadCommand(0x04, display_id, 3);

// 读取错误状态
uint8_t error_status[5];
DSI_ReadCommand(0x05, error_status, 5);
```

### 13.5 功耗优化技巧

1. **使用 Command Mode**: 静态显示时功耗更低
2. **启用 Sleep Mode**: 不显示时进入睡眠
3. **ULPM 模式**: 待机时进入超低功耗模式
4. **部分更新**: 仅更新变化区域
5. **CABC 功能**: 根据图像内容自适应调节背光

## 14. 调试技巧

### 14.1 常见问题排查

| 问题 | 可能原因 | 解决方案 |
|------|---------|---------|
| 无显示 | 时钟未启动 | 检查时钟配置和使能 |
| 花屏 | 数据错误 | 检查 ECC 错误计数 |
| 色彩异常 | 像素格式不匹配 | 确认 DPI/DBI 接口配置 |
| 显示卡顿 | 带宽不足 | 降低分辨率或帧率 |

### 14.2 使用示波器调试

**观测点**：

1. **时钟信号**: 检查 HSSI_CLK_P/N 频率和占空比
2. **数据信号**: 观察 HSSI_D0_P/N 数据眼图
3. **LP 状态**: 测量 LP-11, LP-10, LP-01, LP-00 状态切换
4. **HS 数据**: 使用高带宽示波器观察高速数据

### 14.3 软件调试

```c
// 启用错误检测
void DSI_EnableErrorCheck(void) {
    // 定期读取错误状态
    uint8_t error_count[5];
    DSI_ReadCommand(0x05, error_count, 5);
    
    if (error_count[0] != 0) {
        printf("SOT Error: %d\n", error_count[0]);
    }
    if (error_count[1] != 0) {
        printf("SOT Sync Error: %d\n", error_count[1]);
    }
    if (error_count[2] != 0) {
        printf("EOT Sync Error: %d\n", error_count[2]);
    }
    if (error_count[3] != 0) {
        printf("Escape Mode Entry Error: %d\n", error_count[3]);
    }
    if (error_count[4] != 0) {
        printf("LP Transmit Sync Error: %d\n", error_count[4]);
    }
}
```

## 15. 与其他接口对比

### 15.1 MIPI DSI vs SPI

| 特性 | MIPI DSI | SPI |
|------|---------|-----|
| 速度 | 高（750 Mbps） | 低（通常 < 50 MHz） |
| 引脚数 | 少（4根差分线） | 中（4-6根） |
| 功耗 | 低（支持ULPM） | 中 |
| EMI | 低（差分信号） | 高（单端信号） |
| 应用 | 高分辨率显示 | 小尺寸显示 |

### 15.2 MIPI DSI vs RGB

| 特性 | MIPI DSI | Parallel RGB |
|------|---------|-------------|
| 引脚数 | 少（4根） | 多（20+根） |
| 布线复杂度 | 低 | 高 |
| 速度 | 高 | 中 |
| 成本 | 高（需要控制器） | 低 |
| 功耗 | 低 | 中 |

### 15.3 选型建议

- **小屏幕（< 2英寸）**: SPI 或 MCU 接口
- **中等屏幕（2-5英寸）**: MIPI DSI（推荐）
- **大屏幕（> 5英寸）**: MIPI DSI 或 LVDS
- **极低功耗**: MIPI DSI Command Mode
- **高帧率视频**: MIPI DSI Video Mode

## 16. 参考资料

### 16.1 标准文档

- MIPI DSI Specification v1.2
- MIPI D-PHY Specification v1.1
- IL79400A Datasheet

### 16.2 相关术语

| 术语 | 全称 | 中文 |
|------|------|------|
| MIPI | Mobile Industry Processor Interface | 移动产业处理器接口 |
| DSI | Display Serial Interface | 显示串行接口 |
| D-PHY | Physical Layer | 物理层 |
| LP | Low Power | 低功耗 |
| HS | High Speed | 高速 |
| ULPM | Ultra-Low Power Mode | 超低功耗模式 |
| BTA | Bus Turn-Around | 总线转向 |
| ECC | Error Correction Code | 错误校正码 |
| CRC | Cyclic Redundancy Check | 循环冗余校验 |
| DCS | Display Command Set | 显示命令集 |
| SOT | Start of Transmission | 传输起始 |
| EOT | End of Transmission | 传输结束 |

### 16.3 扩展阅读

- [MIPI Alliance 官网](https://www.mipi.org/)
- [Display Timing 计算工具](https://www.mipi.org/specifications/dsi)
- IL79400A 应用笔记

---

**文档版本**: v1.0  
**更新日期**: 2025-02-13  
**基于芯片**: IL79400A LCD Driver IC  
**作者**: Display Wiki Team
