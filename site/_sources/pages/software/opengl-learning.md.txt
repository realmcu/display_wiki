# OpenGL 可编程管线学习笔记

## OpenGL 渲染流程总览

```{mermaid}
graph LR
    subgraph CPU["CPU 端准备"]
        A[着色器编译]
        B[矩阵计算 MVP]
        C[VBO 上传顶点]
        D[纹理上传]
        E[Uniform 设置]
    end
    
    subgraph GPU["GPU 渲染管线"]
        F[顶点着色器]
        G[光栅化插值]
        H[片段着色器]
        I[帧缓冲]
    end
    
    CPU --> F
    F --> G
    G --> H
    H --> I
    I --> J[屏幕]
    
    style CPU fill:#ffe6e6
    style GPU fill:#e6f3ff
    style J fill:#fff4e6
```

**数据流**: CPU 准备数据 → GPU 顶点处理 → 光栅化 → 像素着色 → 屏幕显示

**5 个学习步骤对应**:
1. 着色器编译 (`glCompileShader`)
2. Uniform 设置 (`glUniform*`)
3. 矩阵计算 (MVP = Projection × View × Model)
4. VBO 上传 (`glBufferData`)
5. 纹理上传 (`glTexImage2D`)

---

## 学习路线

| 步骤 | 主题 | 作用 | 状态 |
|------|------|------|------|
| 1 | 最简单的着色器 | 理解顶点和片段着色器的基本结构，实现从固定管线到可编程管线的转变 | ✅ 完成 |
| 2 | Uniform 变量 | 学习从 CPU 向 GPU 传递参数(如矩阵、颜色、时间)，实现动态控制渲染效果 | ✅ 完成 |
| 3 | 自定义矩阵 (摆脱 gluPerspective) | 掌握投影和变换矩阵的数学原理，完全控制 3D 空间到 2D 屏幕的映射 | ✅ 完成 |
| 4 | VBO 顶点缓冲 (摆脱 glBegin/glEnd) | 使用现代 GPU 缓冲机制，大幅提升渲染性能，支持大规模顶点数据 | ✅ 完成 |
| 5 | 纹理映射 | 为 3D 模型贴图，实现真实感渲染，学习纹理坐标和采样器的使用 | ✅ 完成 |

---

## 第一步: 最简单的着色器

### 什么是着色器？

着色器是运行在 GPU 上的小程序，用于控制顶点和像素的处理。

### 固定管线 vs 可编程管线

**固定管线** (OpenGL 1.x):
```
glVertex3fv() ──→ [GPU内部固定算法] ──→ 屏幕像素
                  (你无法修改)
```

**可编程管线** (OpenGL 2.0+):
```
glVertex3fv() ──→ [你写的着色器代码] ──→ 屏幕像素
                  (完全可控)
```

### 最简单的顶点着色器

```glsl
void main()
{
    // 将顶点从模型空间变换到裁剪空间
    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
}
```

**输入**: `gl_Vertex` (顶点位置)  
**输出**: `gl_Position` (裁剪空间坐标)

### 最简单的片段着色器

```glsl
void main()
{
    // 为每个像素设置固定颜色 (橙色)
    gl_FragColor = vec4(1.0, 0.5, 0.2, 1.0);
}
```

**输出**: `gl_FragColor` (RGBA 颜色)

### 着色器编译流程

```c
// 顶点着色器源代码
const char* vertex_src = 
    "void main() {"
    "    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;"
    "}";

// 片段着色器源代码
const char* fragment_src = 
    "void main() {"
    "    gl_FragColor = vec4(1.0, 0.5, 0.2, 1.0);"
    "}";

// 1. 创建着色器对象
GLuint vs = glCreateShader(GL_VERTEX_SHADER);
GLuint fs = glCreateShader(GL_FRAGMENT_SHADER);

// 2. 设置源代码
glShaderSource(vs, 1, &vertex_src, NULL);
glShaderSource(fs, 1, &fragment_src, NULL);

// 3. 编译
glCompileShader(vs);
glCompileShader(fs);

// 4. 检查编译错误 (可选但推荐)
GLint success;
glGetShaderiv(vs, GL_COMPILE_STATUS, &success);
if (!success) {
    char log[512];
    glGetShaderInfoLog(vs, 512, NULL, log);
    fprintf(stderr, "Vertex shader compilation failed: %s\n", log);
}

// 5. 创建程序并链接
GLuint program = glCreateProgram();
glAttachShader(program, vs);
glAttachShader(program, fs);
glLinkProgram(program);

// 6. 检查链接错误
glGetProgramiv(program, GL_LINK_STATUS, &success);
if (!success) {
    char log[512];
    glGetProgramInfoLog(program, 512, NULL, log);
    fprintf(stderr, "Program linking failed: %s\n", log);
}

// 7. 使用着色器程序
glUseProgram(program);

// 8. 清理 (着色器对象可以删除，程序对象保留)
glDeleteShader(vs);
glDeleteShader(fs);
```

### 完整示例

```c
void render()
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    // 使用着色器程序
    glUseProgram(program);
    
    // 绘制三角形 (使用立即模式演示)
    glBegin(GL_TRIANGLES);
    glVertex3f(-0.5f, -0.5f, 0.0f);
    glVertex3f( 0.5f, -0.5f, 0.0f);
    glVertex3f( 0.0f,  0.5f, 0.0f);
    glEnd();
}
```

### 关键收获

- ✅ 理解顶点着色器和片段着色器的分工
- ✅ 掌握着色器编译和链接流程
- ✅ 从固定管线过渡到可编程管线
- ✅ 学会检查编译和链接错误

---

## 第二步: Uniform 变量

### 什么是 Uniform？

Uniform 是从 CPU 传递给 GPU 的全局变量，在一次绘制调用中对所有顶点和像素保持不变。

### 变量类型对比

| 类型 | 来源 | 特点 | 示例 |
|------|------|------|------|
| **Attribute** | `glVertex*()` | 每个顶点不同 | 位置、法线、UV |
| **Uniform** | `glUniform*()` | 全局共享 | 矩阵、光源、时间 |
| **Varying** | 顶点着色器输出 | GPU 自动插值 | 传递法线、颜色 |

