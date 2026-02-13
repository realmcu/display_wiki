# Display Wiki 导航栏拖拽功能配置完成

## 已完成的修改

### 1. 配置文件修改 (`doc/conf.py`)

#### 添加 html_context
```python
html_context = {
    'current_year': datetime.now().year,
    "show_sphinx": False,
    # 左侧目录栏的拖拽宽度配置
    "left_nav_width": "docs.displaywiki.sidebar.width",
}
```

#### 修改 html_theme_options
- `collapse_navigation`: True → **False** (允许目录折叠)
- `navigation_depth`: 10 → **4** (限制目录深度，避免全部展开)

#### 添加 custom.js
```python
html_js_files = [
    'js/pdf-viewer.js',
    'js/custom.js',  # 新增
]
```

### 2. JavaScript 文件 (`doc/_static/js/custom.js`)

创建了拖拽功能实现：
- 左侧导航栏可通过拖拽 `||` 符号调整宽度
- 宽度限制：200px - 800px
- 使用 localStorage 保存用户设置的宽度
- 响应式设计：小屏幕自动禁用拖拽

### 3. CSS 文件修改 (`doc/_static/css/custom.css`)

删除了强制展开目录的规则：
```css
/* 已删除 */
.always-expand-toc button::before {
    content: "\f147" !important;
}
```

## 功能特性

### 左侧导航栏拖拽
- **拖拽手柄**：右侧边缘显示 `||` 符号
- **宽度范围**：200px - 800px
- **持久化**：宽度保存在浏览器 localStorage
- **响应式**：窗口大小变化时自动适配

### 目录折叠
- **默认状态**：一级目录展开，子目录折叠
- **点击展开**：点击目录项前的箭头图标展开/折叠
- **深度限制**：最多显示 4 层目录

## 使用方法

### 调整导航栏宽度
1. 将鼠标移到左侧导航栏右边缘
2. 看到 `||` 符号和鼠标变为 `↔` 时
3. 按住鼠标左键拖动
4. 释放鼠标，宽度自动保存

### 折叠/展开目录
- 点击目录项前的 `▶` 或 `▼` 图标
- 展开：`▶` → `▼`
- 折叠：`▼` → `▶`

## 技术实现

### 配置传递
```javascript
// conf.py 中定义
html_context = {
    "left_nav_width": "docs.displaywiki.sidebar.width"
}

// custom.js 中读取
var leftNavWidth = window.html_context && window.html_context.left_nav_width 
    ? window.html_context.left_nav_width 
    : 'docs.displaywiki.sidebar.width';
```

### 宽度存储
```javascript
// 保存
localStorage.setItem(local_left_nav_width, newWidth);

// 读取
let leftSiderBarWidth = localStorage.getItem(local_left_nav_width);
```

## 测试验证

### 构建文档
```bash
cd /home/wh/workspace/display_wiki
rm -rf site/*
source .venv/bin/activate
sphinx-build -b html doc site
```

### 启动服务器
```bash
./serve.sh -p 8080
# 或
python3 -m http.server 8080 --directory site
```

### 访问地址
- 本机：http://localhost:8080
- 局域网：http://<本机IP>:8080

## 参考项目

配置参考了 HoneyGUI 项目 (`/home/wh/.HoneyGUI/doc/`)：
- `conf_common.py` - html_context 配置
- `_static/css/custom.css` - 拖拽手柄样式
- `_static/js/custom.js` - 拖拽功能实现

## 注意事项

1. **浏览器兼容性**：需要支持 localStorage 和 jQuery
2. **移动端**：小于 768px 宽度时自动禁用拖拽
3. **清除缓存**：如需重置宽度，清除浏览器 localStorage
4. **重新构建**：修改配置后需重新构建文档才能生效

## 后续优化建议

1. 添加右侧内容目录拖拽（参考 HoneyGUI 的 `addRightContentSlider`）
2. 添加双击重置宽度功能
3. 添加拖拽时的视觉反馈（如半透明遮罩）
4. 支持触摸设备的拖拽操作
