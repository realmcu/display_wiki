# 显示问题

## 屏幕无显示
**原因**：
- 电源未连接
- 初始化失败
- 接口配置错误

**解决方法**：
1. 检查电源连接
2. 查看初始化日志
3. 确认接口配置

## 显示花屏
**原因**：
- 时序配置错误
- 信号干扰
- 驱动不匹配

**解决方法**：
1. 检查时序参数
2. 改善信号质量
3. 更新驱动程序

## 进入DLPS
**步骤**：
1. 等待LCDC进入IDLE状态,且保证
2. 配置LCDC进入FW模式
3. 关闭时钟，pin配置

**LCDC代码**

    LCDC_HANDLER_OPERATE_CTR_t handler_reg_0x14;
    do
    {
        handler_reg_0x14.d32 = LCDC_HANDLER->OPERATE_CTR;
    }
    while (handler_reg_0x14.b.auto_write_start != RESET);
    LCDC_AutoWriteCmd(DISABLE);
    LCDC_HANDLER->INFINITE_MODE_CTR &=	(~BIT31);
    LCDC_Cmd(DISABLE);
    LCDC_HANDLER->DMA_FIFO_ICR |= BIT0;
    while(LCDC_HANDLER->DMA_FIFO_CTRL & BIT0);
    while(LCDC_DMA_BASE->LCDC_DMA_ChEnReg & BIT0)
    {
        LCDC_DMA_Channel0->LCDC_DMA_CFG_LOWx |= BIT8;
        while (!(LCDC_DMA_Channel0->LCDC_DMA_CFG_LOWx & BIT0));
			/*disable channel0*/  
        LCDC_DMA_BASE->LCDC_DMA_ChEnReg = 0x100;				//CH_EN_WE and CH_EN need to be write to the register at the same time;
    }
    LCDC_DMAChannelCmd(LCDC_DMA_CHANNEL_NUM, DISABLE);
    LCDC_DmaCmd(DISABLE);
    LCDC_DMA_MultiBlockCmd(DISABLE);
    LCDC_Cmd(DISABLE);