### 使用流程

#### 1. 在着色器中声明

**顶点着色器**:
```glsl
uniform mat4 uMVP;  // 模型视图投影矩阵

void main()
{
    gl_Position = uMVP * gl_Vertex;
}
```

**片段着色器**:
```glsl
uniform vec3 uLightDir;  // 光源方向
uniform vec3 uColor;     // 物体颜色

varying vec3 vNormal;    // 从顶点着色器传来的法线

void main()
{
    vec3 N = normalize(vNormal);
    vec3 L = normalize(uLightDir);
    float diff = max(dot(N, L), 0.0);  // 漫反射
    
    vec3 ambient = vec3(0.2);  // 环境光
    vec3 lighting = ambient + diff * vec3(1.0);
    
    gl_FragColor = vec4(uColor * lighting, 1.0);
}
```

#### 2. 在 CPU 端获取位置

```c
GLuint program = /* 已编译链接的程序 */;

// 获取 Uniform 变量的位置
GLint loc_mvp = glGetUniformLocation(program, "uMVP");
GLint loc_light = glGetUniformLocation(program, "uLightDir");
GLint loc_color = glGetUniformLocation(program, "uColor");

// 检查是否找到
if (loc_mvp == -1) {
    fprintf(stderr, "Warning: uniform 'uMVP' not found\n");
}
```

#### 3. 设置值

```c
void render()
{
    glUseProgram(program);
    
    // 设置矩阵 (4x4 float 矩阵)
    float mvp[16] = { /* ... */ };
    glUniformMatrix4fv(loc_mvp, 1, GL_FALSE, mvp);
    
    // 设置光源方向 (vec3)
    glUniform3f(loc_light, 1.0f, 1.0f, 2.0f);
    
    // 设置颜色 (vec3)
    glUniform3f(loc_color, 1.0f, 0.5f, 0.2f);
    
    // 绘制...
}
```

### 示例: 动态旋转光源

```c
GLint g_loc_light;
int g_frame = 0;

void init()
{
    // 编译着色器...
    g_loc_light = glGetUniformLocation(program, "uLightDir");
}

void render()
{
    glUseProgram(program);
    
    // 光源绕 Y 轴旋转
    float angle = g_frame * 0.02f;
    float lx = cosf(angle) * 2.0f;
    float lz = sinf(angle) * 2.0f;
    glUniform3f(g_loc_light, lx, 1.0f, lz);
    
    // 绘制模型...
    
    g_frame++;
}
```

### Uniform 类型速查

| 函数 | GLSL 类型 | 参数 |
|------|-----------|------|
| `glUniform1f(loc, v)` | `float` | 1 个 float |
| `glUniform2f(loc, x, y)` | `vec2` | 2 个 float |
| `glUniform3f(loc, x, y, z)` | `vec3` | 3 个 float |
| `glUniform4f(loc, x, y, z, w)` | `vec4` | 4 个 float |
| `glUniform1i(loc, v)` | `int` / `sampler2D` | 1 个 int |
| `glUniformMatrix4fv(loc, n, transpose, m)` | `mat4` | 4x4 矩阵 |

### 完整示例: 带光照的三角形

```c
// 顶点着色器
const char* vs_src = 
    "uniform mat4 uMVP;"
    "varying vec3 vNormal;"
    "void main() {"
    "    gl_Position = uMVP * gl_Vertex;"
    "    vNormal = gl_NormalMatrix * gl_Normal;"
    "}";

// 片段着色器
const char* fs_src = 
    "uniform vec3 uLightDir;"
    "varying vec3 vNormal;"
    "void main() {"
    "    vec3 N = normalize(vNormal);"
    "    vec3 L = normalize(uLightDir);"
    "    float diff = max(dot(N, L), 0.0);"
    "    vec3 color = vec3(1.0, 0.5, 0.2) * (0.2 + diff);"
    "    gl_FragColor = vec4(color, 1.0);"
    "}";

void render()
{
    glUseProgram(program);
    
    // 设置 MVP 矩阵
    float mvp[16];
    glGetFloatv(GL_MODELVIEW_PROJECTION_MATRIX, mvp);
    glUniformMatrix4fv(loc_mvp, 1, GL_FALSE, mvp);
    
    // 设置光源
    glUniform3f(loc_light, 1.0f, 1.0f, 2.0f);
    
    // 绘制
    glBegin(GL_TRIANGLES);
    glNormal3f(0.0f, 0.0f, 1.0f);
    glVertex3f(-0.5f, -0.5f, 0.0f);
    glVertex3f( 0.5f, -0.5f, 0.0f);
    glVertex3f( 0.0f,  0.5f, 0.0f);
    glEnd();
}
```

### 关键收获

- ✅ 理解 CPU 和 GPU 的数据传递机制
- ✅ 掌握 Uniform 变量的声明、获取和设置
- ✅ 实现动态光照效果
- ✅ 理解 Attribute、Uniform、Varying 的区别

---

## 第三步: 自定义矩阵

### 为什么要自己实现矩阵？

**固定管线函数的问题**:
- `gluPerspective` / `gluLookAt` 是固定管线遗留 API
- 现代 OpenGL (3.0+) 已废弃这些函数
- 不理解数学原理，无法灵活控制

### 矩阵变换流程

```
顶点坐标变换:
  模型空间 ──Model──→ 世界空间 ──View──→ 相机空间 ──Projection──→ 裁剪空间
  (0,0,0)            (场景中心)        (相机视角)          (屏幕坐标)

MVP 矩阵 = Projection × View × Model
```

### 1. 透视投影矩阵 (Perspective)

**作用**: 实现"近大远小"的透视效果

**数学公式**:
```
f = 1 / tan(fov_y / 2)

┌                                          ┐
│ f/aspect    0         0            0     │
│    0        f         0            0     │
│    0        0   -(f+n)/(f-n)  -2fn/(f-n) │
│    0        0        -1            0     │
└                                          ┘
```

