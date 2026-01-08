# 第一个示例

```c
#include "display.h"

int main(void) {
    display_init();
    display_clear();
    display_text(0, 0, "Hello Display!");
    return 0;
}
```
