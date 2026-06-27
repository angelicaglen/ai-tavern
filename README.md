# AI 酒馆

用 Claude Code 订阅驱动的 SillyTavern 角色扮演环境。

## 前置要求

- Claude Code（已登录，有 Max/Pro 订阅）
- Node.js 18+
- Python 3.13+
- Git

## 安装

```powershell
git clone <本仓库地址>
cd ai-tavern
.\setup.ps1
```

## 每次启动

```powershell
.\start.ps1
```

启动后浏览器不会自动打开，手动访问：
- SillyTavern：http://localhost:4000
- Bridge 控制台：http://localhost:5001

## 首次配置（连接 Bridge）

1. 打开 http://localhost:5001，在 Bridge 控制台选择模型（Opus/Sonnet）和 effort 级别
2. 打开 http://localhost:4000，点左上角插头图标进入 API 设置
3. API 类型选 Text Completion
4. Source 选 OpenAI 兼容（Custom OpenAI-compatible）
5. 服务器地址填 http://localhost:5001
6. API Key 随便填一个字符串
7. 点击连接

## 注意

- Windows 会保留某些端口（如 8000），SillyTavern 使用 4000 端口绕开此限制
- Bridge 依赖安装在 bridge/.venv/，不影响系统 Python 环境
- 模型选择在 Bridge 控制台（5001）控制，SillyTavern 的模型选择器无效

## 角色卡

把 .json 或 .png 格式角色卡放入 角色卡/ 目录，在 SillyTavern 导入使用。