**参数**:
- `fov_y`: 垂直视野角度 (如 45°)
- `aspect`: 宽高比 (width / height)
- `near`: 近裁剪面 (如 0.1)
- `far`: 远裁剪面 (如 100.0)

**代码实现**:
```c
typedef float mat4[16];  // 列主序存储

void mat4_perspective(mat4 m, float fov_y, float aspect, float near, float far)
{
    float f = 1.0f / tanf(fov_y / 2.0f);
    
    memset(m, 0, sizeof(mat4));
    m[0]  = f / aspect;
    m[5]  = f;
    m[10] = -(far + near) / (far - near);
    m[11] = -1.0f;
    m[14] = -(2.0f * far * near) / (far - near);
}
```

### 2. 视图矩阵 (LookAt)

**作用**: 定义相机的位置和朝向

**数学原理**:
1. 计算相机坐标系的三个轴
   - `forward = normalize(center - eye)` (相机朝向)
   - `right = normalize(forward × up)` (相机右向)
   - `up' = right × forward` (相机上向)

2. 构建旋转 + 平移矩阵

**代码实现**:
```c
// 向量归一化
void normalize(float v[3])
{
    float len = sqrtf(v[0]*v[0] + v[1]*v[1] + v[2]*v[2]);
    v[0] /= len; v[1] /= len; v[2] /= len;
}

// 向量点积
float dot(const float a[3], const float b[3])
{
    return a[0]*b[0] + a[1]*b[1] + a[2]*b[2];
}

void mat4_look_at(mat4 m, float eye[3], float center[3], float up[3])
{
    // 计算 forward 向量
    float f[3] = {
        center[0] - eye[0],
        center[1] - eye[1],
        center[2] - eye[2]
    };
    normalize(f);
    
    // right = forward × up
    float r[3] = {
        f[1] * up[2] - f[2] * up[1],
        f[2] * up[0] - f[0] * up[2],
        f[0] * up[1] - f[1] * up[0]
    };
    normalize(r);
    
    // up' = right × forward
    float u[3] = {
        r[1] * f[2] - r[2] * f[1],
        r[2] * f[0] - r[0] * f[2],
        r[0] * f[1] - r[1] * f[0]
    };
    
    // 构建矩阵 (旋转 + 平移)
    memset(m, 0, sizeof(mat4));
    m[0] = r[0];  m[4] = r[1];  m[8]  = r[2];
    m[1] = u[0];  m[5] = u[1];  m[9]  = u[2];
    m[2] = -f[0]; m[6] = -f[1]; m[10] = -f[2];
    m[12] = -dot(r, eye);
    m[13] = -dot(u, eye);
    m[14] = dot(f, eye);
    m[15] = 1.0f;
}
```

### 3. 模型矩阵 (Model)

**旋转矩阵** (绕任意轴):
```c
void mat4_rotate(mat4 m, float angle, float x, float y, float z)
{
    // 归一化旋转轴
    float len = sqrtf(x*x + y*y + z*z);
    x /= len; y /= len; z /= len;
    
    float c = cosf(angle);
    float s = sinf(angle);
    float t = 1.0f - c;
    
    // Rodrigues 旋转公式
    memset(m, 0, sizeof(mat4));
    m[0] = t*x*x + c;     m[4] = t*x*y - s*z;   m[8]  = t*x*z + s*y;
    m[1] = t*x*y + s*z;   m[5] = t*y*y + c;     m[9]  = t*y*z - s*x;
    m[2] = t*x*z - s*y;   m[6] = t*y*z + s*x;   m[10] = t*z*z + c;
    m[15] = 1.0f;
}
```

**单位矩阵**:
```c
void mat4_identity(mat4 m)
{
    memset(m, 0, sizeof(mat4));
    m[0] = m[5] = m[10] = m[15] = 1.0f;
}
```

### 4. 矩阵乘法

**注意**: OpenGL 使用**列主序**存储

```c
void mat4_multiply(mat4 result, const mat4 a, const mat4 b)
{
    mat4 temp;
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            temp[i*4 + j] = 0;
            for (int k = 0; k < 4; k++) {
                temp[i*4 + j] += a[k*4 + j] * b[i*4 + k];
            }
        }
    }
    memcpy(result, temp, sizeof(mat4));
}
```

### 完整示例

```c
mat4 g_proj, g_view, g_model, g_mvp;
GLint g_loc_mvp;
float g_angle = 0.0f;

void init()
{
    // 编译着色器...
    g_loc_mvp = glGetUniformLocation(program, "uMVP");
    
    // 构建投影矩阵 (只需初始化一次)
    float aspect = (float)width / height;
    mat4_perspective(g_proj, 45.0f * M_PI / 180.0f, aspect, 0.1f, 100.0f);
    
    // 构建视图矩阵 (相机位置)
    float eye[3] = {0, 0, 3};
    float center[3] = {0, 0, 0};
    float up[3] = {0, 1, 0};
    mat4_look_at(g_view, eye, center, up);
}

void render()
{
    glUseProgram(program);
    
    // 构建模型矩阵 (每帧旋转)
    mat4_rotate(g_model, g_angle, 0, 1, 0);
    g_angle += 0.01f;
    
    // 组合 MVP = Projection × View × Model
    mat4 modelview;
    mat4_multiply(modelview, g_view, g_model);
    mat4_multiply(g_mvp, g_proj, modelview);
    
    // 传递给着色器
    glUniformMatrix4fv(g_loc_mvp, 1, GL_FALSE, g_mvp);
    
    // 绘制...
}
```

### 着色器改动

**旧版** (使用固定管线):
```glsl
void main() {
    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
}
```

**新版** (使用自定义 Uniform):
```glsl
uniform mat4 uMVP;
void main() {
    gl_Position = uMVP * gl_Vertex;
}
```

### 关键收获

- ✅ 理解坐标变换: 模型空间 → 世界空间 → 相机空间 → 裁剪空间
- ✅ 掌握投影、视图、旋转矩阵的构建
- ✅ 理解矩阵乘法和列主序存储
- ✅ 摆脱固定管线函数，完全控制变换

