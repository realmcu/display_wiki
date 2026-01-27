Bee3pro Display Controller

V 1.1

2022/11/25

修订历史（Revision History）

目 录


表目录

表 2-1 Display Controller MIPI Signals	17

表 2-2 Display Controller Pinmux Signals	18

表 3-1 RGB Format 转换	22

表 7-1 DMA channel0 register	33

表 7-2 DMA Channel0 CTR0 Register Configuration	34

表 7-3 DMA Channel0 CFG0 Register Configuration	36

表 9-1 SPIC interface description	54

表 9-2 Pixel data output format HW mode for SPIC	56

表 11-1 eDPI interface and function description	80

表 11-2 屏幕参数举例说明	81

表 12-1 MIPI debug group	103


图目录

图 1-1 Display Controller Block图	13

图 1-2 Display Controller Tx 数据流向	15

图 1-3 Display Controller DBI-B Rx 数据流向	15

图 3-1 8bits & 16bits swap	19

图 3-2 16bits swap	19

图 3-3 8bits swap	19

图 3-4 ARGB888 存储方式	19

图 3-5 BGR565 存储方式	20

图 3-6 RGB565 存储方式	20

图 3-7 RGB888 Stream 存储方式	20

图 3-8 32bits ARGB8888 input Format	21

图 3-9 32bits RGB565 define(2 pixels) input format	21

图 3-10 32bits BGR565 define(2 pixels) input format	21

图 3-11 RGB888 Stream define(4 pixels) input format（332bits）	21

图 3-12 RGB565 output(2 bytes)	21

图 3-13 RGB888 output(3 bytes)	21

图 3-14 RGB565 convert to RGB888	22

图 4-1 tear effect output of V-Blanking	23

图 4-2 tear output of V-Blanking and H-Blanking	24

图 4-3 tear output of rearching line N	24

图 4-4 Host action when host is faster than LCD self-refreshing	25

图 4-5 Host action when host is slower than LCD self-refreshing	25

图 7-1 DMA 初始默认设置	32

图 7-2 DMA channel0 SSTAT&DSTAT	33

图 7-3 DMA channel0 SSTATAR&DSTATAR	33

图 7-4 DMA channel0 SGR&DSR	34

图 7-5 DMA channel0 Interrupt 相关	37

图 7-6 DMA Miscellaneous 相关	38

图 7-7 DMA DmaCfgReg 相关	38

图 7-8 DMA ChEnReg 相关	39

图 7-9 DMA Configuration Parameter 相关	39

图 7-10 DMA CTRL0 TT_FC 相关	40

图 7-11 DMA Suspend-Cancel流程	43

图 7-12 Auto-Reloaded Address for Source and Destination	43

图 7-13 Contiguous Source Address and Auto-Reloaded Destination Address	44

图 7-14 Linked Address for Source and Destination	46

图 7-15 DMA hardware handshake signals	46

图 8-1 DMA link list module flow	48

图 8-2 DMA link list module group1	48

图 8-3 DMA link list module group2	49

图 8-4 DMA link list module control register	49

图 8-5 DMA link list module offset	49

图 9-1 MIPI DBI-C interface	52

图 9-2 SPIC interface	53

图 9-3 Function Description of SPIC setting	54

图 9-4 SPIC Transmit Mode	55

图 9-5 SPIC Receive Mode	55

图 9-6 SPIC User Mode Addr&CMD Length	56

图 9-7 SPIC User Mode Addr、CMD、Data channel	56

图 9-8 MIPI DBI type C option1 Write 1	58

图 9-9 MIPI DBI type C option1 Write 2	58

图 9-10 MIPI DBI type C option1 RGB565	58

图 9-11 MIPI DBI type C option1 Read 1	59

图 9-12 MIPI DBI type C option1 Read 2	59

图 9-13 MIPI DBI type C option3 Write	60

图 9-14 MIPI DBI type C option3 RGB565	60

图 9-15 MIPI DBI type C option3 Read	61

图 9-16 RGB565 Pixel Dual SPI option1	61

图 9-17 RGB888 Pixel Dual SPI option1	61

图 9-18 RGB565 Pixel Dual SPI option2	62

图 9-19 RGB888 Pixel Dual SPI option2	62

图 9-20 Pixel QSPI RGB888 option1	62

图 9-21 Pixel QSPI RGB888 option2	63

图 9-22 Ramless QSPI与DPI waveform对比	64

图 9-23 Ramless QSPI 发送帧的流程	64

图 9-24 Ramless QSPI RGB888 Color format	66

图 9-25 Ramless QSPI RGB565 Color format	66

图 9-26 Ramless Dual-SPI RGB888 Color format	66

图 9-27 Ramless Dual-SPI RGB565 Color format	67

图 9-28 Ramless SPI RGB888 Color format	67

图 9-29 Ramless SPI RGB565 Color format	67

图 10-1 MIPI DBI-B interface	70

图 10-2 MIPI DBI-B State Machine	71

图 10-3 DBI-B interface write sequence	72

图 10-4 DBI-B interface read sequence	72

图 10-5 DBI-B RGB565 color map	73

图 10-6 DBI-B RGB888 color map	73

图 11-1 eDPI interface and block	78

图 11-2 eDPI interface	79

图 11-3 eDPI waveform description	80

图 11-4 eDPI Video mode 4行4列LCD屏幕各信号波形图	81

图 11-5 eDPI Video mode LCD屏幕每一行Pixel波形图	81

图 11-6 eDPI Video mode dpishutdn and power off sequence	82

图 11-7 eDPI Video mode dpishutdn and power on sequence	83

图 11-8  eDPI Video mode from full-color to 8-color mode	84

图 11-9 eDPI Video mode from 8-color to full-color mode	84

图 11-10 eDPI下通过software来更新configuration	85

图 11-11 eDPI下通过hardware来更新configuration	86

图 11-12 BLLP of one Frame	86

图 11-13 edpihalt in video mode	87

图 11-14 eDPI Adapted Command Mode waveform	87

图 11-15 eDPI Adapted Command Mode tear effect	88

图 11-16 DSI下返回tear signal的方式	88

图 11-17 eDPI Adapted Command Mode halt wareform	89

图 11-18 DW DSI 屏幕相关参数举例说明	90

图 11-19 eDPI Video Mode 屏幕相关参数说明	92

图 11-20 eDPI Video Mode SYNC、DE信号说明	94

图 11-21 eDPI RGB color map(dpidata signals)	94

图 12-1 增加line buffer后的Display Controller框架图	100



词汇表




# Overview

## General Description

Display Controller通过内部自带的DMA从RAM搬运至内部的handler FIFO。通过pixel converter将image转换为对应的pixel format，选择不同的interface将pixel输出。目前可以支持的interface如下：

DBI-B interface

SPIC interface

DBI-C interface

QSPI interface（114&144，DDR）

OPI interface（118&188，DDR）

DPI interface

DSI interface

DSI video mode（burst mode&non-burst mode）

DSI adapted command mode

APB interface for control register R/W access，DMA read使用AXI master read port。


图 1-1 Display Controller Block图

### RESET补充描述

除了DBI-B，其他其他interface的标准signal中是不含有reset信号的。但是无论是连接MIPI DSI 还是连接SPIC的LCD Panel，均单独单独含有Reset input signal，以方便初始化LCD panel。因此选择从Display Controller handler的位置引出Reset output signal连接至LCD Panel，并且通过寄存器由用户直接控制。

### TE补充描述

支持DBI-B和SPIC interface 的LCD panel均有TE信号直接返回，因此直接将LCD 中的TE连接至Display Controller中的TE引脚即可。

支持MIPI DSI interface的LCD panel通常含有两种TE返回方式，一种是直接通过LCD中的TE引脚来返回tear message（高低电平）。另一种是通过data lane0来返回tear message，然后在DSI中产生TE，进而连接至Display Controller；询问Display Driver厂商后得知，通常这两种方式均支持且同时运行。硬件设计中会通过Tear_Input_Mux来选择使用哪种方式返回的tear signal。

### APB 补充描述

上述block图中的APB bus并不是真正的APB bus，而是将系统的APB bus经过Asynchronous brdige之后的bus。经过asynchronous bridge之后，bus clock和display clock被合并，因此对于display controller而言，APB bus clock和display clock是同一个时钟信号，通常为200MHz，用于display controller内部的分频的clock source和register access clock。

## 数据流向-Tx（auto）

在auto Tx mode下，Pixel数据流向通常为data RAMDMAhandler FIFOPixel converter（DPI interface下需要过line buffer）各个interface。在DBI-B、SPIC、DPI interface后直接连接display panel。而eDPI interface后经过DW DSI Host controller、D-PHY后再连接至display panel。


图 1-2 Display Controller Tx 数据流向

## 数据流向-Rx（auto）

当使用DBI-B auto Rx mode时，Received data数据流向通常为DBI-B interface handler FIFOCPU通过APB读取handler FIFO。


图 1-3 Display Controller DBI-B Rx 数据流向

当使用SPIC user mode Rx时，Received data直接存储在SPIC interface 的Rx FIFO中，而不会返回handler FIFO。user需要将AXI mux切换为FW mode，通过APB interface直接读取SPIC Rx FIFO中的值。

当使用eDPI Rx时，Received data直接存储在DW DSI Host Controller的Generic FIFO中，不会返回handler中的FIFO。user可以直接通过APB interface读取DW DSI Host Controller FIFO中的数据。



## Feature List

Display Controller 包含如下Feature

支持DMA one channel

支持AXI master DMA read pixel data，single block、muti-block中的contiguous、auto_reload和link list。

支持DMA infinite mode（连续搬运），multi-block link list下使用infinite mode时支持每一帧修改source address

支持link list module根据offset值和source address等自动生成link list

支持RGB pixel format convert

支持Tear effect signal

支持 DBI Type B interface(max 50MHz)

支持mannual mode和auto mode

支持Tx和Rx

支持SPIC interface(max 100MHz)

支持HW mode Tx

支持FW mode Tx和Rx

支持DBI-C option 3、QSPI（114/144）、OPI（188/118）

Tx下支持QSPI和OPI下的DDR

Tx下支持spiclk后续加PHY来调整相位和偏移

支持DPI interace

内部配置line buffer

支持video mode type4架构

支持SD和CM

支持MIPI DSI(max 65MHz,D-PHY为1GHz per lane)

支持data lane number为1或2

支持video mode或adapted command mode

支持HS和LP

video mode下支持type4架构

# interface select

## interface select与内部PIN MUX

目前Display Controller总共支持四种interface的输出，DBI-B、SPIC、DPI和MIPI DSI，如果将各个interface全部引出，则需要大量的PIN脚，会对IC封装造成很大的难度，因此此次选择内部PIN MUX方案来对以上四种interface的signal做处理。

由于MIPI信号为差分信号，信号电平比较复杂且速度较快，因此选择直接从IC中拉专线至IC PAD。所使用的singal为：

表 2-1 Display Controller MIPI Signals

DBI-B、SPIC和DPI的所有signal共同share 30个Display Controller signal，在interface select register确定时，Display Controller对外的30根signal上的功能就已经确定下来。具体对应关系如下表所示：

表 2-2 Display Controller Pinmux Signals

注：需要注意的是在DPI interface下，由于LCD_RESX所在的位置被SD占用，导致无法reset LCD 屏幕，因此需要额外配置GPIO来连接至Panel 的reset signal。

## Interface Select与clock

handler寄存器中的Interface_select可以选择当前运行在哪种interface下，此register除了可以确定上述内部pinmux外，还可以确定各个interface下clock的供应。

例如，只有当Interface select选中SPIC时，handler才会向SPIC IP提供clock；当选中为eDPI或DPI interface时，才可以在dpiclk上产生时钟；当选中为DBI-B interface时，才可以在WRX和RDX上产生时钟。

## interface select与register access

因为SPIC通过AXI BUS与handler连接，只有当SPIC clock提供时，才可以通过AXI MUX FW MODE access SPIC register。意即只有interface select选中SPIC interface时，且AXI MUX切换为FW mode时，才可以access SPIC register；

其余非SPIC register，则直接与APB连接，不需要对应interface的clock也能正常通过APB来访问register，因此access register与interface select无关。

# Pixel Converter

## 8bits/16bits Swap

与I8080原设计一致，对DMA read的data做8/16bits swap。按 register setting 对输入的32bits data做8bit/16bits swap或bypass，处理完成后输出32bit data到下一级电路。需support 3种格式的swap或者bypass，如下图。


图 3-1 8bits & 16bits swap


图 3-2 16bits swap


图 3-3 8bits swap

## bit swap的作用

输入format确定了每个Pixel中RGB各个bit的排列方式，但是在宽度32bit的FIFO中，每个地址空间可以存储不只一个Pixel，Pixel之间的排列方式可能存在差异。这里通过bit swap将Pixel的之间的顺序均调整为如下方式：（系统默认为Little Endian，LSB放在小地址，MSB放在大地址）

AGRB8888:


图 3-4 ARGB888 存储方式

BGR565:

如果输入的pixel format是BGR565，但是Pixel之间的排列并非如下所示，则应该通过bit swap功能来调整Pixel之间的排列顺序，使其按如下图所示的顺序排列。


图 3-5 BGR565 存储方式

RGB565:

如果输入的pixel format是RGB565，但是Pixel之间的排列并非如下所示，则应该通过bit swap功能来调整Pixel之间的排列顺序，使其按如下图所示的顺序排列。


图 3-6 RGB565 存储方式

RGB888 Stream:

如果输入的pixel format是RGB888，但是Pixel之间的排列并非如下所示，则应该通过bit swap功能来调整Pixel之间的排列顺序，使其按如下图所示的顺序排列。


图 3-7 RGB888 Stream 存储方式

## RGB converter

按register setting做RGB format转换，输入和输出的RGB format 由register设定。Support 5种RGB Format输入，ARGB8888、BGR565、RGB565、RGB888 stream和ABGR8888。4种RGB Format输出， RGB888、RGB565、BGR888、BGR565。Output format 与Input format 一致则bypass。

如果输入的RGB data format为16bit，按16bits 分成2个Pixel。然后按顺序做RGB format转换，先转换Pixel n，再转换Pixel n+1。

主要步骤：

①	将bit swap之后的FIFO数据按照input Pixel format拆分为每个Pixel的数据

②	将input pixel format的数据修改为output pixel format的数据。

③	将output pixel format中的R、G、B值按照color mapping的方式送给dpidata的信号线上（eDPI ）。

### input format

[Input_RGB_Format] 举例说明


图 3-8 32bits ARGB8888 input Format


图 -9 32bits RGB565 define(2 pixels) input format


图 3-10 32bits BGR565 define(2 pixels) input format

RGB888 stream按如下方式处理，以启动后FIFO收到的第一笔32bit data为起始。按3 bytes做解析，每3个byte组合成一个RGB888 pixel。输入的data数量必须是3*32bits的整数倍。

图 3-11 RGB888 Stream define(4 pixels) input format（332bits）

### output format

[Output_RGB_Format]举例说明


图 3-12 RGB565 output(2 bytes)


图 3-13 RGB888 output(3 bytes)

支援的转换的RGB Format如表 3-1 RGB Format 转换

；

表 3-1 RGB Format 转换

注：每个像素值从8bit减为5/6bit时，直接截断低bit；从5/6bit增加为8bit时，直接在低位补0。暂定不使用Dithering的技术。RGB565 或BGR565 转RGB888，如图 3-14在RGB低位补0。


图 3-14 RGB565 convert to RGB888

### Color Map（eDPI）

在eDPI interface下，由于与DW DSI Host Controller连接时，DW DSI的data width为30bit，大于pixel data的宽度，那就涉及到需要将pixel data置于DW DSI Host Controller的哪几个bit上去。可以通过寄存器COLOR_MAP来控制，目前可以用到16bit的三种Configuration和24bit。Color Map如下所示。


# Tear effect

在刷新屏幕过程中，出现在屏幕的某一帧，新旧画面各显示一部分且不变化的现象，称之为撕裂（tear effect）。tear effect的根本原因是对GRAM的读、写速度不一致，导致在一帧之内，GRAM的读指针（R）与写指针(W)发生了重叠导致。

而tear output信号是屏幕厂商为了防止出现tear effect，返回给Controller的同步于GRAM内部读指针的信号。

## tear output的三种mode

tear output通常包含三种mode，分别为①V-Blanking information only；②V-Blanking and H-Blanking information；③Rearching line N；下面将详细解释这三种mode。

V-Blanking（Display Controller支持这种）

根据上面的字面意思，V-Blanking only意为返回的Tear ouput与Vertical Blanking的时间相吻合。而V-Blanking实际上包含了Vsync、VBP和VFP的总和。

按照下图（来自SH8601Z0 datasheet）的描述，TE信号拉起的时间为上一帧VFP生效的时间点，TE信号拉下来的时间为下一帧VBP的结束点，涵盖了整个V-Blanking Period。

（注意，下图中的VSYNC为高电平有效，HSYNC为低电平有效，因为每一帧开始HSYNC和VSYNC生效的时间点是一致的）



