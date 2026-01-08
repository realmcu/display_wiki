# 软件开发

本节介绍软件开发相关内容。

## 开发环境

### 工具链安装
```bash
# 安装编译工具
sudo apt install gcc-arm-none-eabi

# 安装调试工具
sudo apt install openocd
```

## API 参考

### 初始化
```c
void display_init(void);
```

### 绘图函数
```c
void display_clear(void);
void display_pixel(int x, int y, uint32_t color);
void display_text(int x, int y, const char *text);
```

## 示例代码

查看 examples 目录获取完整示例。