---

## 第四步: VBO 顶点缓冲

### 为什么需要 VBO？

**立即模式的问题** (glBegin/glEnd):
```c
// 每帧都要执行，740 个顶点 = 2220 次函数调用
glBegin(GL_TRIANGLES);
for (int i = 0; i < 740; i++) {
    glNormal3fv(...);   // CPU → GPU
    glVertex3fv(...);   // CPU → GPU
    glVertex3fv(...);   // CPU → GPU
}
glEnd();
```

- ❌ 每帧从 CPU 传输数据到 GPU
- ❌ 函数调用开销巨大
- ❌ 数据在 CPU 内存，GPU 访问慢
- ❌ OpenGL 3.0+ 已废弃

**VBO 的优势**:
```c
// 初始化时执行一次
glGenBuffers(1, &vbo);
glBufferData(GL_ARRAY_BUFFER, size, data, GL_STATIC_DRAW);

// 每帧只需一次调用
glDrawArrays(GL_TRIANGLES, 0, vertex_count);
```

- ✅ 数据存储在 GPU 显存
- ✅ 只上传一次，重复使用
- ✅ 一次调用绘制所有顶点
- ✅ 现代 OpenGL 标准

### 数据流对比

```
立即模式:
  CPU 内存 ──每帧──→ GPU
  (慢，重复传输)

VBO 模式:
  CPU 内存 ──初始化──→ GPU 显存
                        ↓
                   每帧直接读取
  (快，零拷贝)
```

### 实现步骤

#### 1. 数据准备 - 展开面索引

```c
// OBJ 文件数据
float vertices[740][3];  // 740 个顶点
int faces[1476][3];      // 1476 个三角形

// 展开为顶点数组 (每个三角形 3 个顶点)
int total_vertices = face_count * 3;  // 1476 * 3 = 4428
float* positions = malloc(total_vertices * 3 * sizeof(float));
float* normals = malloc(total_vertices * 3 * sizeof(float));

int idx = 0;
for (int i = 0; i < face_count; i++) {
    for (int j = 0; j < 3; j++) {
        int v_idx = faces[i][j];
        
        // 复制顶点位置
        positions[idx * 3 + 0] = vertices[v_idx][0];
        positions[idx * 3 + 1] = vertices[v_idx][1];
        positions[idx * 3 + 2] = vertices[v_idx][2];
        
        // 复制法线 (面法线，三个顶点共享)
        normals[idx * 3 + 0] = face_normals[i][0];
        normals[idx * 3 + 1] = face_normals[i][1];
        normals[idx * 3 + 2] = face_normals[i][2];
        
        idx++;
    }
}
```

#### 2. 创建 VBO - 上传到 GPU

```c
GLuint vbo_position, vbo_normal;

// 创建位置 VBO
glGenBuffers(1, &vbo_position);
glBindBuffer(GL_ARRAY_BUFFER, vbo_position);
glBufferData(GL_ARRAY_BUFFER, 
             total_vertices * 3 * sizeof(float),
             positions, 
             GL_STATIC_DRAW);  // 静态数据，不会修改

// 创建法线 VBO
glGenBuffers(1, &vbo_normal);
glBindBuffer(GL_ARRAY_BUFFER, vbo_normal);
glBufferData(GL_ARRAY_BUFFER, 
             total_vertices * 3 * sizeof(float),
             normals, 
             GL_STATIC_DRAW);

// 上传后可以释放 CPU 内存
free(positions);
free(normals);
```

#### 3. 渲染时使用 VBO

```c
void render()
{
    glUseProgram(program);
    
    // 设置 Uniform...
    
    // 启用顶点属性数组
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_NORMAL_ARRAY);
    
    // 绑定位置 VBO 并指定数据格式
    glBindBuffer(GL_ARRAY_BUFFER, vbo_position);
    glVertexPointer(3, GL_FLOAT, 0, 0);  // 3 个分量，float 类型，无间隔
    
    // 绑定法线 VBO
    glBindBuffer(GL_ARRAY_BUFFER, vbo_normal);
    glNormalPointer(GL_FLOAT, 0, 0);
    
    // 一次调用绘制所有顶点
    glDrawArrays(GL_TRIANGLES, 0, total_vertices);
    
    // 清理
    glDisableClientState(GL_VERTEX_ARRAY);
    glDisableClientState(GL_NORMAL_ARRAY);
}
```

### 完整示例: 加载 OBJ 并使用 VBO