图 4-1 tear effect output of V-Blanking

V-Blanking and H-Blanking

参考上面的分析结果，H-blanking则说明TE会在每一个active area line的H-Blanking的Period内变为有效。包含了上一个line结束时的HFP，下一个line开始时的HSYNC和HBP period。

然后将整个Frame中的V-blanking和H-Blanking Period都体现在TE上。



图 4-2 tear output of V-Blanking and H-Blanking

Rearching line N

参考下图的描述，实际上TE中只反映第N行的H-Blanking Period，即N-1行的HFP，N行的HSYNC和HBP。


图 4-3 tear output of rearching line N

## tear output接收到后host的行为

tear output被host接收到之后的行为方式可以分为两种情况，第一种host更新GRAM的速度比panel read GRAM进行自刷新的速度快；第二中host更新GRAM的速度比panel read GRAM进行自刷新的速度慢。在这两种情况下，host需要做不同的动作，来保证不会出现tear effect（在自刷新的过程中，在一帧时间内，固定出现上一帧和下一帧各占一部分屏幕且没有变化的情况）。

tear effect的根本原因是对GRAM的读、写速度不一致，导致在一帧之内，GRAM的读指针®与写指针(W)发生了重叠导致。

详情参考CSDN文档：

https://blog.csdn.net/hexiaolong2009/article/details/79319512

### host比panel快

当host的速度比panel的速度快时，即使二者从相同的位置开始读写，最新一帧的数据A也能在panel的当前帧完整反应出来（写比读快），而不必等到下一帧。所以，将写的时间点再提前一点，从TE的上升沿之后就开始写也没问题，只是写GRAM的完成时间点提前了而已（下图中就是这么做的）。

而因为通常host都是通过TE来控制写入的，不会出现host过快而导致tear effect的情况（即上一帧还没读完，下一帧已经写完了，即W:R>2的情况出现）


图 4-4 Host action when host is faster than LCD self-refreshing

注：上述从TE的上升沿到host开始写的时间间隔可以认为是传输延迟，或者是等写指针复位的时间，可以通过register来控制长度。

结论：

因此针对host write GRAM的速度比LCD panel自刷新read GRAM速度快时，在tear的上升沿开始host写入数据（tear高电平有效）

### host比panel慢

当host的速度比panel慢时，即使读写同时开始，写入最新一帧的数据A也不能在panel的当前帧反应出来（读比写快），只有在下一帧才有可能体现出来。

如果W：R>1:2，则在panel自刷新第二帧结束前，写过程能结束，则panel中刷新的数据均为A；如果W：R<1:2，则在panel自刷新第二针结束前，写过程无法结束，则panel中刷新的数据有一部分为A，有一部分仍然保持为A-1，则肯定会发生tear effect。所以即使host比panel速度慢，最慢也不能低于1/2。

当1>W：R>1:2时，满足不会发生tear effect的必要条件。然后再看读写的起始时间。如果写比读更早，则刚开始读的时候，读出的是A，而之后读出的是A-1，也会发生tear effect。所以此时写必须必读更晚才可以。（如下图所示）


图 4-5 Host action when host is slower than LCD self-refreshing

结论：

因此针对host write GRAM的速度比LCD panel自刷新read GRAM速度慢时，在tear的下降沿之后开始host写入数据（tear高电平有效），且必须在第二帧结束前写完才能保证不发生tear。

### 结论

当W比R快，且W以TE作为基准，则W开始时间点≤R开始时间点

当W比R慢，此时必须满足W：R>1:2，且W开始时间点≥R开始时间点，但是W必须在下一帧R完成前结束。（为了保险起见，不要在等于的情况下执行，其为临界条件）

为了能同时支持以上两种情况，在handler中设置一个寄存器，以此来确定TE上升沿到来时经过多长时间Host才可以发送data给panel，即T2W_DELAY和Bypass_T2W_DELAY。

## Tear运行机制的补充描述

硬件会时刻监控来自LCD pannel或DW DSI 的tear信号，若tear有效边沿来临，则触发Tear_trigger_int。

### tear signal下自动刷屏

若tear_auto_turn_on_autowritestart为1，则tear有效边沿来临时自动启动auto_write_start；

在tear_auto_turn_on_autowritestart为1的前提下，若tear_auto_turn_on_dma_En为1，则tear有效边沿来临时自动启动Dma_enable。即二者同时置1时，则每当tear有效edge来临时触发自动刷屏。

只有command mode下才存在tear信号，因此tear的自动刷屏只有才command mode下才能生效。Tear自动刷屏和Infinite_Mode_En本质上都是自动刷屏，只是触发方式不同，二者不能同时运行。

利用Tear自动刷屏的流程如下（此时tear_auto_turn_on_dma_En默认为1）：

【FW】判断当前dma_enable和auto_write_start已经归零

【FW】第一帧需要user手动启动dma_channelen和dma_enable开始DMA搬运数据至handler FIFO

【FW】启动tear_auto_turn_on_autowritestart、auto_write_start（非必须，除非想手动启动第一帧）

等待LCD pannel返回的tear信号触发auto_write_start，从handler FIFO向pannel发送数据

【HW】一帧搬运结束后，dma_enable、auto_write_start由Display Controller回零，dma_channel enable由RTK DMA自动归零（multi-block下channel enable不回零）

【HW】判断dma_enable、auto_write_start，dma_channel enable（multi-block下不用考虑这一条）是否全部归零，表示一个frame完全结束

【HW】检查user是否disable tear_auto_turn_on_autowritestart，如果是，则LOOP结束，如果不是，则继续（并clear TX-CNT）

【HW】直至再次（3T）sample到来自pannel的次有效tear（第二帧之后，只支持tear触发，而不支持auto_write_start触发）

【HW】直接启动dma_enable、dma_channel enable，开始T2W delay cnt

【HW】做完T2W delay cnt ,启动auto_write_start

【HW】第二帧开始传输。

【FW】直到user disable tear_auto_turn_on_autowritestart。loop结束。


【注意】

tear_auto_turn_on_autowritestart开启后，第一个frame可以由tear signal触发，也可以由user 通过auto_write_start启动，后续frame只能由tear触发，而不收user控制。除非disable tear_auto_turn_on_autowritestart。

tear_auto_turn_on_autowritestart和tear_auto_turn_on_dma_En同时开启的情况下，第一帧的dma_enable也必须字tear来临之前手动启动。后续帧的可以自动启动。

由于未设置shadow register，在单个frame刷屏时间内或tear触发未结束时，不要修改相关的register。

### tear signal下手动刷屏

HW会时刻监控tear signal，而不论tear_auto_turn_on_autowritestart是否打开。

tear有效边沿来临时，会触发Tear_trigger_int。

如果使用tear下每一帧手动刷屏，则需要关闭tear_auto_turn_on_autowritestart，然后在每次触发Tear_trigger_int时，通过CPU响应中断来手动触发auto_write-start、dma_enable和channel enable即可。

# Infinite Mode

Infinite mode用于实现连续刷屏。当每一帧刷屏结束，auto_write_start和dma_enable自动归零之后，如果侦测到Infinite mode处于enable的状态，则重新开启下一帧刷屏。由于Infinite mode和tear触发本质上都是自动刷屏，区别在于tear触发是通过来自DW DSI或LCD Panel的tear有效边沿来触发下一个frame的刷新，而Infinite mode则是user控制Display Controller自动在上一帧结束后，开启下一帧的刷屏。因此二者处于互斥状态，同一时间只能有一个有效。

Infinite mode下的刷屏流程如下所示：

【FW】判断当前dma_enable和auto_write_start已经归零

【FW】enable infinite mode

【FW】第一帧需要user启动dma_chanen、dma_enable、auto_write_start

【HW】auto_write_start启动之后开始第一帧刷屏，直至结束后，dma_enable和auto_write_start自动归零

【HW】判断dma_enable、auto_write_start，dma_channel enable（multi-block下不用考虑channel enable，因为在中间帧不会归零）(在SPIC中需要再检查SSIENR)是否全部归零，表示一个frame完全结束（HW Double check）

【HW】检查user是否disable Infinite Mode，如果是，则LOOP结束，如果不是，则继续（并clear TX-CNT）

【HW】开始couter计数Infinite_F2F_stop2DMAen_Delay 12bit

【HW】启动dma_enable、dma_channel enable（由DMAC多引出来的signal启动）

【HW】开始couter计数Infinite_F2F_DMAen2Wen_Delay 12bit

【HW】启动auto_write_start

【HW】第二帧开始刷新，从第4步开始循环

【FW】直到disable Infinite Mode（即第6步结束）

通常在infinite mode被disable之后，为了硬件上保险起见，会多打一个frame出去。


【注意】infinite mode下第一个frame的启动需要user通过channelenable、dma_enable和auto_write_start来启动，后续frame则由硬件自动启动，不受user控制，除非disable infinite mode。

由于未设置shadow register，在单个frame刷屏时间内或Infinite mode未结束时，不要修改相关的register。


注意：在infinite mode下，如果采用了multi-block，则分为以下三种情况：

source contiguous and destination auto-reloaded：中间帧每一帧结束后，channel enable不会归零，则multi-block的source address无法重置，会按照上一帧结束时的source address增加increment来执行；

source auto-reload and destination auto-reload：中间帧每一帧结束后，channel enable不会自动归零，但是因为上一帧的最后一个block完整结束，按照auto-reload的方式，下一帧的第一个block仍然会执行最开始的source address。

source and destination linklist：中间每一帧结束后，channel enable不会自动归零。下一帧中group1和group2的source address会以GRP1_SAR_FOR_INFINITE_MODE和GRP2_SAR_FOR_INFINITE_MODE为准。每一帧开始是载入一次这两个register，作为下一帧的source address。

# handler中断interrupt

## Display_controller_waveform_finish_int

当处在不同的interface下时，如果认为连接屏幕的所有interface的waveform均已打完，触发此interrupt。

在不同interface认为waveform结束的判断条件如下：

eDPI（D-PHY）interface

在Type4架构下，不在刷4帧黑屏、不在刷12帧黑屏、不在Tx-len的正常发送过程，且MIPI DPHY的data lane0处于stop state或ULPS的时间超过D-PHY Stop_state_timeout时触发interrupt

在非Type4架构下，不在Tx-len的正常发送过程，且MIPI DPHY的data lane0处于stop state或ULPS的时间超过D-PHY Stop_state_timeout时触发interrupt

DBI-B interface

片选信号CS从低电平转换为高电平时触发interrupt；

SPIC interface

片选信号CS从低电平转换为高电平时触发interrupt；

RAMLESS QSPI interface

最后一帧frame运行结束，且CS从低电平转换为高电平时触发

DPI interface

在Type4架构下，不在刷4帧黑屏、不在刷12帧黑屏且不在Tx-len的正常发送过程时，触发interrupt

在非Type4架构下，不在Tx-len的正常发送过程时触发interrupt

注意：在infinite mode下，只有最后一个正常刷新的Frame结束时才需要判定如上条件，以确定是否要触发此interrupt，中间的frame不会触发。

### 切换interface

需要等Display_controller_waveform_finish_int trigger之后，表明当前waveform已经完全结束，此时才可以切换interface。直到interface成功切换之前，不要进行任何可能会产生waveform的操作，如启动auto_write_start、启动或关闭shutdn等；

## Tear_trigger_int

硬件会时刻监控tear信号时，如果tear信号产生了寄存器设置的有效边沿（rising edge/falling edge），则触发此interrupt。

触发interrupt之后，若tear_auto_turn_on_autowritestart为1，则硬件会自动在一定时间的delay之后，启动auto_write_start；若tear_auto_turn_on_dma_En为1，则硬件会自动启动Dma_enable以搬运数据。

触发interrupt之后，若tear_auto_turn_on_autowritestart不为1，则user可以选择是否响应中断，手动启动刷新过程。

## TX_auto_done_int

在video mode下，TX-LEN通常会设置为一个frame中有效数据的大小，TX_auto_done_int的触发时间为total frame刷新完毕时触发，即包含了active area、sync active are、back porch和front porch。

在其他mode下，TX_auto_done_int的触发时间为TX_output_pixel_cnt不断增长，且满足TX_output_pixel_cnt>=TX_output_pixel_num时触发。

# DMA module

DMA Module采用RTK_DMAC，是一种面向OCP/AXI interface的DMA控制器。

RTK DMAC中DMA FIFO的宽度为32bit，深度为16，则FIFO Size为64Byte

Display Controller中Handler FIFO的宽度为32bit，深度为128，则FIFO Size为512Byte（因为需要吃SPI 256Byte的burst）

此次由Display Controller来做流控，而非RTK DMAC来做流控。

## RTK DMAC Configuration


图 7-1 DMA 初始默认设置

Number of master interfaces 	：DMAC_NUM_MASTER_INT =1

Number of DMA channels		：DMAC_NUM_CHANNELS=1，因此只有channel0有效

### Channel 0相关的寄存器

表 7-1 DMA channel0 register

SSTAT与DSTAT解释


图 7-2 DMA channel0 SSTAT&DSTAT

SSTATAR与DSTATAR解释



图 7-3 DMA channel0 SSTATAR&DSTATAR

SGR和DSR解释


图 7-4 DMA channel0 SGR&DSR

不支持gather和scatter。因此SGR0和DSR0不用关心。

主要关心的寄存器为SAR0、DAR0、LLP0、CTL0、CFG0这五个寄存器。

### CTL0寄存器详解

表 7-2 DMA Channel0 CTR0 Register Configuration

注：

根据DV验证的结果，当SINC设定为no_change的时候，MSIZE必须设定为≤16，否则这种transcation会违反AXI SPEC的描述，无法确保bus间传输的正确性

（这是因为目前使用的是AXI4的标准，increment最大的MSIZE为256，而fixed最大的MSIZE为16；AXI3标准中increment和fixed最大的MSIZE均为16；RTK DMAC中的设定的fixed和increment的最大size为32。）

SRC_TR_WIDTH与DST_TR_WIDTH：

要求DMA source address必须以SRC_TR_WIDTH对齐，否则会产生DMA搬运错误。

SRC_MSIZE与DEST_MSIZE

DEST_MSIZE则必须小于等于SRC_MSIZE，否则就有可能产生按照SRC_MSIZE burst搬运至DMA FIFO中的数据无法凑齐一个DEST_MSIZE burst，进而全部用single去发送，从而严重拖慢DMA的传输速率。

peripheral作为flow controller的时候，通过DMA 发送的handshake信号，请求的single 或burst都指的是DMAC source端的single或burst。

### CFG0寄存器详解

表 7-3 DMA Channel0 CFG0 Register Configuration

### Interrupt相关的寄存器

CTL寄存器的bit0用于enable和disable DAMC的interrupt。若需要使用interrupt，则必须先将此bit打开。

IntTfr-DMA Transfer Complete Interrupt

IntBlock-Block Transfer Complete Interrupt

IntSrcTran-source Transaction Complete Interrupt(当前的DMA中不存在此interrupt)

IntDstTran-Destination Transaction Complete Interrupt（当前的DMA中不存在此interrupt）

IntErr-Error Interrupt（error response from OCP）（此bus传输错误通常难以手动触发）




图 7-5 DMA channel0 Interrupt 相关

### DMA Miscellaneous 寄存器


图 7-6 DMA Miscellaneous 相关

DmaCfgReg：enable or disable RTK DMAC

（这个寄存器实质上被Display Controller handler中的0X18的Dma_enable所取代。）


图 7-7 DMA DmaCfgReg 相关


ChEnReg：enable or disable channel0；enable or disable channel 0 write。

（注意：在channel enable的时候，CH_EN和CH_EN_WE必须在一次write register时同时操作，而不能分开两次write 操作，否则无效）


图 7-8 DMA ChEnReg 相关

DmaIdReg：可以读回DMAC的DMAC_ID_NUM，即release data，不需要设置

DmaOsNum：表示RTK_DMAC Outstanding Number Register，这个是AXI4中的特性，表示可以连续发出多少个未完成（outstanding）的命令，不需要设置。

后续的Parameter只读寄存器，这些parameter寄存器均为只读寄存器，里面含有的数值大多为DMAC IP在configuration阶段所确定的parameter，只能看不能改，在Driver中不一定会开放出来给用户。


图 7-9 DMA Configuration Parameter 相关

## initial flow（配置寄存器）

initial指的是在运行开始之前，需要在寄存器中配置的参数，决定了IP运行的初始状态。

### 关于DMA传输方向的解释

wiki上设置的TT_FC为100，即


图 7-10 DMA CTRL0 TT_FC 相关

但是根据Display Controller架构的理解，DMA明明是将数据从GPU后续的data RAM中搬运至Display Controller的FIFO中，且Display Controller为作为流控。因此看起来应该选择110。但是实际上，RDC将此处定死，必须选定为100。

