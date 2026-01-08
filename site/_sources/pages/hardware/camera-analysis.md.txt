# Camera 接口方案分析

## 接口类型

### DVP (Digital Video Port)
- 并行接口
- 8/10/12 bit 数据宽度
- 适合低分辨率应用

### MIPI CSI
- 串行高速接口
- 支持多 lane 配置
- 适合高分辨率摄像头

## 连接方案

```
Camera Sensor -> ISP -> Display Controller -> LCD
              ↓
           Memory Buffer
```

## 性能参数
- 最大分辨率：1920x1080 @ 30fps
- 数据带宽：MIPI CSI-2 (4-lane, 1.5Gbps/lane)
- 延迟：< 100ms

## 应用示例
- 实时预览
- 拍照显示
- 视频录制