```c
// 全局变量
GLuint g_vbo_position, g_vbo_normal;
int g_vertex_count = 0;

void load_obj_and_create_vbo(const char* filename)
{
    // 1. 读取 OBJ 文件
    float vertices[10000][3];
    float normals[10000][3];
    int faces[10000][3];
    int vertex_count = 0, normal_count = 0, face_count = 0;
    
    FILE* f = fopen(filename, "r");
    char line[256];
    while (fgets(line, sizeof(line), f)) {
        if (line[0] == 'v' && line[1] == ' ') {
            sscanf(line, "v %f %f %f", 
                   &vertices[vertex_count][0],
                   &vertices[vertex_count][1],
                   &vertices[vertex_count][2]);
            vertex_count++;
        } else if (line[0] == 'v' && line[1] == 'n') {
            sscanf(line, "vn %f %f %f",
                   &normals[normal_count][0],
                   &normals[normal_count][1],
                   &normals[normal_count][2]);
            normal_count++;
        } else if (line[0] == 'f') {
            int v1, v2, v3, n1, n2, n3;
            sscanf(line, "f %d//%d %d//%d %d//%d",
                   &v1, &n1, &v2, &n2, &v3, &n3);
            faces[face_count][0] = v1 - 1;
            faces[face_count][1] = v2 - 1;
            faces[face_count][2] = v3 - 1;
            face_count++;
        }
    }
    fclose(f);
    
    // 2. 展开数据
    g_vertex_count = face_count * 3;
    float* positions = malloc(g_vertex_count * 3 * sizeof(float));
    float* normals_data = malloc(g_vertex_count * 3 * sizeof(float));
    
    int idx = 0;
    for (int i = 0; i < face_count; i++) {
        for (int j = 0; j < 3; j++) {
            int v_idx = faces[i][j];
            memcpy(&positions[idx * 3], vertices[v_idx], 3 * sizeof(float));
            memcpy(&normals_data[idx * 3], normals[0], 3 * sizeof(float));
            idx++;
        }
    }
    
    // 3. 创建 VBO
    glGenBuffers(1, &g_vbo_position);
    glBindBuffer(GL_ARRAY_BUFFER, g_vbo_position);
    glBufferData(GL_ARRAY_BUFFER, g_vertex_count * 3 * sizeof(float),
                 positions, GL_STATIC_DRAW);
    
    glGenBuffers(1, &g_vbo_normal);
    glBindBuffer(GL_ARRAY_BUFFER, g_vbo_normal);
    glBufferData(GL_ARRAY_BUFFER, g_vertex_count * 3 * sizeof(float),
                 normals_data, GL_STATIC_DRAW);
    
    free(positions);
    free(normals_data);
    
    printf("Loaded %d vertices from %s\n", g_vertex_count, filename);
}

void render()
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glUseProgram(program);
    
    // 设置 MVP 矩阵...
    glUniformMatrix4fv(loc_mvp, 1, GL_FALSE, mvp);
    
    // 使用 VBO 绘制
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_NORMAL_ARRAY);
    
    glBindBuffer(GL_ARRAY_BUFFER, g_vbo_position);
    glVertexPointer(3, GL_FLOAT, 0, 0);
    
    glBindBuffer(GL_ARRAY_BUFFER, g_vbo_normal);
    glNormalPointer(GL_FLOAT, 0, 0);
    
    glDrawArrays(GL_TRIANGLES, 0, g_vertex_count);
    
    glDisableClientState(GL_VERTEX_ARRAY);
    glDisableClientState(GL_NORMAL_ARRAY);
}
```

### 性能对比

| 方式 | 函数调用/帧 | 数据传输 | 性能 |
|------|------------|---------|------|
| glBegin/glEnd | 2220 次 | 每帧传输 | 慢 ⚠️ |
| VBO | 1 次 | 初始化时传输一次 | 快 ✅ |

**实测效果** (740 顶点模型):
- 立即模式: ~2220 次 CPU→GPU 调用/帧
- VBO 模式: ~1 次 GPU 内部调用/帧

### 关键 API

| 函数 | 作用 |
|------|------|
| `glGenBuffers(n, &id)` | 创建 VBO |
| `glBindBuffer(target, id)` | 绑定 VBO |
| `glBufferData(target, size, data, usage)` | 上传数据 |
| `glVertexPointer(size, type, stride, ptr)` | 指定顶点格式 |
| `glNormalPointer(type, stride, ptr)` | 指定法线格式 |
| `glDrawArrays(mode, first, count)` | 绘制 |

### 关键收获

- ✅ 理解 VBO 的性能优势
- ✅ 掌握数据展开和上传流程
- ✅ 摆脱立即模式，使用现代 GPU 缓冲
- ✅ 实现高效的大规模顶点渲染

---

## 第五步: 纹理映射

### 什么是纹理映射？

**类比**: 给 3D 模型"贴壁纸"

```
3D 模型 + 2D 图片 = 带纹理的模型
  茶壶     木纹图     木质茶壶
```

### 核心概念

#### 1. 纹理 (Texture)
- 一张存储在 GPU 的图片（像素数组）
- 可以是照片、程序生成的图案、法线贴图等

#### 2. UV 坐标
- 每个顶点附带的 2D 坐标 (u, v)
- 范围 [0, 1]，映射到纹理图片
- (0, 0) = 左下角，(1, 1) = 右上角

```
纹理图片:
  (0,1) ────────── (1,1)
    │               │
    │   图片内容     │
    │               │
  (0,0) ────────── (1,0)
```

#### 3. 纹理采样
- 根据 UV 坐标从纹理中取颜色
- GPU 自动插值：三角形内部的 UV 会平滑过渡

### 工作流程

```
1. CPU 准备数据
   ├─ 纹理图片: 256x256 像素数组
   └─ UV 坐标: 每个顶点的 (u, v) 值

2. 上传到 GPU
   ├─ glTexImage2D() → 图片存入显存
   └─ VBO → UV 坐标存入显存

3. 顶点着色器 (每个顶点)
   输入: 顶点位置 + UV 坐标
   输出: UV 坐标传递给片段着色器

4. 光栅化 (GPU 自动)
   三角形内部的 UV 自动插值
   例: 顶点 UV 为 (0,0) (1,0) (0,1)
       中心像素 UV 自动为 (0.33, 0.33)

5. 片段着色器 (每个像素)
   texture2D(纹理, UV) → 从图片采样颜色
   例: UV=(0.5, 0.5) → 取图片中心的颜色
```

### 实现步骤

#### 1. 生成程序纹理

```c
GLuint g_texture;

void create_checkerboard_texture()
{
    int width = 256, height = 256;
    unsigned char* data = malloc(width * height * 3);
    int grid_size = 16;
    
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            int checker = ((x / grid_size) + (y / grid_size)) % 2;
            unsigned char color = checker ? 255 : 64;  // 白色或深灰
            
            int idx = (y * width + x) * 3;
            data[idx + 0] = color;  // R
            data[idx + 1] = color;  // G
            data[idx + 2] = color;  // B
        }
    }
    
    // 创建纹理对象
    glGenTextures(1, &g_texture);
    glBindTexture(GL_TEXTURE_2D, g_texture);
    
    // 上传数据到 GPU
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, width, height, 0, 
                 GL_RGB, GL_UNSIGNED_BYTE, data);
    
    // 设置过滤模式
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    
    // 设置包裹模式
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    
    free(data);
}
```

**优点**:
- ✅ 无外部文件依赖
- ✅ 代码自包含
- ✅ 棋盘格规律明显，便于调试