即RDC的同仁修改了DAMC，让handshake和flow controller的设置中，source和destination的方向设置是相反的。即从DMAC外部来看，实际上是将pixel data从RAM搬运到Display Controller中，source为RAM（memory），而destination为Display Controller FIFO（peripheral），且DMA handshake信号挂在destination端。但是从DMAC内部的DMA handshake而言，它认Display Controller为source，而RAM为destination，handshake signal挂在Display Controller上（source），所以在后续CFG中TT_FC中设置为了100，而handshake也是设置在source端，而非destination端。（address和multi-link等设置仍然和正常的一样）

所以可以理解为DMAC中的DMA handshake的方向定义和AXI传输data的方向定义是相反的。正因如此，每次display controller作为flow controller，发起single request或burst request时，此次传输的数据量大小是由source transfer width和source msize确定的，而非destination transfer width和destination msize确定。

### Single Block Initial Flow

设置寄存器SAR0，配置DMA搬运的源地址

设置寄存器DSR0，配置DMA搬运的目的地址（固定地址为handler中的FIFO）

设置寄存器CTL0：

bit[28:27] 设置LLP_SRC_EN和LLP_DST_EN为disable，关闭source和destination的link list module；

bit[22:20] TT_FC设置tranfer type and flow control为peripherla to memory and peripheral acts as flow controller。（100，硬件中定死的）

bit[16:14] SRC_MSIZE设置单个block内source burst Transaction length（表示每个burst含多少个transfer

bit[13:11]DEST_MSIZE设置单个block内destination burst Transaction length（表示每个burst含多少个transfer）

bit[10:9]SINC设置为Increment或No change

bit[8:7]DINC设置为No change（硬件定死的，Destination为FIFO）

bit[6:4]SRC_TR_WIDTH设置source端的transfer width

bit[3:1]DST_TR_WIDTH设置destination端的transfer width（硬件定死的，Destination width固定为32bit）

设置寄存器CFG0：

bit[35] PROTCT设置为0，即secure，否则DMAC的请求会被bus屏蔽掉

bit[33] FIFO_MODE设置为1，设置为DMAC FIFO 中积攒或空闲的data大达到FIFO depth的一半后，再发起AXI request。避免过于频繁地请求AXI bus。

bit[32] FCMODE设置为1，表示当destination作为flow controller的时候，不允许预取（pre-fetch）数据。

bit[31] RELOAD_DST设置为0

bit[30] RELOAD_SRC设置为0

bit[19] SRC_HS_POL设置为0，即handshake为高电平有效（硬件中定死了）

bit[11] HS_SEL_SRC设置为0，即source端的handshake设置为hardware handshake（硬件中定死了）

bit[8] CH_SUSP设置为0，disable suspend功能

设置DMA中断寄存器

设置寄存器CLEAR_TFR，清除相应channel0的传输完成中断

设置寄存器CLEAR_BLOCK，清除相应通道的block中断

设置寄存器CLEAR_DST_TRAN，清除相应通道的目的地址端传输完成中断

设置寄存器CLEAR_SRC_TRAN，清除相应通道的源地址端传输完成中断

设置寄存器CLEAR_ERR，清除相应通道的传输错误中断

设置寄存器MASK_TFR，是否屏蔽相应通道的传输完成中断（只有对应channel的INT_MASK_WE field asserted时才可以写INT_MASK field。）

设置寄存器MASK_BLOCK，是否屏蔽相应通道的block中断

设置寄存器MASK_DST_TRAN，是否屏蔽相应通道的目的地址端传输完成中断

设置寄存器MASK_SRC_TRAN，是否屏蔽相应通道的源地址端传输完成中断

设置寄存器MASK_ERR，是否屏蔽相应通道的传输错误中断

设置寄存器DmaCfgReg[0]，enable RTC DMAC

设置寄存器ChEnReg[8,0]，enable channel 0 write enable0和enable channel 0

### Multi-Block Initial Flow

Multi-Block指的是一次性传输多个Block，理论上在source和destination端均支持Linked lists(block chaining)、Auto-reloading和Contiguous blocks。

但是由于在Display Controller的架构中，destination为handler中的FIFO，地址为固定，因此在multi-block时设置为auto-reloading是最方便的（Contiguous会导致source应用受限；而linklist会引入额外module的寄存器设置）。而source端在multi-block中可以设置为Linked lists(block chaining)、Auto-reloading和Contiguous blocks。目前根据不同的source端，支持以下几种multi-block类型。

#### Multi-Block with Auto-Reloaded Address for Source and Destination

参考single block的寄存器设置，以下为需要特殊设置的（未提到的保持原样）

设置寄存器CFG0：

bit[31] RELOAD_DST设置为1

bit[30] RELOAD_SRC设置为1

设置寄存器DMA_FIFO_IMR[30]，打开waveform finish interrupt。

设置寄存器DMA_Multi-Block_Ctrl[0]，打开DMA multi block的传输

设置寄存器DMA_Multi-Block_Ctrl[8]，确定不是linklist类型的multi-block

设置寄存器DMA_Multi-Block_Size1，确定multi block下每个block的size

设置寄存器DMA_Multi-Block_Ctrl[31]，clear load cnt

设置寄存器DmaCfgReg[0]，enable RTC DMAC

设置寄存器ChEnReg[8,0]，enable channel 0 write enable0和enable channel 0

此时DMA开启multi-block传输

multi-block（单帧、tear连续刷屏、infinite mode连续刷屏）结束后，触发waveform finish interrupt。此时dma_enable和Auto_write_start均已自动归零，但ChEnReg[0]并不会自动归零。

发起suspend-cancel流程：

将CFG0[8]置为1来suspend all DMA data transfer from source

polling CFG0[0]直到其变为1，说明DMA已经处于inactive阶段

设置寄存器ChEnReg[8,0]，手动disable channel 0


图 7-11 DMA Suspend-Cancel流程

DMA传输如下图：


图 7-12 Auto-Reloaded Address for Source and Destination

#### Multi-Block with Contiguous Source Address and Auto-Reloaded Destination Address

参考single block的寄存器设置，以下为需要特殊设置的（未提到的保持原样）

设置寄存器CFG0：

bit[31] RELOAD_DST设置为1

bit[30] RELOAD_SRC设置为0

设置寄存器DMA_FIFO_IMR[30]，打开waveform finish interrupt。

设置寄存器DMA_Multi-Block_Ctrl[0]，打开DMA multi block的传输

设置寄存器DMA_Multi-Block_Ctrl[8]，确定不是linklist类型的multi-block

设置寄存器DMA_Multi-Block_Size1，确定multi block下每个block的size

设置寄存器DMA_Multi-Block_Ctrl[31]，clear load cnt

设置寄存器DmaCfgReg[0]，enable RTC DMAC

设置寄存器ChEnReg[8,0]，enable channel 0 write enable0和enable channel 0

此时DMA开启multi-block传输

multi-block（单帧、tear连续刷屏、infinite mode连续刷屏）结束后，触发waveform finish interrupt。此时dma_enable和Auto_write_start均已自动归零，但ChEnReg[0]并不会自动归零。

发起suspend-cancel流程，手动停止channel0。

DMA传输如下图：


图 7-13 Contiguous Source Address and Auto-Reloaded Destination Address

#### Multi-Block with Linked List Source Address and Destination Address

参考single block的寄存器设置

设置DMA寄存器设置寄存器CTL0：

bit[28]LLP_SRC_EN设置source端在multi-block下开启Link list

bit[27]LLP_DST_EN设置destination端在multi-block下开启Link list

设置寄存器LLP0：其中低32bit的地址设置为link list module中GRP1_SAR_DMA的地址

DMA Link list module寄存器设置

设置DMA_CFG[31:30]，取消DMA link list module的写保护

设置寄存器GRP1_SAR，确定link list中第一个block中source的起始地址

设置寄存器GRP1_DAR，确定link list中第一个block中destination的起始地址(handler中FIFO的地址)

设置寄存器GRP1_LLP，如果只用1个group，则指向GRP1_SAR_DMA；若使用两个group，则指向GRP2_SAR_DMA。

设置GRP1_CTL0，参考single block中的DMA CTL0低32bit的设置，

LLP_SRC_EN为1，打开source端的Link list

LLP_DST_EN为1，打开destination端的link list

bit[16:14] SRC_MSIZE设置单个block内source burst Transaction length（表示每个burst含多少个transfer

bit[13:11]DEST_MSIZE设置单个block内destination burst Transaction length（表示每个burst含多少个transfer）

bit[10:9]SINC设置为Increment或No change

bit[10:9]DINC设置为No change（硬件定死的，Destination为FIFO）

bit[6:4]SRC_TR_WIDTH设置source端的transfer width

bit[3:1]DST_TR_WIDTH设置destination端的transfer width（硬件定死的，Destination width固定为32bit）

设置GRP1_SAR_OFFSET，确定下一次block为Group1时，SAR的地址偏移量

设置GRP1_DAR_OFFSET为0；


设置GRP2_SAR，确定link list中第二个block中source的起始地址（用到两个group时）

设置寄存器GRP2_DAR，确定link list中第二个block中destination的起始地址(handler中FIFO的地址)

设置GRP2_LLP，指向GRP1_SAR_DMA

设置GRP2_CTL0，与Destination部分和group1中的设置一致，source部分可以不一致。

设置GRP2_SAR_OFFSET，确定下一次block为Group2时，SAR的地址偏移量

设置GRP2_DAR_OFFSET为0；

设置寄存器DMA_CFG[31:30]，打开DMA link list module的写保护。

设置寄存器DMA_Multi-Block_Ctrl[0]，打开DMA multi block的传输

设置寄存器DMA_Multi-Block_Ctrl[8]，确定是linklist类型的multi-block

设置寄存器DMA_Multi-Block_Size1和DMA_Multi-Block_Size2，确定multi block下每个block的size

设置寄存器DMA_Multi-Block_Ctrl[31]，clear load cnt

设置寄存器DmaCfgReg[0]，enable RTC DMAC

设置寄存器ChEnReg[8,0]，enable channel 0 write enable0和enable channel 0

此时DMA开启multi-block传输

（硬件会在倒数第二个block结束后修改Link list中的LLP enable，让它变为disable，并在最后一个block时载入进去，这样最后一个block结束后就会自动停下来了。）

multi-block结束后，监控寄存器ChEnReg[0]，channel0停止。

DMA传输如下图：


图 7-14 Linked Address for Source and Destination

## Flow Controller for RTK DMAC

在此次架构中，RTK DMAC不做flow controller，因此必须在Display Controller内部自行来做flow control。本章节将简要叙述Display Controller内部的flow controller运行机制。

RTK DMAC的handshake signal如下所示，其余为AXI interface的bus signal和interrupt signal，这里不予展示。


图 7-15 DMA hardware handshake signals

运行流程如下：

user 通过register设定TX_LEN和dma_fifo_threshold。

user通过register设定RTK DMAC的Transfer Width和MSIZE（burst length）。硬件会自动clone一份source MSIZE和source transfer width。

user 启动dma_enable

硬件检查当前handler FIFO中的数据量是否小于等于threshold，若成立则发起dma_req，来请求一个burst transmit，burst的大小由MSIZE决定（这里请求的burst size是按照source来计算的，而非destination）。

（注意：①为了保证FIFO 不会产生overflow，需要user自行确保MSIZE+threshold≤handler FIFO length；②为了保证程序正常运行，threshold设置应该大于0）

burst 传输结束时，TX_CNT增加一个MSIZE的大小（需要做单位换算）

重复上述burst传输过程，直至剩余的data数量不足一个burst

剩余的data均以dma_single的形式来发起single request。

注意：在发送single request的时候就不会再观察handler FIFO中的数据量是小于等于threshold了，只要handler FIFO中有空位置（即会判断FIFO 是否为full，并不会造成overflow），就会发出single request。（这里请求的single request也是按照source来计算的）

在最后一个transfer时asserte dma_last（最后一个tansfer可能是burst或single）

TX_LEN传输结束时，assert dma_last信号，此时Display Controller中的dma_enable自动回零。

注意：在刷新一个window的时候，如果设定为只搬运一个window大小的data，则尽量让window的面积为32的倍数，这样可以确保搬运时均以burst的形式搬运，可以保证DMA搬运的速率足够。

经过DV验证，当burst跨4K时，4K左边的完整burst和4K右边的完整burst均可以正常以完整的burst形式发送，burst size等于MSIZE。只是跨在4K上的burst会被分成两部分，且两部分均以burst的形式发送，只是burst的size小于MSIZE而已。

# DMA link list module

如果上述DMAC中在multi-block中开启了link list，则需要在如下的link list register中设置相应的link list，而且需要将DMAC中的LLP指向第一个link list中存储SAR（accessed by DMA）的地址。

DMA会先将link list中的register（accessed by DMA）read back，然后根据内部关于source和destination中multi-block的设置，对应的更新相关channel中source和destination 的相关设置。


图 8-1 DMA link list module flow

## Register

如下register.用于存放Group1的link list。


图 8-2 DMA link list module group1

如下register.用于存放Group2的link list。


图 8-3 DMA link list module group2

如下为control register


图 8-4 DMA link list module control register

如下为DMA group1和group2 offset增量的设置寄存器


图 8-5 DMA link list module offset

如上寄存器是通过CPU来设置的，然后通过内部的硬件，产生用于DMA 的link list，即下面标注的寄存器中accessed by DMA的部分。

## Operation Flow:

DMA_CFG [31][30]=0  Group1,Group2 WP disable

将DMA Link list 写到GRP1_SAR~ GRP1_CTL1, GRP2_SAR~ GRP2_CTL1，

Group1和Group2的LLP应该互相指向对方。特别注意 LLP需要填base address + GRP1_SAR(accessed by DMA)和base address + GRP2_SAR(accessed by DMA)，只有从这两个address read ，SAR(accessed by DMA)和DAR(accessed by DMA)才会加offset。（CPU read 这2个address 也会导致SAR,DAR变化）

总block数需要是根据handler中设置的Tx_len和两个block size计算出来的。Group1或Group2每被read一次，load_cnt会+1。当load_cnt=总block数时，Link list就会停下来。

设定完成后，DMA_CFG [31][30]=1，Group1,Group2 WP enable。

将GRP1_SAR（accessed by DMA）的address(绝对地址) 填到DMA LLP register (内部)作为首个list。启动后，DMA应从G1 load 首组setting。

第一组数据发送完毕后，从GRP1_LLP（accessed by DMA）中获取GRP2_SAR（accessed by DMA）的address(绝对地址)作为第二个list

第二组数据发送完毕后，从GRP2_LLP（accessed by DMA）中获取GRP1_SAR（accessed by DMA）的address(绝对地址)作为第三个list

重复循环，直至load_cnt=总block数，DMA_LAST_LLP里设定的LLP value会被写到GRP1_LLP和GRP2_LLP，作为最后一个block被LLI被载入，其中的LLP_SRC_EN和 LLP_DST_EN已经被关闭。

最后一个block结束时，收到last信号，且其中的LLP_SRC_EN和 LLP_DST_EN均关闭，则DMA传输结果，channel enable自动归零。

### link list的硬件设计（如何停止）

硬件中根据block size和Tx_len确定了block number

每次读完link list，则block_cnt加1。（这个时间点比block start早一点点）

当block_cnt = block number – 1；说明倒数第二个block开始传输了。此时倒数第一个block的link list开始生成，花费1T。再将最后一个block的CTRL0中的source和destination的link list 功能关闭，花费1T。

倒数第二个block完成后，硬件发出last handshake，DMA判断自己仍然处于multi-block下，载入最后一个link list（其中CTRL0中link list 功能已关闭）。

倒数第一个block完成后，硬件发出last handshake，DMA判断自己处于single block，不再载入，则multi-block transfer结束，DMA中的channel enable归零，handler中的DMA enable和multi-block enable归零。

block cnt的值可以让用户看到当前在第几个block了；

block cnt clear

### link list与infinite mode

在infinite mode下使用link list时支持修改source address。

硬件会在每次Tx-len结束时将Group1和Group2的新的source address载入，等下一次Tx-len开始运行是生效。预填source address的register分别为GRP1_SAR_FOR_INFINITE_MODE和GRP2_SAR_FOR_INFINITE_MODE。


# DBI-C (SPIC) output

以下为MIPI DBI Specification中Type C标准interface。


图 9-1 MIPI DBI-C interface

## Overview

### Feature List

包含如下Feature:

Support DBI-C (option3) /QSPI/OPI for LCD

Support SPI Flash R/W format(FW mode下command + address + data)

Support SPI_W format(HW mode下command + address + data)

Support DMA request in HW mode

Support Tear effect signal

支持QSPI/OPI，DDR，最大50MHz spisclk

SPIC 中Tx FIFO depth为64（64*8bit）；Rx FIFO depth为8（8*8bit）。Tx FIFO和Rx FIFO分开共享entry DR[0]，write DR[0]，则数据进入Tx FIFO；read DR[0]，则数据出自Rx FIFO。（threshold通常设置为FIFO的一半）

支持对Tx FIFO的按照8bit写入；支持Rx FIFO按照8bit读出。

### Interface Signals


