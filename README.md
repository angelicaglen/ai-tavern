# AI 酒馆

用 Claude Code 订阅驱动的 SillyTavern 角色扮演环境。

## 前置要求

- Claude Code（已登录，有 Max/Pro 订阅）
- Node.js 18+
- Python 3.10+
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

浏览器会自动打开 SillyTavern。

## SillyTavern 配置

首次打开后，进入 API 设置：
- API 类型选 Text Completion → OpenAI 兼容
- 服务器地址填 http://localhost:5001
- 点击连接

## 角色卡

把 .json 或 .png 格式角色卡放入 角色卡/ 目录，在 SillyTavern 导入使用。