#### 2. 解析 UV 坐标

修改 OBJ 加载函数:

```c
float texcoords[10000][2];
int faces_tex[10000][3];
int texcoord_count = 0;

// 读取纹理坐标
if (sscanf(line, "vt %f %f", &u, &v) == 2) {
    texcoords[texcoord_count][0] = u;
    texcoords[texcoord_count][1] = v;
    texcoord_count++;
}

// 读取面（包含纹理索引）
// 格式: f v1/vt1/vn1 v2/vt2/vn2 v3/vt3/vn3
if (sscanf(line, "f %d/%d/%d %d/%d/%d %d/%d/%d",
           &v1, &vt1, &vn1, &v2, &vt2, &vn2, &v3, &vt3, &vn3) == 9) {
    faces[face_count][0] = v1 - 1;
    faces[face_count][1] = v2 - 1;
    faces[face_count][2] = v3 - 1;
    faces_tex[face_count][0] = vt1 - 1;
    faces_tex[face_count][1] = vt2 - 1;
    faces_tex[face_count][2] = vt3 - 1;
    face_count++;
}
```

#### 3. 创建纹理坐标 VBO

```c
GLuint g_vbo_texcoord;

void create_texture_vbo()
{
    // 展开纹理坐标
    float* texcoords_data = malloc(total_vertices * 2 * sizeof(float));
    int idx = 0;
    for (int i = 0; i < face_count; i++) {
        for (int j = 0; j < 3; j++) {
            int vt_idx = faces_tex[i][j];
            texcoords_data[idx++] = texcoords[vt_idx][0];
            texcoords_data[idx++] = texcoords[vt_idx][1];
        }
    }
    
    // 创建 VBO
    glGenBuffers(1, &g_vbo_texcoord);
    glBindBuffer(GL_ARRAY_BUFFER, g_vbo_texcoord);
    glBufferData(GL_ARRAY_BUFFER, 
                 total_vertices * 2 * sizeof(float),
                 texcoords_data, 
                 GL_STATIC_DRAW);
    
    free(texcoords_data);
}
```

#### 4. 修改着色器

**顶点着色器**:
```glsl
uniform mat4 uMVP;
varying vec3 vNormal;
varying vec2 vTexCoord;  // 新增

void main()
{
    gl_Position = uMVP * gl_Vertex;
    vNormal = gl_NormalMatrix * gl_Normal;
    vTexCoord = gl_MultiTexCoord0.xy;  // 传递 UV 坐标
}
```

**片段着色器**:
```glsl
uniform vec3 uLightDir;
uniform sampler2D uTexture;  // 纹理采样器
varying vec3 vNormal;
varying vec2 vTexCoord;  // 新增

void main()
{
    // 光照计算
    vec3 N = normalize(vNormal);
    vec3 L = normalize(uLightDir);
    float diff = max(dot(N, L), 0.0);
    
    vec3 ambient = vec3(0.2);
    vec3 lighting = ambient + diff * vec3(1.0);
    
    // 采样纹理
    vec3 texColor = texture2D(uTexture, vTexCoord).rgb;
    
    // 纹理 × 光照
    gl_FragColor = vec4(texColor * lighting, 1.0);
}
```

#### 5. 渲染时绑定纹理

```c
GLint g_loc_texture;

void init()
{
    // 编译着色器...
    g_loc_texture = glGetUniformLocation(program, "uTexture");
    
    // 创建纹理
    create_checkerboard_texture();
    create_texture_vbo();
}

void render()
{
    glUseProgram(program);
    
    // 设置 MVP 和光源...
    
    // 绑定纹理到纹理单元 0
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, g_texture);
    glUniform1i(g_loc_texture, 0);  // 采样器绑定到纹理单元 0
    
    // 启用纹理坐标数组
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_NORMAL_ARRAY);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    
    glBindBuffer(GL_ARRAY_BUFFER, g_vbo_position);
    glVertexPointer(3, GL_FLOAT, 0, 0);
    
    glBindBuffer(GL_ARRAY_BUFFER, g_vbo_normal);
    glNormalPointer(GL_FLOAT, 0, 0);
    
    glBindBuffer(GL_ARRAY_BUFFER, g_vbo_texcoord);
    glTexCoordPointer(2, GL_FLOAT, 0, 0);  // 2 个分量 (u, v)
    
    glDrawArrays(GL_TRIANGLES, 0, total_vertices);
    
    glDisableClientState(GL_VERTEX_ARRAY);
    glDisableClientState(GL_NORMAL_ARRAY);
    glDisableClientState(GL_TEXTURE_COORD_ARRAY);
}
```

### 完整示例: 带纹理的旋转立方体

```c
void create_cube_with_texture()
{
    // 立方体顶点 (8 个顶点展开为 36 个)
    float positions[] = {
        // 前面
        -1, -1,  1,   1, -1,  1,   1,  1,  1,
        -1, -1,  1,   1,  1,  1,  -1,  1,  1,
        // 后面
        -1, -1, -1,  -1,  1, -1,   1,  1, -1,
        -1, -1, -1,   1,  1, -1,   1, -1, -1,
        // ... 其他 4 个面
    };
    
    // UV 坐标
    float texcoords[] = {
        // 前面
        0, 0,  1, 0,  1, 1,
        0, 0,  1, 1,  0, 1,
        // 后面
        0, 0,  0, 1,  1, 1,
        0, 0,  1, 1,  1, 0,
        // ... 其他 4 个面
    };
    
    // 创建 VBO
    glGenBuffers(1, &vbo_position);
    glBindBuffer(GL_ARRAY_BUFFER, vbo_position);
    glBufferData(GL_ARRAY_BUFFER, sizeof(positions), positions, GL_STATIC_DRAW);
    
    glGenBuffers(1, &vbo_texcoord);
    glBindBuffer(GL_ARRAY_BUFFER, vbo_texcoord);
    glBufferData(GL_ARRAY_BUFFER, sizeof(texcoords), texcoords, GL_STATIC_DRAW);
}
```

### 纹理参数详解

