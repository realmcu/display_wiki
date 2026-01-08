# 快速开始

本节帮助你快速了解和使用显示系统。

## 环境准备

### 硬件要求
- 显示屏模组
- 开发板
- 连接线缆

### 软件要求
- 开发工具链
- 驱动程序
- 示例代码

## 第一个示例

```c
#include "display.h"

int main(void) {
    display_init();
    display_clear();
    display_text(0, 0, "Hello Display!");
    return 0;
}
```

## 下一步

- 查看 [硬件平台](../hardware/index.md) 了解硬件规格
- 查看 [软件开发](../software/index.md) 学习 API 使用