图 9-2 SPIC interface

SPIC Module的全部interface如上图所示，其中与LCD Device相连的signal是我们所关心的，其余的interface均在IP内部连接，用于控制或调试。

表 9-1 SPIC interface description

注意：原生的SPIC IP中，data signal分别为4条input data singal和4条output data signal。硬件电路将这8条信号线进行集成，变为了4条INOUT的信号线。如果为OPI下，则变为8条INOUT的信号线。

## Function Description


图 9-3 Function Description of SPIC setting

SPIC内部设置运行在user mode。

当AXI MUX设定为FW Mode时，CPU通过APB总线，经过APB->AXI和AXI MUX来设定SPIC内部的register，也可以在FW mode下手动往DR FIFO中送入CMD、ADDR和data，进行FW Tx或Rx流程；

当AXI MUX设定为HW时，Display Controller中的CMD和Address组合成packet，与来自pixel converter的pixel数据一起被发送至SPIC内部的DR FIFO（0X60）。当SPIC运行时，将数据通过SPI interface输出至LCD。

需要注意的是，当AXI MUX运行在HW mode下时，因为处于SPIC Tx流程中，pixel converter占用着AXI MUX，进而占用着SPIC的AXI接口，所以不要去响应SPIC内部的中断，也不要去读写SPIC内部的register，因此这些动作都需要通过APB经由AXI MUX的FW mode才可以进行。如果同时进行则会对AXI MUX的所有权产生争议，进而引起hardfault

### Transmit mode

User mode下的transmit mode，SPIC从Tx FIFO中取出数据，按照USER_CMD_LENGTH和USER_ADDR_LENGTH解出对应的Command和Address，后续FIFO中所有的数据都认为是Transmit data。

将Command、Address和Transmit data 分别置于Command Phase、Address Phase和data phase来发送。发送的波形如下所示：


图 9-4 SPIC Transmit Mode

Tx mode下要发送的data的总量，可以在寄存器TX_NDF中设置。发送的data数量等于TX_NDF时触发TFSI（transfer stop interrupt）。

### Receive mode

User mode下的Receive mode，SPIC从Tx FIFO中取出数据，按照USER_CMD_LENGTH和USER_ADDR_LENGTH解出对应的Command和Address，根据USER_RD_DUMMY_LENGTH来确定address phase后需要等待的cycle数量（部分LCD屏幕不需要dummy时间，则设置为0）。

将Command和Address分别置于Command Phase和Address Phase来发送，之后等待USER_RD_DUMMY_LENGTH个cycle。然后开始接收来自SPIC的数据，并将接收到的数据存储在Rx FIFO中。波形如下所示：（Rx FIFO和Tx FIFO 共享entry，用read和write动作来区分DR连接至哪个FIFO中）


图 9-5 SPIC Receive Mode

Rx mode下要接收的data的总量，可以在寄存器RX_NDF中设置。接收的data数量等于RX_NDF时触发TFSI（transfer stop interrupt）。

### Data Format

FW Mode

以command+address+data的format输出。格式如下表所示。

Command、address和data 的value, length及对应的lane number，由FW在SPIC register中设定

SPIC 在user mode下transfer过程可以分为command phase（发送command）、address phase（发送address或written status data）和data phase(receiving data or transmitting data)。其中在receive mode下，可以在address phase 和data phase之间设置dummy cycle。

command phase、address phase和dummy cycle的长度可以在对应的register中设置，如下：


图 9-6 SPIC User Mode Addr&CMD Length

command phase、address phase和data phase的所占用的channel的数量，可以在如下register中设置：


图 9-7 SPIC User Mode Addr、CMD、Data channel

在FW mode下可以在USER_LENGTH任意设置command phase、address phase长度，SPIC会在DR中取出对应数量的数据解析为command和address，并在对应的phase发送。FW mode下可以在TX_NDF和RX_NDF中设置Tx和Rx下data的数量。

FW mode下可以在CMD_CH、ADDR_CH和DATA_CH设置各个phase所占用的channel数量

HW mode

在HW mode下，command和address来自于handler register SPIC_CMD和SPIC_ADDR，且长度是固定的，即SPIC_CMD为1个byte，SPIC_ADDR为3个byte。因此在SPIC中的USER_CMD_LENGTH和USER_ADDR_LENGTH也必须对应设置为1和3。

HW mode下，data的数量是由handler 中的TX-LEN和SPIC中的TX_NDF二者来决定的，区别在于Tx-len以pixel为单位，而TX_NDF以byte为单位。为了保证HW mode下顺利进行，TX_LEN和TX_NDF的设置必须对应（单位换算）

HW mode下可以在CMD_CH、ADDR_CH和DATA_CH设置各个phase所占用的channel数量

表 9-2 Pixel data output format HW mode for SPIC

### Output Control Tx

在Display Controller中有两种方式启动SPI output，一种是通过auto_write_start来启动；另一种通过来自LCD的tear信号有效边沿来触发。两种情况下Tx均按照如下的流程工作。

将AXI MUX设定为FW mode，通过APB设定SPIC内部各项register

将AXI MUX设定为HW mode，方便后续发送Pixel数据

在Display Controller的设定handler和DMA需要的基本register

在Display controller中设定需要发送的pixel的数量

在display controller中设定需要发送的CMD和Address

打开DMA enable，让data 从RAM搬运至handler中的FIFO

等待tear 触发或手动通过auto_write_start触发数据tranfer，同时自动打开SPIC_EN

handler从FIFO中搬运数据，经过Pixel Converter后，与CMD和ADDRESS一同，发送至SPIC 内部FIFO

SPIC自动将SPIC FIFO中的data 、CMD和Address拆包，然后在不同的phase发送出去。

当handler中的output cnt达到设定的pixel数量，则自动停止。auto_write_start和SPIC_EN被自动置零，表示此次transfer正常结束

也可以通过disable display controller的方式来中途abort传输过程。此时会停止DMA搬运，且将已经搬运的pixel传输结束为止。

（详细的设置过程，请参考Bee3Pro Display Controller workflow）

### Output Control Rx

将AXI MUX设置为FW mode，通过APB设定SPIC内部各项register

将CMD和ADDR均通过APB直接设定在SPIC 内部Tx FIFO中去（而非handler中寄存器）。

enable SPIC

CPU 通过APB读取Rx FIFO中的数据，得到read back回来的数据。直到Rx byte等于寄存器RX_NDF中设定的值，则SPIC停止运转。


SPIC IP Rx sample data的时间点：

dummy cycle本身是按照bus_clk来进行计数的，而非sclk。

DATA_DDR=1

如果dummy cycle設SCKDV的整數倍，數完的時間剛好會是sclk toggle，spic sample的第一筆會是這個時間點後1T bus clk

如果不是整數倍，spic sample的第一筆會是下次sclk toggle再經過1T bus clk

DATA_DDR=0

如果dummy cycle設SCKDV*2的整數倍，數完的時間剛好會是sclk posedge，spic sample的第一筆會是這個時間點後1T bus clk

如果不是整數倍，spic sample的第一筆會是下次sclk posedge再經過1T bus clk

注意：DDR下sample看sclk的toggle，而SDR下sample看sclk的posedge。

### MIPI DBI type C option1（暂不支持）

MIPI DBI type C write sequence如下图，Tx Data format为9bits，command byte前加bit0，data byte前加bit1。


图 9-8 MIPI DBI type C option1 Write 1


图 9-9 MIPI DBI type C option1 Write 2


图 9-10 MIPI DBI type C option1 RGB565

MIPI DBI type C read sequence如下图，Tx Data format为9bits，command byte前加bit0；read back的data 为8 bits。


图 9-11 MIPI DBI type C option1 Read 1

可选择在图示位置是否加dummy cycle，并可设定dummy cycle数。


图 9-12 MIPI DBI type C option1 Read 2

### MIPI DBI type C option3（支持）

需要一个的DCX pin，DCX=0 表示当前是command，DCX=1 表示当前是data。Write waveform 如下图。当write data时，DCX pin需变为High。

使用如下signal输出波形时，SPIC中设定如下：

CMD_CH 	=	0x0；			CMD single channel

DATA_CH 	=	ox0；			DATA single channel

ADDR_CH	=	ox0；			ADDR single channel

USER_CMD_LENGHT=ox1；		CMD固定为1byte

USER_ADDR_LENGTH=0x3；		ADDR固定为3byte

注：此时的SDA用的是spi_sin[0]。

D/CX在command phase下为0，在其余的phase下均为1。且D/CX signal保持一直运行的状态，无论是否会用到D/CX。


图 9-13 MIPI DBI type C option3 Write


图 9-14 MIPI DBI type C option3 RGB565

DBI Type C Read waveform如下图, write command时，DCX=low 表示当前发送的是command。Read data时，DCX pin需变为High。Write command和Read Data之间可加dummy cycle，并可设定dummy cycle数。


图 9-15 MIPI DBI type C option3 Read

### Pixel Dual SPI option1（暂不支持）

Pixel Dual SPI option1如下所示，使用9bits data frame，发送command byte时，MSb需为0。发RGB data时，SD0和SD1的MSb皆为1。


图 9-16 RGB565 Pixel Dual SPI option1


图 9-17 RGB888 Pixel Dual SPI option1

### Pixel Dual SPI option2（暂不支持）

Pixel Dual SPI option2如下图所示，区别于option1，每发9bits RGB data就必须拉高CS一次


图 9-18 RGB565 Pixel Dual SPI option2


图 9-19 RGB888 Pixel Dual SPI option2

### Pixel QSPI SDR（支持）

唯一设定： cmd 1-channel SDR, addr 1/4-channel SDR, data 4-channel SDR

需支援2种波形，只需support RGB888，address byte需support 1 /4 data lane。

CMD_CH 	=	0x0；			CMD single channel

ADDR_CH	=	ox0；			ADDR single channel

DATA_CH 	=	ox2；			DATA quad channel

USER_CMD_LENGHT=ox1；		CMD固定为1byte

USER_ADDR_LENGTH=0x3；		ADDR固定为3byte



图 9-20 Pixel QSPI RGB888 option1

CMD_CH 	=	0x0；			CMD single channel

ADDR_CH	=	ox2；			ADDR quad channel

DATA_CH 	=	ox2；			DATA quad channel

USER_CMD_LENGHT=ox1；		CMD固定为1byte

USER_ADDR_LENGTH=0x3；		ADDR固定为3byte

（注：矽创的样品屏幕QSPI SDR支持的是上述这种）



图 9-21 Pixel QSPI RGB888 option2

### Pixel QSPI DDR（支持）

SPIC DDR是在sclk的posedge生效，而非像SDR中那样，根据SCPOL和SCPH来确定。

唯一设定： cmd 1-channel SDR, addr 1/4-channel SDR, data 4-channel DDR

以上设定用于支持矽创的样品屏幕，实物验证通过。


QSPI 矽创样品屏幕验证结果


### Pixel OPI SDR（支持）

唯一设定：cmd 1-channel SDR, addr 1/8-channel SDR, data 8-channel SDR

### Pixel OPI DDR（支持）

SPIC DDR是在sclk的posedge生效，而非像SDR中那样，根据SCPOL和SCPH来确定。

唯一设定： cmd 1-channel SDR, addr 1/8-channel SDR, data 8-channel DDR

以上设定用于支持矽创的样品屏幕，实物验证通过。

### Ramless QSPI（支持）

Ramless SPI用于支持内部不含GRAM且外部为SPI接口的屏幕，通过command将Hsync、Back Porch、Front Porch和pixel data直接发送至屏幕内部的对应地址，直接用于屏幕显示，类似于video mode。而非常规command mode下先发送到GRAM，然后再从GRAM搬运至屏幕的方式。

Ramless SPI interface与video mode的对应关系如下所示：


图 9-22 Ramless QSPI与DPI waveform对比

可以看出，DPI interface中的VSYNC区域中的每条line被RAMLESS SPI的“CMD（0xDE）+ADDR（0x006100）”代替，VBP区域中的每条line被“CMD（0xDE）+ADDR（0x006000）”代替，VACTIVE区域内的pixel data被“CMD（0xDE）+ADDR（0x006000）+DATA（SPI）”代替。

RAMLESS SPI刷新一整帧的过程如下所示：


图 9-23 Ramless QSPI 发送帧的流程

除了将原本DPI interface中的VSYNC、VBP和VFP阶段用“CMD+ADDR”的形式代替，将VACTIVE阶段用“CMD+ADDR+pixel”的形式代替外，在line与line之间和frame与frame之间都需要设定对应的delay时间，这段时间内CS必须处于high。且ACTIVE的ADDR和pixel之间必须含有对应的dummy CMD。

RAMLESS SPI使用流程如下：

【FW】选择DBI-C/SPIC interface，并打开Ramless_QSPI_enable

【FW】按照需求设置DMA、handler等运行状态

【FW】将AXI MUX设置为FW mode，按照需求设置SPIC的基础运行参数，如CMD channel、ADDR channel和data channel，Tx mode等

【FW】将AXI MUX切换至HW mode

【FW】设置register table中Ramless QSPI相关的register

【FW】打开auto_write_start


【HW】按照RLSPI_VERTICAL_SYNC_WIDTH决定下述两个步骤重复次数

【HW】重置TX_DNF为0，将RLSPI_VSYNC_CMD和RLSPI_VSYNC_CMD_ADDR通过AXI发送至SPIC Tx FIFO内部，启动SPIC_EN。等待发送结束后SPIC_EN归零

【HW】开始counter RLSPI_LINE_DELAY，直至counter结束


【HW】按照RLSPI确定的VBP大小决定下述两个步骤重复次数

【HW】重置TX_DNF为0，将RLSPI_HSYNC_CMD_VBPORCH和RLSPI_HSYNC_CMD_ADDR_VBPORCH通过AXI发送至SPIC Tx FIFO内部，启动SPIC_EN。等待发送结束后SPIC_EN归零

【HW】开始counter RLSPI_LINE_DELAY，直至counter结束


【HW】按照RLSPI确定的VACTIVE大小决定下述两个步骤重复次数

【HW】重置TX_DNF为（Dummy CMD+data size），将RLSPI_HSYNC_CMD_VACTIVE和RLSPI_HSYNC_CMD_ADDR_VACTIVE通过AXI发送至SPIC Tx FIFO内部，启动SPIC_EN。将此line的数据持续发送至SPIC Tx FIFO，等待发送结束后SPIC_EN归零

【HW】开始counter RLSPI_LINE_DELAY，直至counter结束


【HW】按照RLSPI确定的VFP大小决定下述两个步骤重复次数

【HW】重置TX_DNF为0，将RLSPI_HSYNC_CMD_VFP和RLSPI_HSYNC_CMD_ADDR_VFP通过AXI发送至SPIC Tx FIFO内部，启动SPIC_EN。等待发送结束后SPIC_EN归零

【HW】开始counter RLSPI_LINE_DELAY，直至counter结束


【HW】auto_write_start自动归零，表示一帧发送结束

【HW】若打开了infinite mode，则按照INFINITE_MODE_CTR的设置内容运行，且额外counter RLSPI_FRAME_DELAY_INFINITE后才开启auto_write_start。Counter结束后重新开始一帧的发送。


注：register table中设置的上述RLSPI_***_CMD_*的最大size为24bit，设置的RLSPI_***_CMD_ADDR_***的最大size为32bit，但是实际发送到SPIC中的CMD byte数和ADDR byte数量取决于SPIC中的USER_CMD_LENGHT和USER_ADDR_LENGTH，其中ADDR的最大size只能设置为4 byte.

Ramless支持的color format：


图 9-24 Ramless QSPI RGB888 Color format


图 9-25 Ramless QSPI RGB565 Color format


图 9-26 Ramless Dual-SPI RGB888 Color format


图 9-27 Ramless Dual-SPI RGB565 Color format


图 9-28 Ramless SPI RGB888 Color format


图 9-29 Ramless SPI RGB565 Color format

## SPIC Initial Flow

### Tx mode

SPIC Tx运行时SPIC相关寄存器设置flow：

【REG】AXI_MUX_MODE为FW MODE

【REG】CTRLR0 [31] 设定为user mode

CTRLR0 [21:16]设定output interface中CMD、ADDR和DATAphase的channel数量

CTRLR0 [9:8]设定为transmit mode

CTRLR0 [7:6]设定CPOL和CPHA，设定发送和接收的边沿

【REG】TX_NDF设定Tx mode下需要发送的data数量，单位为Byte。【此数据要与handler中的TX_LEN配合设置】

【REG】BAUDR[11:0] 设置spi_sclk从bus_clk的分频系数，产生SPIC的输出时钟

【REG】TXFTLR设置Tx FIFO的threshold

【REG】FLUSH_FIFO[1]清理DR FIFO

【REG】ICR清理掉所有的interrupt status

【REG】IMR设置对应的interrupt mask（DREIM、TFSIM、FSEIM、TXOIM、TXEIM）

【REG】DMACR[1]打开在Tx mode下由SPIC通过DMA Handshake请求数据，而非AXI直接写入。