```c
// 过滤模式 (放大/缩小时如何采样)
GL_NEAREST  // 最近邻，像素化效果
GL_LINEAR   // 线性插值，平滑过渡

// 包裹模式 (UV 超出 [0,1] 时如何处理)
GL_REPEAT   // 重复平铺
GL_CLAMP    // 边缘拉伸
GL_MIRRORED_REPEAT  // 镜像重复
```

### 关键 API

| 函数 | 作用 |
|------|------|
| `glGenTextures(n, &id)` | 创建纹理对象 |
| `glBindTexture(target, id)` | 绑定纹理 |
| `glTexImage2D(...)` | 上传图片数据 |
| `glTexParameteri(...)` | 设置过滤/包裹模式 |
| `glActiveTexture(unit)` | 激活纹理单元 |
| `glUniform1i(loc, unit)` | 绑定采样器 |

### 关键收获

- ✅ 理解 UV 坐标映射原理
- ✅ 掌握纹理创建和上传流程
- ✅ 理解纹理采样和插值机制
- ✅ 实现带纹理的 3D 模型渲染

---

## 扩展: 加载真实图片纹理

### 使用 stb_image.h

**stb_image** 是一个单头文件的图像加载库，支持多种格式。

#### 1. 下载库文件

```bash
# 下载到项目目录
wget https://raw.githubusercontent.com/nothings/stb/master/stb_image.h
```

或手动下载: https://github.com/nothings/stb/blob/master/stb_image.h

#### 2. 集成到代码

```c
// 在一个 .c 文件中定义实现
#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"

// 其他文件只需包含头文件
#include "stb_image.h"
```

#### 3. 加载纹理函数

```c
GLuint load_texture(const char* filename)
{
    int width, height, channels;
    
    // 翻转 Y 轴以匹配 OpenGL 坐标系
    stbi_set_flip_vertically_on_load(1);
    
    // 加载图片 (强制转换为 RGB)
    unsigned char* data = stbi_load(filename, &width, &height, &channels, 3);
    
    if (!data) {
        fprintf(stderr, "Failed to load texture: %s\n", filename);
        fprintf(stderr, "Reason: %s\n", stbi_failure_reason());
        return 0;
    }
    
    printf("Loaded texture: %s (%dx%d, %d channels)\n", 
           filename, width, height, channels);
    
    // 创建 OpenGL 纹理
    GLuint texture;
    glGenTextures(1, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    
    // 上传数据
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, width, height, 0,
                 GL_RGB, GL_UNSIGNED_BYTE, data);
    
    // 设置过滤模式
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    
    // 设置包裹模式
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    
    // 释放 CPU 内存
    stbi_image_free(data);
    
    return texture;
}
```

#### 4. 使用示例

```c
void init_textures()
{
    // 尝试加载外部文件
    g_texture = load_texture("textures/wood.png");
    
    // 如果失败，使用程序生成的纹理
    if (g_texture == 0) {
        printf("Using procedural checkerboard texture\n");
        create_checkerboard_texture();
    }
}
```

#### 5. 支持的格式

- PNG (推荐，支持透明度)
- JPG/JPEG (压缩格式)
- BMP (无压缩)
- TGA
- GIF (仅第一帧)
- PSD (Photoshop)
- HDR (高动态范围)

#### 6. 高级选项

**加载 RGBA** (带透明度):
```c
unsigned char* data = stbi_load(filename, &width, &height, &channels, 4);
glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0,
             GL_RGBA, GL_UNSIGNED_BYTE, data);
```

**生成 Mipmap** (多级渐远纹理):
```c
glTexImage2D(...);
glGenerateMipmap(GL_TEXTURE_2D);
glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
```

### 对比总结

| 方式 | 优点 | 缺点 | 适用场景 |
|------|------|------|----------|
| 程序生成 | 无依赖，便于调试 | 效果简单 | 学习、原型 |
| stb_image | 真实效果，格式丰富 | 需要外部文件 | 实际项目 |

### 资源推荐

**免费纹理网站**:
- https://polyhaven.com/textures (CC0 许可)
- https://www.textures.com (需注册)
- https://ambientcg.com (CC0 许可)

**纹理制作工具**:
- GIMP (免费)
- Photoshop
- Substance Designer (专业)

---

## 总结与进阶方向

### 你已经掌握的技能

✅ **着色器编程**: 编写顶点和片段着色器，控制渲染管线  
✅ **数据传递**: 使用 Uniform 从 CPU 向 GPU 传递参数  
✅ **矩阵变换**: 自己构建投影、视图、模型矩阵  
✅ **高效渲染**: 使用 VBO 将数据存储在 GPU 显存  
✅ **纹理映射**: 为 3D 模型贴图，实现真实感渲染  

### 完整渲染流程回顾

```
1. 初始化阶段 (执行一次)
   ├─ 编译着色器 (glCompileShader)
   ├─ 创建 VBO (glBufferData)
   ├─ 创建纹理 (glTexImage2D)
   └─ 获取 Uniform 位置 (glGetUniformLocation)

2. 渲染循环 (每帧执行)
   ├─ 计算 MVP 矩阵
   ├─ 设置 Uniform (glUniform*)
   ├─ 绑定 VBO 和纹理
   └─ 绘制 (glDrawArrays)
```

### 下一步进阶方向

#### 1. 现代 OpenGL (3.0+)
- **VAO** (Vertex Array Object): 封装顶点属性状态
- **glVertexAttribPointer**: 替代固定管线函数
- **GLSL 3.30+**: 使用 `in`/`out` 替代 `attribute`/`varying`

```glsl
// 现代 GLSL
#version 330 core
layout(location = 0) in vec3 aPosition;
layout(location = 1) in vec3 aNormal;
layout(location = 2) in vec2 aTexCoord;

out vec3 vNormal;
out vec2 vTexCoord;

uniform mat4 uMVP;

void main() {
    gl_Position = uMVP * vec4(aPosition, 1.0);
    vNormal = aNormal;
    vTexCoord = aTexCoord;
}
```