【REG】DMATDLR设置Tx mode下当SPIC中FIFO中的data低于此数值时发起DMA request，通常设置为Tx FIFO深度的一半（Tx FIFO depth为64，DMATDLR设置为32即可）。

【REG】CTRLR2[7:4]设置Tx mode下Tx FIFO的深度，可以保持默认值不变（设置为6，26=64，Tx FIFO的深度为64.）

【REG】USER_LENGTH设置user mode下address phase和commnad phase的长度【HW mode下固定为1byte command，3byte address】

【REG】AXI_MUX_MODE为HW MODE

【REG】SPIC_CMD，填入需要发送的CMD

【REG】SPIC_ADDR，填入需要发送的ADDR

【REG】SSIENR[0] enable SPIC（这一步不用用户做，auto write start之后，硬件会自动打开SPIC）。

注意：

当auto_write_start enable之后，Display Controller handler会时刻占用AXI（for SPIC，而不是bus AXI）为HW mode，用于将data从handler FIFO搬运至SPIC DR TX FIFO中去。

当Tx-len结束后，auto_write_start自动归零，此时handler 才会释放AXI，AXI MUX才可以切换至FW MODE来access SPIC register。例如，当遇到SPIC FIFO timeout interrupt时，表示SPIC 已经停止工作，此时需要对handler进行abort操作，直至abort成功后auto_write_start归零，才可以将AXI MUX切换至FW MODE来access SPIC register，进而重新initial。

### Rx mode

SPIC Rx运行时SPIC相关寄存器设置flow：

【REG】AXI_MUX_MODE为FW MODE

【REG】CTRLR0 [31] 设定为user mode

CTRLR0 [21:16]设定output interface中CMD、ADDR和DATAphase的channel数量

CTRLR0 [9:8]设定为Receive mode

CTRLR0 [7:6]设定CPOL和CPHA，设定发送和接收的边沿

【REG】CTRLR2 [0]:若设置的是DBI-C single channel，则需要配置CTRLR2 [0]为0，使得Rx返回的数据从spi_sout[0]回来，而非spi_sout[1]。multi channel下不用设置。

【REG】RX_NDF设定Rx mode下需要接收的data数量，单位为Byte

【REG】BAUDR 设定spi_clk从spi_bus上的分频系数，产生SPIC的输出时钟

【REG】RXFTLR设置Rx FIFO的threshold

【REG】FLUSH_FIFO[1]清理DR FIFO

【REG】ICR清理掉所有的interrupt status

【REG】IMR设置对应的interrupt mask（DREIM、TFSIM、FSEIM、RXFIM、RXOIM、RXUIM）

【REG】	CTRLR2[11:8]设置Rx mode下Rx FIFO的深度，可以保持默认值不变（或者设置为3，23=8，Rx FIFO的深度为8.）

CTRLR2[3]设置为0，表示Rx read FIFO时为INCR

【REG】USER_LENGTH设置user mode下address phase和commnad phase的长度，以及Rx mode下在address phase之后delay的时间（delay暂定设置为0）

【REG】RX FIFO（0x60），填入需要发送的CMD

【REG】RX FIFO（0x60），填入需要发送的ADDR

【REG】SSIENR[0] enable SPIC。

## 需要标注的点

根据DV验证的结果，目前SPIC只支持SCPOL與SCPH需設成皆為0或1，即只支持以下mode中的mode0和mode3



# MIPI DBI-B output

参考Sbee2 I8080 design

以下为MIPI DBI Specification中Type-B的标准接口。data位宽选择为8bit。


图 10-1 MIPI DBI-B interface

## feature

MCU并行接口，8bit位宽

支持tear interface

支持auto read/write mode，最大command number为12；

支持manual 控制interface信号

可以预设command，并和pixel data整合按byte输出。

### state machine


图 10-2 MIPI DBI-B State Machine

IDLE:

idle state, DBI-B interface signals are kept high, trigger by (auto_write_start | auto_read_start | tear active edge)

INIT_GT:

guard time between the FSM trigged and the change on the DBI-B interface,0~4clk cycles

CMD_DC: D/CX goes low for cmd

CMD_CS: CS goes low

CS_CMD_GT: guard time between CS low and cmd output, 0~4 clk cycles

CMD_UP: WR goes low and update cmd

CMD_OUT: WR goes high, goes next state if cmd_output_cnt==cmd_output_number, otherwise goes back to CMD_UP

CMD_DATA_GT: guard time between cmd output and data input/output, D/CX goes high for data

DATA_UP: D/CX goes high for data, WR/RD goes low and update data

DATA_RW: WR/RD goes high, goes next state if data_cnt==data_number, otherwise goes back to DATA_UP

END: interface signals goes high and then back to IDLE

### Output Control

DBI-B支持以下四种output方式：

1、Auto Write

将auto_write_start 设置为1启动auto write。从FIFO中取出pixel raw data，经过pixel converter之后转换成对应的output format的pixel data，连同存储在CMD register中的CMD发送给LCD。


图 10-3 DBI-B interface write sequence

2、Auto Read

将auto_read_start 设置为1启动auto read。发送预存在regiser中的CMD，然后发送read clock来sample data。之后将pannel中返回的数据存储在FIFO中，此时不用反向经过pixel converter。


图 10-4 DBI-B interface read sequence

3、tear trigger auto write

将tear_auto_turn_on_autowritestart设置为1，在tear信号的有效边沿来临时，触发auto write，并将auto_write_start置1。之后的过程与auto_write_start触发方式时一致。

4、Manual mode

将OPERATE_CTR寄存器中的Access_mode设置为manual mode；然后在DBI-B_CFG[11:8]中设置控制信号。manual mode下需write的data存储在DBI-B_CMD_REG1[7:0],manual mode下read back的数据存储在DBI-B_RXDATA [7:0]，DBI-B_RXDATA [8]用于确认返回的数据是否有效，在DBI-B_RXDATA被读取后自动clear。

注意：auto_read_start, auto_write_start在传输完成后会被自动clear

### color mapping

目前pixel converter支持四种output pixel format，分别为RGB565、BGR565和RGB888、BGR888。DBI-B设置的data位宽为8bit。则16bit（RGB565）和24bit（RGB888）的pixel data通过D7-D0发送至display panel，需要遵循如下的color map。


图 10-5 DBI-B RGB565 color map


图 10-6 DBI-B RGB888 color map

BRG565与RGB565的波形基本一致，只需要将对应的R\G\B的位置调换即可；

BRG888与RGB888的波形基本一致，只需要将对应的R\G\B的位置调换即可；

## DBI-B work flow

### DBI-B auto mode Tx

initial flow：

设置寄存器INTERFACE_SELECT[2:1]，选择DBI-B interface

设置寄存器OPERATE_CTR[0]，选择operate mode：auto mode

设置寄存器OPERATE_CTR[1]，选择Transmission direction：Tx

设置寄存器FT_IN[1:0]，选择Pixel Converter的Input format

设置寄存器FT_OUT[1:0]，选择Pixel Converter的Output format

设置寄存器BIT_SWAP[1:0]，选择Pixel Converter的bit swap方式

设置寄存器TEAR_CTR，选择tear effect触发Tx有效边沿

设置寄存器DMA_FIFO_IMR[11]，选择是否mask tear effect interrupt

设置寄存器TEAR_CTR[27:16]，确定tear触发后的需要delay的时间

设置寄存器TEAR_CTR[31]，确定是否bypass tear触发后的delay时间

设置DMA相关寄存器，详见DMA Module部分

设置DMA link list相关寄存器，详见DMA Link list部分（若不需要则不设置）

设置寄存器DMA_FIFO_CTRL[7:3]，确定handler中与DMA相连的FIFO的threshold。则Tx和Rx下均有用

设置寄存器DMA_FIFO_IMR[8:4]，选择是否mask DMA FIFO Tx相关的寄存器

设置寄存器TX_LEN，选择auto mode下通过DBI-B向display panel发送的data的pixel总数

设置寄存器DBI-B_CTRL0 bit[9:4]，确定DBI-B下CLOCK的分频系数

设置寄存器DBI-B_CTRL0[29]，选择是否要bypass cmd byte

设置寄存器DBI-B_CTRL0[23:11]，选择是否bypass 3中guard time，以及guard time大小

设置寄存器DBI-B_CFG[31:30]，选择是否加入WRX相位延迟

设置寄存器DBI-B_CFG[3:0]，选择auto mode下command number

设置寄存器DBI-B_CMD_REG1、DBI-B_CMD_REG2、DBI-B_CMD_REG3，提前写入需要发送的CMD

work flow：

enable display controller，寄存器INTERFACE_SELECT bit[0]

enable DMA，DMA开始往FIFO中搬运数据，寄存器DMA_FIFO_CTRL bit[0]

enable tear effect，开始监控tear effect触发Tx，寄存器TEAR_CTR bit[0]

enable auto write start，从FIFO中取出数据，经过pixel converter后发送至display panel，寄存器OPERATE_CTR bit[31]。（或tear effect有效边沿来临也可以触发上述Tx）

stop flow及mode切换：

disable tear，停止监控tear信号的有效边沿，寄存器TEAR_CTR bit[0]

等待DMA disable， DMA停止往FIFO中搬运数据，DMA_FIFO_CTRL bit[0]。

（注：此处不能手动停止DMA，按照TX_LEN寄存器中的pixel反推DMA应该搬运的数据量，搬运完成后自动停止，DMA_FIFO_CTRL bit[0]自动恢复为0；当DMA还在搬运过程中时，手动写0无效）

等待auto write start disable，Display Controller停止从FIFO中拿数据进而发送至display panel，OPERATE_CTR bit[31]。

（注：此处无法手动停止Tx过程，按照TX_LEN寄存器中的pixel，Tx足够的byte数量后自动停止，OPERATE_CTR bit[31]自动恢复为0；当Tx仍处于active状态时，手动写入0无效）

手动清理FIFO，寄存器DMA_FIFO_ICR bit[0].

disable display controller，寄存器INTERFACE_SELECT bit[0]；

至此，当前mode或interface已完全停止，可进行mode或interface切换

### DBI-B auto mode Rx

initial flow：

设置寄存器INTERFACE_SELECT[2:1]，选择DBI-B interface

设置寄存器OPERATE_CTR[0]，选择operate mode：auto mode

设置寄存器OPERATE_CTR[1]，选择Transmission direction：Rx

设置寄存器DMA_FIFO_CTRL[7:3]，确定handler中与DMA相连的FIFO的threshold。则Tx和Rx下均有用

设置寄存器DMA_FIFO_IMR[10:9]，选择是否mask DMA FIFO Rx相关的寄存器

设置寄存器RX_LEN，选择auto mode下通过display panel向DBI-B返回的data的Byte总数

设置寄存器DBI-B_CTRL0 bit[9:4]，确定DBI-B下CLOCK的分频系数

设置寄存器DBI-B_CTRL0[29]，选择是否要bypass cmd byte

设置寄存器DBI-B_CTRL0[23:11]，选择是否bypass 3中guard time，以及guard time大小

设置寄存器DBI-B_CFG[31:30]，选择是否加入WRX相位延迟

设置寄存器DBI-B_CFG[3:0]，选择auto mode下command number

设置寄存器DBI-B_CMD_REG1、DBI-B_CMD_REG2、DBI-B_CMD_REG3，提前写入需要发送的CMD

work flow：

enable display controller，寄存器INTERFACE_SELECT bit[0]

enable auto read start，开启DBI-B receive data的流程，从display panel获取数据后存入FIFO。

user应该及时将handler FIFO中的数据读出，以防止read流程造成handler FIFO overflow。

注意：如果handler FIFO overflow，则read流程会正常进行，只是read back的数据会被直接丢弃，而不会存入FIFO。直至handler FIFO中出现可以存放read data的space。

stop flow及mode切换：

等待auto read start disable，Display Controller停止从display panel中接收数据存入FIFO，OPERATE_CTR bit[30]。

（注：此处无法手动停止Rx过程，按照RX_LEN寄存器中的byte，Rx足够的byte数量后自动停止，OPERATE_CTR bit[30]自动恢复为0；当Rx仍处于active状态时，手动写入0无效）

手动清理FIFO，寄存器DMA_FIFO_ICR bit[0].

disable display controller，寄存器INTERFACE_SELECT bit[0]；

至此，当前mode或interface已完全停止，可进行mode或interface切换

### DBI-B manual mode Tx

initial flow：

设置寄存器INTERFACE_SELECT[2:1]，选择DBI-B interface

设置寄存器OPERATE_CTR[0]，选择operate mode：manual mode

设置寄存器OPERATE_CTR[1]，选择Transmission direction：Tx

设置寄存器DBI-B_CTRL0 bit[9:4]，确定DBI-B下CLOCK的分频系数

work flow：

enable display controller，寄存器INTERFACE_SELECT bit[0]

设置寄存器DBI-B_CFG[8]，将DBI-B的CS信号拉低（active）

设置寄存器DBI-B_CMD_REG1 [7:0]，写入需要发送的data/command

设置寄存器DBI-B_CFG[9]，将DBI-B的D/CX拉低（CMD）/拉高（DATA）

设置寄存器DBI-B_CFG[10]为1，使得DBI-B的WRX信号出现下降沿，同时DBI-B的data线上出现数据；（1个clock后拉高给display panel上升沿，则data至少持续2个clock周期）

2个clock后，DBI-B_CFG[10]自动恢复为0，表示Tx manual 完成

新的write时则重复以上3、4、5、6步骤；

stop flow及mode切换：

等待DBI-B_CFG[10]恢复为0，则表明Tx manual已经完全结束。

设置寄存器DBI-B_CFG[8]为1，将DBI-B的CS信号拉高（inactive）

disable display controller，寄存器INTERFACE_SELECT bit[0]；

至此，当前mode或interface已完全停止，可进行mode或interface切换

### DBI-B manual mode Rx

initial flow：

设置寄存器INTERFACE_SELECT[2:1]，选择DBI-B interface

设置寄存器OPERATE_CTR[0]，选择operate mode：manual mode

设置寄存器OPERATE_CTR[1]，选择Transmission direction：Rx

设置寄存器DBI-B_CTRL0 bit[9:4]，确定DBI-B下CLOCK的分频系数

work flow：

enable display controller，寄存器INTERFACE_SELECT bit[0]

设置寄存器DBI-B_CFG[8]，将DBI-B的CS信号拉低（active）

设置寄存器DBI-B_CFG[11]为1，使得DBI-B的RDX信号出现下降沿，让display panel向data线上发送数据；（1个clock后拉高，在上升沿读取data上的数据）

2个clock后，DBI-B读取到data完成data线上数据的读取，DBI-B_CFG[11]自动恢复为0，表示Rx manual 完成

新的write时则重复以上3、4步骤；

stop flow及mode切换：

等待DBI-B_CFG[11]恢复为0，则表明Rx manual已经完全结束。

设置寄存器DBI-B_CFG[8]为1，将DBI-B的CS信号拉高（inactive）

disable display controller，寄存器INTERFACE_SELECT bit[0]；

至此，当前mode或interface已完全停止，可进行mode或interface切换

# MIPI eDPI Output

## General Description

DMA master 从RAM 读取Pixel图像（这部分图像是已经经过GPU处理后的图像），做RGB转换后输出符合eDPI标准的波形给DW MIPI DSI Host。


图 11-1 eDPI interface and block

## Feature List

IP 包含如下Feature:

Support standard DPI (Video mode)

Support Adapted Command Mode (eDPI interface)

Support AXI master read RAM

Output data width 16/24bits

## eDPI interface signals

（如下signal的方向都是从Display Controller的角度来看的）


图 11-2 eDPI interface


表 11-1 eDPI interface and function description

## Video Mode信号波形说明


图 11-3 eDPI waveform description

### 举例说明（4）

按照上图对于信号极性的定义，再附加如下的屏幕参数，详细解释说明各个信号线的波形。

屏幕参数：

表 11-2 屏幕参数举例说明

根据以上屏幕参数，得出的信号波形如下所示：


图 11-4 eDPI Video mode 4行4列LCD屏幕各信号波形图

对上图中圆圈内的部分扩大后显示如下所示：


图 11-5 eDPI Video mode LCD屏幕每一行Pixel波形图

### dpishutdn

注：dpishutdn信号只会在Type 4架构的显示模组中才会用到。

dpishutdn信号用于打开或关闭显示模组。（以下示例以shutdn信号高电平有效来描述）

#### dpishutdn信号与上电


图 11-6 eDPI Video mode dpishutdn and power off sequence

硬件设计为，当检测到Type4 架构下的shutdn信号从active变为inactive时（即从power off变为power on时），预先向LCD屏幕刷12帧黑（白）屏，黑（白）屏的pixel数据由硬件自行创造，而不通过DMA来获取。

注意：

根据DV的验证结果，在DSI power on（即PWR_UP register中shutdownz为1）之前，dpishutdnf[3:0]中全部为1；在DSI power on后，因为first_frame_start仍然为0的缘故，dpishutdnff[3:0]会依次左移，将（first_frame_start&dpishutdnint）移入，逐渐变为全部为0。中间势必经过了bit3:bit2=10的过程。


但是只有first_frame_start启动之后，pixctrlwe才会有效，才能进行封包及确定header等。因此虽然dpishutdnff在DSI power on之后自动产生了bit3:bit2=10，也不会发出0x32 DSI short packet；

（bit3:bit2=10，发0x32 DSI short packet ，power on；bit3:bit2=01，发0x22 DSI short packet ，power off）


硬件中设计为：DSI power on之后，LCD应该已经处于power on状态，且随时准备接受刷屏的pixel data。因此DSI直接刷12帧黑（白）屏，就可以开始正常刷新了。硬件拉dpishutdn为low的时间点为12帧中第一帧VSYNC之前（first_frame_start与VSYNC同时），则第一个0x32不会打出去，直接打12帧黑（白）屏。后续在DSI 处于power on状态时，如果需要通过dpishutdn再次向LCD 发送power on 0x32时，此packet会在VYSNC之后delay几T再拉dpishutdn signal，确保DSI能够sample到进而发送packet。


#### dpishutdn信号与断电


图 11-7 eDPI Video mode dpishutdn and power on sequence

硬件设计为，当检测到Type4 架构下的shutdn信号从inactive变为active时（即从power on变为power off时），先将本帧数据刷完，然后再向LCD屏幕刷4帧黑（白）屏，黑（白）屏的pixel数据由硬件自行创造，而不通过DMA来获取。

注意：

硬件中为了保证DSI能sample到dpishutdn signal，因此选择在四帧的第一帧开始刷新（第一帧VSYNC）之后，开始拉dpishutdn signal来power off。（即将dpishutdn signal拉高的时间向后delay了几T）。

#### shutdn与auto_write_start

当寄存器LCD_ARC选择为type4架构时，shutdn生效。由于shutdn信号对应的register SD_EN和SD_POL的default值为1，即处于power off的状态。则user必须在选用Type4架构后首先修改SD_EN或SD_POL，将LCD从power off的状态转为power on状态，此时硬件会预先发12帧黑屏。关机时，则可以修改SD_EN，将LCD从power on转为power off的状态。

只有在power on时，才可以启动auto_write_start。

当power on后刷12帧黑白屏期间，各个命令的优先级如下：power off >auto_write_start

当正常刷新frame的期间，各个命令的优先级如下： auto_write_start > power off


举例说明：

若在刷12帧黑白屏期间，启动了power off和auto_write_start：则12帧结束，会直接进入power off流程，刷4帧黑白屏。此时auto_write_start不会自动回零，需要启动abort流程来讲auto_write_start和dma_enable（若需要）回零。

若在正常刷新frame，即auto_write_start启动后正常刷新pixel时，启动了power off，则会等到auto_write_start刷新完毕且自动回零后，才启动power off刷4帧黑白屏。

### dpicolorm

注：dpicolorm信号只会在Type4架构的显示模组中用到（近来部分非Type4 panel也支持）。

dpicolorm信号用于改变显示颜色的数量(以下示例以dpicolorm信号高电平有效来描述)。当dpicolorm为高电平时，显示模组将只使用8种颜色来显示图像，取每个RGB值的MSB，组成3bitRGB值，显示8种color。同时，显示模组中所有非必需的电路都会被关闭，以此来降低显示模组的功耗。

此转变过程并非立即生效，而是在CM有效边沿后的下一个VSYNC起始边沿处生效。

从全色模式转为8色模式


图 11-8  eDPI Video mode from full-color to 8-color mode

从8色模式转为全色模式


图 11-9 eDPI Video mode from 8-color to full-color mode

注意：


为了保证上述成立，硬件会将dpicolorm的电平改变时间相比较register设定时间再delay几T，让其在VSYNC之后改变，确保DSI能够正确接收到上述signal。

### dpiupdatecfg

注：标准的MIPI DPI-2协议中并不包含dpiupdatecfg信号，这个是在Synopsys的DPI中增加的。

DPI支持动态修改DPI configuration而不影响当前正在传输的Frame，通过shadow register的方式得以实现。先将新的configuration数据储存在辅助的寄存器（shadow register）中，然后通过APB接口来请求configuration更新。（动态修改DPI Configuration可以完全通过软件的方式来进行）


图 11-10 eDPI下通过software来更新configuration

如果无法通过APB来同步DPI Configuration的修改请求，则可以使用外部信号dpiupdatecfg来发起DPI Configuration的修改请求。在dpiupdatecfg上升沿时，发起修改请求request。

host processor驱动dpiupdatecfg的做法如下：

Display Controller运行在eDPI interface下时，会以dpiclk为clock去latch REG 0x38[0] UP_EN的值，如果在dpiclk的上升沿latch到register中的值为1，则驱动外部signal dpiupdatecfg产生一个持续1T 的pulse，1T结束后此register自动归零。且此register 只能由硬件归零，而无法由user归零。


图 11-11 eDPI下通过hardware来更新configuration

注：DPI configuration的update request可以在frame的任何时候发起，但是DWC_MIPI_DSI_HOST会等到当前frame结束后才会更新configuration。然而，应当避免在frame的第一行时就发起update request。

### edpihalt

eDPI interface运行在video mode时，可以选择以HS或LP状态发送command，这些command是通过APB generic interface进入DSI Host controller的。DSI Host Controller在Blanking or Low-Power （BLLP）period 发送command，BLLP对应下图中的阴影部分。


图 11-12 BLLP of one Frame

在以上的BLLP阶段传送command的时候，由于横向总时间HLINE是恒定的，所以不会产生Display Controller和DSI Host Controller的速度不匹配。但是除了在BLLP阶段发送command之外，对于一些比较大的command，无法在BLLP阶段完成发送，则需要在每一帧的最后一行结束后来发送。在这种情况下，最后一行的时间会被拉长，video mode中HLINE的实际总时间和设定的不一致了，需要通过edpihalt信号告诉Display controller暂时不要开始下一帧，防止两边出现速度不匹配，从而导致FIFO overflow的情况。


图 11-13 edpihalt in video mode

## Adapted Command Mode

下图中假定DSI Host中设置edpi_allowed_cmd_size为6个Pixel data。


图 11-14 eDPI Adapted Command Mode waveform

dpivsync_edpiwms高电平期间，pixel data 通过EDPI interface进入DSI Controller内部，每通过1个Pixel，Counter加1；

若Counter == EDPI_CMD_SIZE，则WMS/WMC命令被写入COMMAND FIFO内，COMMAND与之前传入的pixel data在DSI Controller内部完成PACKET 组装，packet中的payload同时包含了command和EDPI_CMD_SIZE数量的pixel data，通过MIPI的channel发出至Display Panel；（pixel stream中的第一个packet用WMS命令，后面的用WMC命令）

之后，counter复位，重新开始新一轮计数。


若Counter 在达到 EDPI_CMD_SIZE之前，dpivsync_edpiwms就出现了下降沿，则向COMMAND FIFO中写入WMS/WMC命令，COMMAND与之前传入的pixel data在DSI Controller内部完成PACKET组装，packet中的payload同时包含了command和Counter数量的pixel data，通过MIPI的channel发出至Display Panel；

（pixel stream中的第一个packet用WMS命令，后面的用WMC命令）

### Tear_request & edpite

DSI在Command Mode时支持tearing effect。tear effect可以让host processor知晓display device读到frame buffer的某一位置时的精准时间信息。（从而确定host processor什么时候往FIFO中送数据）

host processor驱动tear_request的做法如下：

Display Controller运行在eDPI interface下时，会以dpiclk为clock去latch REG 0x3C[1] TEAR_REQ的值，如果在dpiclk的上升沿latch到register中的值为1，则驱动外部signal tear_request产生一个持续1T 的pulse，1T结束后此register自动归零。且此register 只能由硬件归零，而无法有user归零。


tear effect的request可以通过软件和硬件的方式来触发，这里只介绍硬件触发的方式。


图 11-15 eDPI Adapted Command Mode tear effect

### edpite的特殊要求


图 11-16 DSI下返回tear signal的方式

根据DSI中返回tear的方式，tear event是在LP Escape mode下通过Display Panel的LP-Tx发送出来的，然后由host processor的LP-RX来接收。当host processor的LP-RX在工作时，所依据的时钟为rxclkesc，接收回来的tear event体现在PPI的Rxtriggeresc[3:0]数据线上。根据DW DSI RTL code中的做法，会在rxclkesc clock domain下根据Rxtriggeresc[3:0]的数据产生一个当前是否有tear返回的signal，然后通过DPI clock去sample这条signal，以此来确定edpite signal的值。

上述描述其实就是用dpiclk去sample一个rxclkesc clock domain下的signal来确定edpite的值，且rxclkesc的最大频率为10MHz，根据采样定律，为了能100%准确sample，则dpiclk应该至少为20MHz，才能保证不漏掉任何一个tear event。

因此在Adapted command mode下，如果要使用edpite，则需要至少保证dpiclk为20MHz以上。

### edpihalt

edpihalt在command mode下用于确保DSI中的eDPI Command FIFO和Payload FIFO不会溢出。当eDPI Command FIFO或Payload FIFO增大为在两个时钟周期后变为full时，epdihalt输出上升沿信号；当eDPI Command FIFO或Payload FIFO从full降低为还差两个时钟周期就full时，edpihalt输出下降沿信号。

当epihalt处于asserted状态时，dpivsync_edpiwms可以通过变低再变高，来标志着上一个Command的结束和新的Command的开始。但是，如果发生dpivsync_edpiwms来结束某个command，则在dpivsync_edpiwms拉高后，dpidataen只能在edpihalt de-asserted后才可以变得有效。


图 11-17 eDPI Adapted Command Mode halt wareform

## Clock divider in eDPI interface

eDPI interface下同时支持video mode和adapted commnad mode。运行在video mode时，由于Display Panel side没有GRAM来存储排pixel data，需要eDPI interface源源不断的发送实时刷屏所需要的数据。

当屏幕大小一定时，eDPI interface发送数据的clock直接决定了Display Panel side刷新屏幕的帧率。由于当前常用的帧率为30Hz、59Hz和60Hz等，为了保证刷屏帧率的准确性，需要display clock更加细化的分频来产生足够精准的clock以满足不同的刷新帧率，同时也为了满足相同帧率下的不同size的屏幕要求。

因此，此次设计中采用了调整PLL+整数除频的方式，而非常用的clock gating方案，以此来同时保证clock精确度和占空比贴近50%的要求。

eDPI interface所选用的除频source为display clock，通常设置为200MHz（FPGA阶段可能会降频）。以display clock的上升沿作为counter基准。

注意：只有在edpi video mode和DPI interace下的时候才会调整PLL，因为video mode的屏幕对timing 要求特别严格，光靠整数分频精度不够（分数除频存在忽快忽慢的问题）。其他的mode和interface下均不会调整PLL，会将其产生的display clock保持在200MHz。

### 使用举例（video mode）


图 11-18 DW DSI 屏幕相关参数举例说明

这里以DW DSI中支持的某个320*240的屏幕参数为基础，举例说明video mode下除频参数的设定。

屏幕有效尺寸为：320*240

屏幕扩宽后的实际尺寸为：380*246（包含HSYNC、HBP、HFP和VSYNC、VBP、VFP）

屏幕刷新率：60Hz

屏幕要求的clock：=380*246*60=5608800Hz=5.6088MHz

实际设定的dpiclk：按照5.6088MHz，以KHz为单位向上取整至5.609MHz

选择合适的dpiclk分频系数，从display clock进行整数分频后得到dpiclk。例如选择34

则将前端的PLL设定为5.609MHz*34=190.706MHz即可。

### DW DSI lane byteclock设置

理论上来说，当eDPI interface的下的dpiclk的频率确定之后，后续DW DSI 中的lane byteclock的频率只要满足output 数据流速度大于input数据流速度即可，即DSI lanebyteclock的速率只有下限而无上限。但是根据实际DV测试结果，DSI lanebyteclock的速率不能过高，否则会产生如下问题：

video mode下DSI中设置屏幕尺寸的registrer size溢出，无法表示对应大小的屏幕

DW DSI buffer underflow（可能是第一个或第二个chunk 发送时产生underflow）

## MIPI eDPI register

### Clock相关

在eDPI interface下需要通过EDPI_DIV_PAR 对display clock进行整数除频。

### LCD屏幕尺寸相关

以下描述中涉及的寄存器为：EDPI_SYNC_WIDTH、EDPI_ABACK_PORCH、EDPI_AACTIVE、EDPI_TOTAL。

以下参数的设置均已Pixel Clock为单位，计数以坐标（0，0）为原点计算。

HSW[11:0]		:下图中A点的横坐标，间接确定HSYNC的大小，HSW[11:0] = HSYNC ,

VSH[10:0]		:下图中A点的纵坐标，间接确定VSYNC的大小，VSH[10:0] = VSYNC

AHBP[11:0]		:下图中B点的横坐标，间接确定HBP的大小，AHBP[11:0] = HSYNC + HBP

AVBP[10:0]		:下图中B点的纵坐标，间接确定VBP的大小，AVBP[10:0] = VSYNC + VBP

AAW[11:0]		:下图中E点的横坐标，间接确定Active Width的大小，AAW[11:0] = HSYNC + HBP + Active Width

AAH[10:0]		:下图中E点的纵坐标，间接确定Active Height的大小，AAH[10:0] = VSYNC + VBP Active Height

TOTALW[11:0]	:下图中F点的横坐标，间接确定HFP的大小，TOTALW[11:0] = HSYNC + HBP + Active Width + HFP

TOTALH[10:0]	: 下图中F点的纵坐标，间接确定VFP的大小，TOTALH[10:0] = VSYNC + VBP + Active Height + VFP


图 11-19 eDPI Video Mode 屏幕相关参数说明

### Signal Polarity(REG EDPI_SYNC_POL)

HSPOL:		确定了dpihsync信号的极性

This bit is set and cleared by software.

0: horizontal synchronization polarity is active low.

1: horizontal synchronization polarity is active high.

VSPOL		确定了dpivsync_edpiwms信号的极性

This bit is set and cleared by software.

0: vertical synchronization is active low.

1: vertical synchronization is active high.

DEPOL		确定了dpidataen信号的极性

This bit is set and cleared by software.

0: not data enable polarity is active low.

1: not data enable polarity is active high.

### Interrupt

#### 中断MASK信号（REG EDPI_INT_MASK）

LIM			：line interrupt 中断的mask信号。

当LCD的Pixel刷到某个设定的line_x时，触发此中断。line_x在后续寄存器中设置。

This bit is set and cleared by software.

0: line interrupt is unmasked

1: line interrupt is masked

#### 中断状态位信号（REG EDPI_INT_FLAG）

LIF			：line interrupt中断状态位

0: no line interrupt generated

1: line interrupt generated when a programmed line is reached

#### 中断状态位清除信号（REG EDPI_INT_CLR）

CLIF		：写1清除line interrupt中断状态位

#### Line Interrupt 阈值设置(REG EDPI_LINE_INT_POS)

LIPOS[10:0]		：line interrupt触发条件中line阈值的line_x的设置

### 当前像素点位置（REG EDPI_PIXEL_POS）

CXPOS[15:0]		：当前刷新的像素点的X坐标（以dpihsync和dpivsync起始时的clock为原点计算）

CYPOS[15:0]		：当前刷新的像素点的Y坐标（以dpihsync和dpivsync起始时的clock为原点计算）

### 当前SYNC信号的状态（REG EDPI_SYNC_STATUS）

HSYNCS			：当前dpihsync信号的状态，0表示低电平，1表示高电平

VSYNCS			：当前dpivsync信号的状态，0表示低电平，1表示高电平

HDES			：如下图，当前位置在AREA1 、Active Area 、AREA3内时，dpi_HDE（horizontal data enable）为active，其他区域为Inactive。

VDES			：如下图，当前位置为AREA2、Active Area 、AREA4内时，dpi_VDE（vertical data enable）为Active，其他区域为Inactive


图 11-20 eDPI Video Mode SYNC、DE信号说明

dpi_HDE和dpi_VDE共同确定了信号dpidataen，dpi_HDE为1表示横向位置在Active Area区域内，dpi_VDE为1表示纵向位置在Active Area区域内。只有dpi_HDE和dpi_VDE均为1，则表示当前位置具有实际的piexel data，则dpidataen为Active。

### color map（REG EDPI_COLOR_MAP）

COLOR_MAP[1:0]	：从pixel converter输出给DW MIPI DSI Host pixel时的color map

These bits configure the pixel color map

00: RGB888

01: RGB565_1(R[D15:D11]、G[D10:D5]、B[D4:D0])

10: RGB565_2(R[D20:D16]、G[D13:D8]、B[D4:D0])

11:RGB565_3(R[D21:D17]、G[D13:D8]、B[D5:D1])


图 11-21 eDPI RGB color map(dpidata signals)

### operating mode

OP_MODE：		用于选择当前的eDPI interface的operating mode。