#### 2. 高级光照
- **Phong 光照**: 环境光 + 漫反射 + 镜面反射
- **法线贴图**: 增加表面细节
- **阴影映射**: 实时阴影

#### 3. 性能优化
- **EBO** (Element Buffer Object): 避免顶点重复
- **实例化渲染**: 绘制大量相同物体
- **视锥剔除**: 只渲染可见物体

#### 4. 高级纹理
- **立方体贴图**: 天空盒、环境反射
- **多重纹理**: 混合多张纹理
- **帧缓冲对象**: 离屏渲染、后处理效果

#### 5. 几何处理
- **几何着色器**: 动态生成几何体
- **曲面细分**: 动态细分网格

### 推荐学习资源

**在线教程**:
- LearnOpenGL (https://learnopengl.com) - 现代 OpenGL 教程
- OpenGL Tutorial (http://www.opengl-tutorial.org) - 实用示例

**书籍**:
- 《OpenGL 编程指南》(红宝书)
- 《OpenGL SuperBible》(蓝宝书)

**工具**:
- RenderDoc - GPU 调试工具
- Nsight Graphics - NVIDIA GPU 分析工具

### 实践项目建议

1. **3D 模型查看器**: 加载 OBJ/FBX，支持旋转、缩放
2. **简单游戏引擎**: 场景管理、碰撞检测、物理模拟
3. **粒子系统**: 火焰、烟雾、爆炸效果
4. **地形渲染**: 高度图、LOD、植被

---

## 附录

### 核心概念速查

#### 着色器类型

| 着色器 | 执行时机 | 执行次数 | 主要职责 |
|--------|----------|----------|----------|
| 顶点着色器 | 每个顶点 | 顶点数 (如 740) | 坐标变换 |
| 片段着色器 | 每个像素 | 像素数 (如 20万) | 计算颜色 |

#### 变量类型

| 类型 | 来源 | 特点 | 示例 |
|------|------|------|------|
| **Attribute** | `glVertex*()` | 每个顶点不同 | 位置、法线、UV |
| **Uniform** | `glUniform*()` | 全局共享 | 矩阵、光源、时间 |
| **Varying** | 顶点着色器输出 | GPU 自动插值 | 传递法线、颜色 |

#### 坐标变换

```
模型空间 ──Model──→ 世界空间 ──View──→ 相机空间 ──Projection──→ 裁剪空间
  (0,0,0)            (场景中心)        (相机视角)          (屏幕坐标)

MVP 矩阵 = Projection × View × Model
```

### API 速查表

#### 着色器相关
| 函数 | 作用 |
|------|------|
| `glCreateShader(type)` | 创建着色器 |
| `glShaderSource(...)` | 设置源代码 |
| `glCompileShader(s)` | 编译 |
| `glCreateProgram()` | 创建程序 |
| `glAttachShader(p, s)` | 附加着色器 |
| `glLinkProgram(p)` | 链接 |
| `glUseProgram(p)` | 启用/禁用 |

#### Uniform 相关
| 函数 | 作用 |
|------|------|
| `glGetUniformLocation(p, "name")` | 获取位置 |
| `glUniform1f(loc, v)` | 设置 float |
| `glUniform3f(loc, x, y, z)` | 设置 vec3 |
| `glUniformMatrix4fv(loc, ...)` | 设置 mat4 |

#### VBO 相关
| 函数 | 作用 |
|------|------|
| `glGenBuffers(n, &id)` | 创建 VBO |
| `glBindBuffer(target, id)` | 绑定 VBO |
| `glBufferData(target, size, data, usage)` | 上传数据 |
| `glVertexPointer(size, type, stride, ptr)` | 指定顶点格式 |
| `glDrawArrays(mode, first, count)` | 绘制 |

#### 纹理相关
| 函数 | 作用 |
|------|------|
| `glGenTextures(n, &id)` | 创建纹理对象 |
| `glBindTexture(target, id)` | 绑定纹理 |
| `glTexImage2D(...)` | 上传图片数据 |
| `glTexParameteri(...)` | 设置过滤/包裹模式 |
| `glActiveTexture(unit)` | 激活纹理单元 |

### OpenGL 函数命名规则

```
gl      Vertex    3       f       v
│         │       │       │       │
│         │       │       │       └── v = vector (数组指针)
│         │       │       └── f = float 类型
│         │       └── 3 = 3个分量 (x,y,z)
│         └── 功能名
└── OpenGL 前缀
```

| 后缀 | 含义 |
|------|------|
| `3f` | 3 个 float 参数 |
| `3fv` | float[3] 数组指针 |
| `4d` | 4 个 double 参数 |
| `Matrix4fv` | 4x4 float 矩阵 |

### 常见问题

**Q: 着色器编译失败？**
- 检查 GLSL 语法错误
- 使用 `glGetShaderInfoLog` 查看错误信息
- 确认 OpenGL 版本支持的 GLSL 版本

**Q: 纹理是黑色的？**
- 检查是否调用 `glBindTexture()`
- 检查 UV 坐标是否正确传递
- 检查采样器 uniform 是否设置

**Q: VBO 不显示？**
- 检查是否调用 `glEnableClientState()`
- 检查顶点数据是否正确展开
- 确认 `glDrawArrays` 的顶点数量正确

**Q: 矩阵变换不正确？**
- 检查矩阵乘法顺序 (MVP = P × V × M)
- 确认使用列主序存储
- 检查角度是否转换为弧度

---

## 代码文件说明

本教程的示例代码采用**渐进式演进**方式：

- **OpenGL-demo.c** - 主示例代码
  - 包含所有 5 个学习步骤的完整实现
  - 通过注释标记不同阶段的代码
  - 便于理解从简单到复杂的演进过程

**为什么在同一个文件中演进？**
- ✅ 避免代码重复和维护困难
- ✅ 保留完整的演进历史
- ✅ 更符合实际开发流程：在现有代码上迭代改进

**如何使用**:
1. 从头阅读，理解每个步骤的改动
2. 运行完整代码，查看最终效果
3. 注释掉高级功能，回退到简单版本进行学习