operating mode of edpi Interface

0：Standard Video mode (DPI Standard Interface)

1：Adapted Command mode (Synopsys Proprietary Interface)

### video mode下额外的控制信号（REG EDPI_VIDEO_CTL）

用于设定在video mode下Display Driver的架构和dpishutdn、dpicolorm和dpiupdatecfg的极性和电平。其中dpiupdatecfg在DPI标准协议中确定为高电平有效，故不用设定极性。

LCD_ARC		用于设定Display Driver的架构，默认架构为（非Type4 架构），此处选择了Type4架构后才需要操作shutdn和colorm信号寄存器。

SD_POL：		用于设定dpishutdn signal的极性（Type 4 only）

CLM_POL：		用于设定dpicolorm signal的极性（Type 4 only）


SD_EN：		用于设置dpishutdn signal的电平为high还是low

CLM_EN：		用于设置dpishutdn signal的电平为high还是low

UP_EN：		用于设置dpiupdatecfg signal产生一个pulse

### adapted command mode下额外控制信号（REG EDPI_CMD_CTL）

用于设定在Adapted Command Mode下tear_request signal的电平和读取halt signal的电平。

TEAR_REQ：		用于设定tear_request signal的电平，产生一个pulse

HALT：				用于读取halt signal的电平

## eDPI work flow

### Adapted Command mode work flow

initial flow：

设置寄存器INTERFACE_SELECT[2:1]，选择eDPI interface

设置寄存器OPERATE_CTR[0]，选择operate mode：auto mode（eDPI仅支持auto mode）

设置寄存器OPERATE_CTR[1]，选择Transmission direction：Tx（eDPI仅支持Tx）

设置寄存器EDPI_OP_MODE，选择Adapted command mode

设置寄存器FT_IN[1:0]，选择Pixel Converter的Input format

设置寄存器FT_OUT[1:0]，选择Pixel Converter的Output format

设置寄存器BIT_SWAP[1:0]，选择Pixel Converter的bit swap方式

设置寄存器TEAR_CTR[2]，选择tear effect触发Tx有效边沿

设置寄存器DMA_FIFO_IMR[11]，选择是否mask tear effect interrupt

设置寄存器TEAR_CTR[27:16]，确定tear触发后的需要delay的时间

设置寄存器TEAR_CTR[31]，确定是否bypass tear触发后的delay时间

设置DMA相关寄存器，详见DMA Module部分

设置DMA link list相关寄存器，详见DMA Link list部分（若不需要则不设置）

设置寄存器DMA_FIFO_CTRL[7:3]，确定handler中与DMA相连的FIFO的threshold。

设置寄存器DMA_FIFO_IMR[8:4]，选择是否mask DMA FIFO Tx相关的寄存器

设置寄存器TX_LEN，选择auto mode下通过eDPI向display panel发送的data的pixel总数

设置寄存器EDPI_CLK_DIV，确定eDPI下CLOCK的分频系数

设置寄存器SYNC_POL[29]，确定eDPI中dpidataen signal的极性

设置寄存器EDPI_CMD_MAX_LATENCY，确定eDPI中max latency中数值

设置寄存器EDPI_COLOR_MAP，确定eDPI中output color map

work flow：

enable display controller，寄存器INTERFACE_SELECT bit[0]

enable DMA，DMA开始往FIFO中搬运数据，寄存器DMA_FIFO_CTRL bit[0]

enable tear effect，开始监控tear effect触发Tx，寄存器TEAR_CTR bit[0]

【若需要】enable tear request，从host向pannel发出tear请求，寄存器EDPI_CMD_CTL bit[1]

enable eDPI auto_write_start，从FIFO中取出数据，经过pixel converter后发送至display panel，寄存器OPERATE_CTR[31]。（或tear effect有效边沿来临也可以触发上述Tx）

stop flow及mode切换：

disable tear start，停止监控tear信号的有效边沿，寄存器TEAR_CTR bit[0]

等待DMA disable， DMA停止往FIFO中搬运数据，DMA_FIFO_CTRL bit[0]。

（注：此处不能手动停止DMA，按照TX_LEN寄存器中的pixel反推DMA应该搬运的数据量，搬运完成后自动停止，DMA_FIFO_CTRL bit[0]自动恢复为0；当DMA还在搬运过程中时，手动写0无效）

等待eDPI auto_write_start disable，Display Controller停止从FIFO中拿数据进而发送至display panel，OPERATE_CTR[31]。

（注：此处无法手动停止Tx过程，按照TX_LEN寄存器中的pixel，Tx足够的byte数量后自动停止，EDPI_WRITE_EN自动恢复为0；当Tx仍处于active状态时，手动写入0无效）

手动清理FIFO，寄存器DMA_FIFO_ICR bit[0].

disable display controller，寄存器INTERFACE_SELECT bit[0]；

至此，当前mode或interface已完全停止，可进行mode或interface切换

### Video mode work flow

initial flow：

设置寄存器INTERFACE_SELECT[2:1]，选择eDPI interface

设置寄存器OPERATE_CTR[0]，选择operate mode：auto mode（eDPI仅支持auto mode）

设置寄存器OPERATE_CTR[1]，选择Transmission direction：Tx（eDPI仅支持Tx）

设置寄存器EDPI_OP_MODE，选择video mode

设置寄存器FT_IN[1:0]，选择Pixel Converter的Input format

设置寄存器FT_OUT[1:0]，选择Pixel Converter的Output format

设置寄存器BIT_SWAP[1:0]，选择Pixel Converter的bit swap方式

设置DMA相关寄存器，详见DMA Module部分

设置DMA link list相关寄存器，详见DMA Link list部分（若不需要则不设置）

设置寄存器DMA_FIFO_CTRL[7:3]，确定handler中与DMA相连的FIFO的threshold。

设置寄存器DMA_FIFO_IMR[8:4]，选择是否mask DMA FIFO Tx相关的寄存器

设置寄存器TX_LEN，选择auto mode下通过eDPI向display panel发送的data的pixel总数

设置寄存器EDPI_CLK_DIV，确定eDPI下CLOCK的分频系数

设置寄存器EDPI_SYNC_WIDTH、EDPI_ABACK_PORCH、EDPI_AACTIVE、EDPI_TOTAL，确定屏幕的相关参数

设置寄存器SYNC_POL[31:30]，确定dpihsync，dpivsync信号的极性

设置寄存器SYNC_POL[29]，确定eDPI中dpidataen signal的极性

设置寄存器EDPI_INT_MASK，确定是否要mask line interrupt

设置寄存器EDPI_LINE_INT_POS，确定line interrupt中的line值

设置寄存器EDPI_COLOR_MAP，确定eDPI中output color map

设置寄存器EDPI_VIDEO_CTL bit[31、9:8]，选定Type4架构，确定dpishutdn、dpicolorm信号极性,仅用于Type 4架构的显示模组的场景

work flow：

enable display controller，寄存器INTERFACE_SELECT bit[0]

enable DMA，DMA开始往FIFO中搬运数据，寄存器DMA_FIFO_CTRL bit[0]

enable eDPI auto_write_start，从FIFO中取出数据，经过pixel converter后发送至display panel，寄存器OPERATE_CTR[31]。

stop flow及mode切换：

等待DMA disable， DMA停止往FIFO中搬运数据，DMA_FIFO_CTRL bit[0]。

（注：此处不能手动停止DMA，按照TX_LEN寄存器中的pixel反推DMA应该搬运的数据量，搬运完成后自动停止，DMA_FIFO_CTRL bit[0]自动恢复为0；当DMA还在搬运过程中时，手动写0无效）

等待eDPI auto_write_start disable，Display Controller停止从FIFO中拿数据进而发送至display panel，OPERATE_CTR[31]。

（注：此处无法手动停止Tx过程，按照TX_LEN寄存器中的pixel，Tx足够的byte数量后自动停止，EDPI_WRITE_EN自动恢复为0；当Tx仍处于active状态时，手动写入0无效）

手动清理FIFO，寄存器DMA_FIFO_ICR bit[0].

disable display controller，寄存器INTERFACE_SELECT bit[0]；


# DPI output

DPI output可以认为是将eDPI output video mode单独引出来，直接以并行数据的形式驱动RGB屏幕。因此与eDPI interface的video mode共享signal和register。eDPI command mode中使用的interface和signal将被忽略。


## 总体架构调整


图 12-1 增加line buffer后的Display Controller框架图

DPI interface直接驱动RGB屏幕，需要DPI发出持续稳定的数据流。考虑到DPI的上游Display Controller的data是通过DMAC从PSRAM中搬运来的，而DMAC可能会出现短时间内无法获取AXI bus 控制权，从而导致数据流产生短时中断的问题。

在原本的eDPI interface下由于DW DSI Host内部有buffer缓存一部分数据，因此DMAC短时数据中断不会产生问题。但是如果DPI interface直接在video mode下驱动display panel，DMAC发生短时中断，则video mode立即停止刷新，从而破坏video mode中对于line和frame的严格时间规定。

因此，当DPI 直接驱动display panel时，在原本的架构中增加了LINE BUFFER。当auto_write_start启动之后，先在LINE BUFFER中缓存一定量的pixel data（通常为一个line），然后再开始向DPI interface发送数据。以此来保证即使DMAC发生短时数据中断，也不会破坏video mode的正常刷新。

在DPI interface下，可以认为handler FIFO、pixel converter和line buffer是直连的，中间没有任何控制信号。dma_enable之后，data从PARAM中搬运至handler FIFO后，会立即从handler FIFO中流出，经过pixel converter后直接存储在line buffer中。只有当line buffer全部存满之后，才会在handler FIFO中存储data。当auto_write_start之后，如果满足line buffer的threshold设定，则pixel data 从line buffer 被搬运至DPI interface。

## Line buffer size

目前line buffer的设置考虑是：handler FIFO和line buffer中存储的pixel number合计为800个pixel。

### handler FIFO

32bit宽度，深度为128，存储data最大宽度为32bit（ARGB8888），则handler FIFO中共可以存储128个pixel data；

### line buffer

line buffer由于位置置于pixel converter后面，存储data的最大宽度为24bit（RGB888）。因此line buffer的宽度设置为24bit，深度设置为672。且存储data时以24bit对齐，如果存储的data为16bit，则高8bit补零即可。

## line buffer相关register

DPI_LINNE_BUFFER_PIXEL_NUM[15:0]:

用于显示当前line buffer中的pixel number。

DPI_LINE_BUFFER_PIXEL_THRESHOLD[15:0]：

用于设定line buffer pixel threshold。当auto_write_start enable之后，只有当line buffer中的pixel number大于等于此threshold时，才会启动从line buffer搬运数据至DPI interface的过程，否则就会一直等待。

## line buffer与MBIST

因为在RTL中增加了MBIST之后，PIPE control变得复杂，所以需要在line buffer中pixel number大于等于1（line buffer宽度为24bit，若16bit数据则高位补零后存入）后，才能向DPI interface发送数据（此处指的是DPI interface运行过程中，而非初始的DPI_LINE_BUFFER_PIXEL_THRESHOLD限制，若为RGB565，则取消高位补的0再发送）。

在搬运过程中（dma_en未归零），若line buffer中的pixel数量小于等于1，则不再向DPI interface发送数据，dpiclk也随之停止，说明此时DMA搬运速度太慢，产生了underrun。直至DMA搬运·使得line buffer中的pixel数量大于1时，才继续向DPI interface发送数据。

一旦搬运结束（dma_en未归零），line buffer中的pixel会尽数打空，直至LINNE_BUFFER_PIXEL_NUM为0。


附录

## abort之后的流程

在Display Controller传输过程中，可以通过手动将Display_controller_enable设置为0以中断传输，称为abort。abort之后为了保证系统的稳定，需要遵循如下流程：

DMA在当前burst传输完毕后停止搬运data；

DMA FIFO中可能剩余data未发送数据，后续手动清除；

handler不再从handler FIFO中搬运数据至interface，后续handler FIFO中的值手动清除；(DV：未发送的数据无需检测，直接丢掉)

若当前选择eDPI interface的video mode，则handler自造黑屏pixel发送至interface，保证完整一帧，发送完毕后关闭interface；（DV：需要检测这一帧数据的完整性）

若当前选择eDPI interface下的command mode或DBI-B，则handler直接停止interface，不再发送数据（command mode下会通过TE来确定下一帧panel GRAM的位置，不会导致下一帧位置错位）。

若当前选择SPIC interface，则handler直接停止interface，不再发送数据（SPIC可以通过address phase或TE来确定下一帧在GRAM中的起始位置，不会导致下一帧错误）

等待handler中的dma_en自动回零

启动suspend cancel流程，使得DMAC中的channel enable归零

手动清理DMA FIFO和handler FIFO

重新开始下一帧的数据传输（DV：检测这一帧数据是否正确及这一帧数据是否完整）

注意：abort指的是中断正常传输Tx_len data，中断之后的流程如上所示；abort无法中断video mode type4架构shutdn signal所产生的的12帧和4帧黑白屏data。

## MIPI debug group

MIPI由于debug signal太多，不能在32个bit上完全表示，因此选择内部设置不同的debug group，分别为group0-group3，通过MIPI内部offset为0x390的register的bit[3:0]来表示。如0x0表示group0,0x1表示group1,以此类推。

具体的group分布如下表所示：


表 12-1 MIPI debug group


---

## 表格内容

### 表格 1

| 日期 | 版本 | 修改 | 作者 | Reviewer |
| 20220615 | 20220615 | 继承Bee3Pro Display Controller 20220614版本的SPEC
增加ramless qspi相关的章节 |  |  |
| 20221125 | 20221125 | 取消last block interrupt相关描述 |  |  |

### 表格 2

| 缩写 | 含义 |
|  |  |
|  |  |
|  |  |

### 表格 3

|  | signal |
| clock lane | MIPI0_CLKP |
| clock lane | MIPI0_CLKN |
| data lane 0 | MIPI0_DQ0P |
| data lane 0 | MIPI0_DQ0N |
| data lane 1 | MIPI0_DQ1P |
| data lane 1 | MIPI0_DQ1N |

### 表格 4

| Display Controller Signal | I/O | DBI-B | SPIC | RGB（DPI） | MIPI(EDPI) |
| LCDC_DATA23 | out | (high-z) | (high-z) | D23 | (high-z) |
| LCDC_DATA22 | out | (high-z) | (high-z) | D22 | (high-z) |
| LCDC_DATA21 | out | (high-z) | (high-z) | D21 | (high-z) |
| LCDC_DATA20 | out | (high-z) | (high-z) | D20 | (high-z) |
| LCDC_DATA19 | out | (high-z) | (high-z) | D19 | (high-z) |
| LCDC_DATA18 | out | (high-z) | (high-z) | D18 | (high-z) |
| LCDC_DATA17 | out | (high-z) | (high-z) | D17 | (high-z) |
| LCDC_DATA16 | out | (high-z) | (high-z) | D16 | (high-z) |
| LCDC_DATA15 | out | (high-z) | (high-z) | D15 | (high-z) |
| LCDC_DATA14 | out | (high-z) | (high-z) | D14 | (high-z) |
| LCDC_DATA13 | out | (high-z) | (high-z) | D13 | (high-z) |
| LCDC_DATA12 | out | (high-z) | (high-z) | D12 | (high-z) |
| LCDC_DATA11 | out | (high-z) | (high-z) | D11 | (high-z) |
| LCDC_DATA10 | out | (high-z) | (high-z) | D10 | (high-z) |
| LCDC_DATA9 | out | (high-z) | (high-z) | D9 | (high-z) |
| LCDC_DATA8 | out | (high-z) | (high-z) | D8 | (high-z) |
| LCDC_DATA7 | inout | DBI_B_D7 | SPIC_SI7（OPI） | D7 | (high-z) |
| LCDC_DATA6 | inout | DBI_B_D6 | SPIC_SI6（OPI） | D6 | (high-z) |
| LCDC_DATA5 | inout | DBI_B_D5 | SPIC_SI5（OPI） | D5 | (high-z) |
| LCDC_DATA4 | inout | DBI_B_D4 | SPIC_SI4（OPI） | D4 | (high-z) |
| LCDC_DATA3 | inout | DBI_B_D3 | SPIC_SI3（QSPI&OPI） | D3 | (high-z) |
| LCDC_DATA2 | inout | DBI_B_D2 | SPIC_SI2（QSPI&OPI） | D2 | (high-z) |
| LCDC_DATA1 | inout | DBI_B_D1 | SPIC_SI1（QSPI&OPI） | D1 | (high-z) |
| LCDC_DATA0 | inout | DBI_B_D0 | SPIC_SIO0 | D0 | (high-z) |
| LCDC_TE_VSYNC | inout | LCD_TE (VSYNC) | LCD_TE (VSYNC) | VSYNC | LCD_TE |
| LCDC_DCX/HSYNC | out | DBI_B_D/CX | SPIC_DCX | HSYNC | (high-z) |
| LCDC_CSN/DE | out | DBI_B_CXS | SPIC_CSN | DE | (high-z) |
| LCDC_WRCLK | out | DBI_B_WRX | SPIC_SCLK | PCLK | (high-z) |
| LCDC_RDCLK/CM | out | DBI_B_RDX | (high-z) | CM | (high-z) |
| LCDC_RESET/SD | out | LCD_RESX | LCD_RESX | SD | LCD_RESX |

### 表格 5

| Pixel 3 | R | Byte11 | Word2 |
| Pixel 3 | G | Byte10 | Word2 |
| Pixel 3 | B | Byte9 | Word2 |
| Pixel 2 | R | Byte8 | Word2 |
| Pixel 2 | G | Byte7 | Word1 |
| Pixel 2 | B | Byte6 | Word1 |
| Pixel 1 | R | Byte5 | Word1 |
| Pixel 1 | G | Byte4 | Word1 |
| Pixel 1 | B | Byte3 | Word0 |
| Pixel 0 | R | Byte2 | Word0 |
| Pixel 0 | G | Byte1 | Word0 |
| Pixel 0 | B | Byte0 | Word0 |

### 表格 6

| Input | Output Format | Output Format | Output Format | Output Format |
| Format | RGB565 | RGB888 | BGR565 | BGR888 |
| ARGB8888 | Yes | Yes | Yes | Yes |
| BGR565 | Yes | Yes | Bypass | Yes |
| RGB565 | Bypass | Yes | Yes | Yes |
| RGB888 Stream | Yes | Yes | Yes | Yes |
| ABGR8888 | Yes | Yes | Yes | Yes |

### 表格 7

| SAR0 | 0x000 | 64 | channel 0 source address register
(USER自己配置，Pixel data存储位置) |
| DAR0 | 0x008 | 64 | Channel 0 Destination Address Register 
(USER自己配置，Display Controller中FIFO的位置) |
| LLP0 | 0x010 | 64 | channel 0 linked list pointer register
(user自己配置，multi-block时才会使用，与link list module合起来使用) |
| CTL0 | 0X018 | 64 | Channel 0 Control Register 
(user自己配置，后续会详解每个bit作用) |
| SSTAT0 | 0x020 | 64 | Channel 0 Source Status Register 
（与parameter DMAC_CHx_STAT_SRC 有关，Configuration阶段设置为false，故此register不存在） |
| DSTAT0 | 0x028 | 64 | Channel 0 Destination Status Register 
（与parameter DMAC_CHx_STAT_DST 有关，Configuration阶段设置为false，故此register不存在） |
| SSTATAR0 | 0x030 | 64 | Channel 0 Source Status Address Register 
（与parameter DMAC_CHx_STAT_SRC 有关，Configuration阶段设置为false，故此register不存在） |
| DSTATAR0 | 0x038 | 64 | Channel 0 Destination Status Address Register 
（与parameter DMAC_CHx_STAT_DST 有关，Configuration阶段设置为false，故此register不存在） |
| CFG0 | 0x040 | 64 | Channel 0 Configuration Register 
(user自己配置，后续会详解每个bit作用) |
| SGR0 | 0x048 | 64 | Channel 0 Source Gather Register 
（与parameter DMAC_CHx_SRC_GAT_EN有关，configuration阶段设置为false，故此register不存在） |
| DSR0 | 0x050 | 64 | Channel 0 Destination Scatter Register 
（与parameterDMAC_CHx_DST_SCA_EN有关，configuration阶段设置为false，故此register不存在） |

### 表格 8

| 63：32 | TRANS_DATA_CNT |  | 因为DMA不做流控，所以不care，用户不设置 |
| b:32 | BLOCK_TS |  | 因为DMA不做流控，所以不care，用户不设置 |
| 31:29 | Undefined |  |  |
| 28 | LLP_SRC_EN | 用户设置开启source link list |  |
| 27 | LLP_DST_EN |  | 用户可以自己设置，但是建议不要设，因为Destination是FIFO |
| 26:25 | Undefined (SMS) |  | AXI不用设置 |
| 24:23 | Undefined (DMS) |  | AXI不用设置 |
| 22:20 | TT_FC |  | 3'b100 (PtoM, SRC as FC)，RDC定死了，不能改，不用设置 |
| 19 | WRNP_EN |  | wiki上为not care，因为用的是AXI，而非OCP，不用设置 |
| 18 | DST_SCATTER_EN |  | wiki上为not exist，不用设置 |
| 17 | SRC_GATHER_EN |  | wiki上为not exist，不用设置 |
| 16:14 | SRC_MSIZE | 用户设置source msize |  |
| 13:11 | DEST_MSIZE | 用户设置destination msize<=src_msize |  |
| 10:9 | SINC | 用户设置source increment方式 |  |
| 8:7 | DINC |  | wiki上固定了为fixed，不用设置 |
| 6:4 | SRC_TR_WIDTH | 用户设置source transfer width,且要求DMA source address必须以SRC_TR_WIDTH对齐，否则可能会产生传输错误 |  |
| 3:1 | DST_TR_WIDTH |  | wiki上固定为32bit，不用设置 |
| 0 | INT_EN |  | wiki上固定为enable，不用设置 |

### 表格 9

| 63:51 | Undefined |  |  |
| 50 | Extended DEST_PER2 |  | 最大16个channel，因此handshake分配给channel时4bit就够了，不用再extended了，不用设置 |
| 49 | Extended SRC_PER2 |  | 最大16个channel，因此handshake分配给channel时4bit就够了，不用再extended了，不用设置 |
| 48 | Extended DEST_PER1 |  | 最大16个channel，因此handshake分配给channel时4bit就够了，不用再extended了，不用设置 |
| 47 | Extended SRC_PER1 |  | 最大16个channel，因此handshake分配给channel时4bit就够了，不用再extended了，不用设置 |
| b:43 | DEST_PER |  | destination端没有handshake，所以不分配（wiki not care），不用设置 |
| b:39 | SRC_PER |  | 硬件定为0，将hardware handshake分配给channel0的source side（与实际情况相反），不用设置 |
| 38 | Undefined(SS_UPD_EN) |  | SPEC中注明 function not support，不用设置 |
| 37 | Undefined(DS_UPD_EN) |  | SPEC中注明 function not support，不用设置 |
| 36 | Undefined |  |  |
| 35 | PROTCTL |  | secure DMA transfer没有使用（wiki not use），不用设置 |
| 34 | Undefined |  |  |
| 33 | FIFO_MODE |  | wiki上标注为ON，根据RDC的描述，表示1。此时burst legth的最大值等于FIFO深度（FIFO一半深度）和MSIZE之间的最小值，否则的话，burst length的长度将被固定为1，不用设置 |
| 32 | FCMODE |  | display 里的dmac 应该tt_fc只设定=3'b100，所以fcmode 是don't care，fcmode 只在dst 作fc的时候有效（wiki上说的是not care），不用设置 |
| 31 | RELOAD_DST | multi-block时destination端是否设置为auto-reloaded |  |
| 30 | RELOAD_SRC | multi-block时source端是否设置为auto-reloaded |  |
| 29:20 | MAX_ABRST |  | wiki上说的是not use，不用设置 |
| 19 | SRC_HS_POL | 设置高电平有效 |  |
| 18 | DST_HS_POL |  | wiki上说的是not care，不用设置 |
| 17 | Undefined |  |  |
| 16 | Undefined |  |  |
| 15:14 | Undefined |  |  |
| 13:12 | Undefined |  |  |
| 11 | HS_SEL_SRC | 目前为hardware的handshake，不支持software handshake，设置为0 |  |
| 10 | HS_SEL_DST |  | wiki上标注为not care，不用设置 |
| 9 | FIFO_EMPTY | 只读寄存器 |  |
| 8 | CH_SUSP | 在suspend-cancel流程中使用 |  |
| 7:4 | CH_PRIOR |  | wiki上标注为not care，不用设置 |
| 3 | Undefined |  |  |
| 2 | DST_PCTL_OVER | 只读寄存器 |  |
| 1 | SRC_PCTL_OVER | 只读寄存器 |  |
| 0 | INACTIVE | 只读寄存器，在suspend-cancel流程中关注使用 |  |

### 表格 10

| Signal | Description |
| spi_sclk | Serial bit-rate clock signal. Generated by SPIC.
高电平有效 |
| spi_csn | Chip Select of SPI Flash
低电平有效，与spi_clk同步 |
| spi_sout[3:0] | Data output of SPI Flash.
高电平有效，与spi_clk同步 |
| spi_sin[3:0] | Data in of SPI Flash. The combined pins are usually {holdn, wpn, so, si}.
高电平有效，与spi_clk同步 |
| spi_dcx | Data or Command of SPI Flash
高电平为Data，低电平为Command。与spi_clk同步 |
| spi_wen_out | Write protect input of SPI Flash. The value is controlled by CTRLR2[1].
低电平有效，异步信号（当前应用场景下PSRAM，不会使用此signal，直接悬空） |
| spi_holdn_out | Hold input of SPI Flash. It's constant value:1.
低电平有效，异步信号（当前应用场景下PSRAM，不会使用此signal，直接悬空） |

### 表格 11

| phase | interface | Command | Address | RGB data |
| Length |  | 1 bytes | 3 bytes | 0~n |
| SPI Data lane(channel number) | DBI-C | 1 | 1 | 1 |
| SPI Data lane(channel number) | QSPI-114 | 1 | 1 | 4 |
| SPI Data lane(channel number) | QSPI-144 | 1 | 4 | 4 |
| SPI Data lane(channel number) | OPI-118 | 1 | 1 | 8 |
| SPI Data lane(channel number) | OPI-188 | 1 | 8 | 8 |

### 表格 12

| Interface Signal | I/O | DPI/eDPI | function description |
| dpipclk | O | DPI || eDPI | 输出的pixel clock signal |
| dpivysnc_edpiwms | O | eDPI | write memory start signal （高电平有效）
(此信号在Video mode时作为dpivysnc,而在Adapted Command Mode时作为edpiwms) |
| dpihsync | O | DPI || eDPI | Horizontal Synchronism Signal（有效电平可设置） |
| dpipixdata | O | DPI || eDPI | Video data. 每个Pixel Clock传递1个Pixel data(位宽为60bit或30bit)，[(DSI_HOST_PIXELDATAWIDTH-1):0] |
| dpidataen | O | DPI || eDPI | Video data enable signal（有效电平可设置）
注：在eDPI后面接DW DSI时，如果运行在video mode，则dpidataen支持active high/low；如果运行在adapted command mode，则仅支持active high。 |
| dpishutdn | O | DPI || eDPI | Control Signal. It is used to shut down the display.（有效电平可设置） |
| dpicolorm | O | DPI || eDPI | Control Signal. It is used to switch between normal color and reduced color mode.（有效电平可设置） |
| dpiupdatecfg | O | DPI || eDPI | Control Signal. This signal is used to indicate that the next frame will have new video configuration.（高电平有效） |
| tear_request | O | eDPI | Activate Tearing Effect by Hardware（高电平有效） |
| edpihalt | I | DPI || eDPI | Halt Indication on Video Interface.（高点平有效） |
| edpite | I | eDPI | Tearing Effect Indication.（高电平有效） |

### 表格 13

| HSW=1 | HBP=1 | HFP=1 |
| VSW=3 | VBP=2 | VFP=1 |
| 屏幕有效宽度4 | 屏幕有效宽度4 | 屏幕有效宽度4 |
| 屏幕有效高度4 | 屏幕有效高度4 | 屏幕有效高度4 |

### 表格 14

| Interface Signal | I/O | DPI/eDPI | function description |
| dpipclk | O | DPI || eDPI | 输出的pixel clock signal |
| dpivysnc_edpiwms | O | eDPI | write memory start signal （高电平有效）
(此信号在Video mode时作为dpivysnc) |
| dpihsync | O | DPI || eDPI | Horizontal Synchronism Signal（有效电平可设置） |
| dpipixdata | O | DPI || eDPI | Video data. 每个Pixel Clock传递1个Pixel data(位宽为60bit或30bit)，[(DSI_HOST_PIXELDATAWIDTH-1):0] |
| dpidataen | O | DPI || eDPI | Video data enable signal（有效电平可设置） |
| dpishutdn | O | DPI || eDPI | Control Signal. It is used to shut down the display.（有效电平可设置） |
| dpicolorm | O | DPI || eDPI | Control Signal. It is used to switch between normal color and reduced color mode.（有效电平可设置） |

### 表格 15

| Group0 | Kevin原本设置的Group保留 | Kevin原本设置的Group保留 |  |  |  |  |  |  |
| Group1 | 0 | lanebyteclk | Group2 | 0 | lanebyteclk | Group3 | 0 | lanebyteclk |
| Group1 | 1 | txclkesc | Group2 | 1 | txclkesc | Group3 | 1 | txclkesc |
| Group1 | 2 | txlpdtesc | Group2 | 2 | txrequestesc | Group3 | 2 | rxclkesc |
| Group1 | 3 | txreadyesc | Group2 | 3 | txreadyesc | Group3 | 3 | txrequestesc |
| Group1 | 4 | txdataesc[0] | Group2 | 4 | txvalidesc | Group3 | 4 | txlpdtesc |
| Group1 | 5 | txdataesc[1] | Group2 | 5 | txdataesc[0] | Group3 | 5 | txreadyesc |
| Group1 | 6 | txdataesc[2] | Group2 | 6 | txdataesc[1] | Group3 | 6 | l1txrequestdatahs |
| Group1 | 7 | txdataesc[3] | Group2 | 7 | txdataesc[2] | Group3 | 7 | l1txreadyhs |
| Group1 | 8 | txdataesc[4] | Group2 | 8 | txdataesc[3] | Group3 | 8 | l0txrequestdatahs |
| Group1 | 9 | txdataesc[5] | Group2 | 9 | txdataesc[4] | Group3 | 9 | l0txreadyhs |
| Group1 | 10 | txdataesc[6] | Group2 | 10 | txdataesc[5] | Group3 | 10 | txrequestclkhs |
| Group1 | 11 | txdataesc[7] | Group2 | 11 | txdataesc[6] | Group3 | 11 | txulpsclk |
| Group1 | 12 | l0txrequestdatahs | Group2 | 12 | txdataesc[7] | Group3 | 12 | txulpsclkexit |
| Group1 | 13 | l0txreadyhs | Group2 | 13 | txtriggeresc[0] | Group3 | 13 | phyulpsactivenotclk |
| Group1 | 14 | l0txdatahs[0] | Group2 | 14 | txtriggeresc[1] | Group3 | 14 | phystopstateclklane |
| Group1 | 15 | l0txdatahs[1] | Group2 | 15 | txtriggeresc[2] | Group3 | 15 | txulpsesc0lane |
| Group1 | 16 | l0txdatahs[2] | Group2 | 16 | txtriggeresc[3] | Group3 | 16 | txulpsexit0lane |
| Group1 | 17 | l0txdatahs[3] | Group2 | 17 | rxclkesc | Group3 | 17 | ulpsactivenot0lane |
| Group1 | 18 | l0txdatahs[4] | Group2 | 18 | rxlpdtesc | Group3 | 18 | phystopstate0lane |
| Group1 | 19 | l0txdatahs[5] | Group2 | 19 | rxvalidesc | Group3 | 19 | rxulpsesc0lane |
| Group1 | 20 | l0txdatahs[6] | Group2 | 20 | rxtriggeresc[0] | Group3 | 20 | txrequestesc1lane |
| Group1 | 21 | l0txdatahs[7] | Group2 | 21 | rxtriggeresc[1] | Group3 | 21 | txulpsexit1lane |
| Group1 | 22 | l1txrequestdatahs | Group2 | 22 | rxtriggeresc[2] | Group3 | 22 | txulpsesc1lane |
| Group1 | 23 | l1txreadyhs | Group2 | 23 | rxtriggeresc[3] | Group3 | 23 | rxulpsesc1lane |
| Group1 | 24 | l1txdatahs[0] | Group2 | 24 | rxdataesc[0] | Group3 | 24 | phystopstate1lane |
| Group1 | 25 | l1txdatahs[1] | Group2 | 25 | rxdataesc[1] | Group3 | 25 | ulpsactivenot1lane |
| Group1 | 26 | l1txdatahs[2] | Group2 | 26 | rxdataesc[2] | Group3 | 26 | phyturnrequest |
| Group1 | 27 | l1txdatahs[3] | Group2 | 27 | rxdataesc[3] | Group3 | 27 | phydirection |
| Group1 | 28 | l1txdatahs[4] | Group2 | 28 | rxdataesc[4] | Group3 | 28 | phylock |
| Group1 | 29 | l1txdatahs[5] | Group2 | 29 | rxdataesc[5] | Group3 | 29 | physhutdownz |
| Group1 | 30 | l1txdatahs[6] | Group2 | 30 | rxdataesc[6] | Group3 | 30 | phyrstz |
| Group1 | 31 | l1txdatahs[7] | Group2 | 31 | rxdataesc[7] | Group3 | 31 | phyforcepll |

