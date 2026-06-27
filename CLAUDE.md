# AI 酒馆 Agent

这个工作区用于管理 AI 酒馆（SillyTavern + claude-code-sillytavern-bridge）的运行。

## 我能做什么

- 启动/停止 bridge 服务和 SillyTavern
- 管理角色卡（导入、整理、备份）
- 排查连接问题
- 更新 bridge 或 SillyTavern 到最新版本

## 目录结构

```
ai-tavern/
├── SillyTavern/   ← ST 本体（setup.ps1 自动克隆）
├── bridge/        ← Claude Code 桥接服务（setup.ps1 自动克隆）
├── 角色卡/        ← 放角色卡文件（.json 或 .png）
├── setup.ps1      ← 首次安装
└── start.ps1      ← 每次启动
```

## 首次使用

1. 确保已安装 Claude Code、Node.js 18+、Python 3.10+
2. 运行 `.\setup.ps1`
3. 运行 `.\start.ps1`
4. 在 SillyTavern 里选 API 类型为「OpenAI 兼容」，URL 填 `http://localhost:5001`

## 角色卡

把 `.json` 或 `.png` 格式的角色卡放进 `角色卡/` 目录，然后在 SillyTavern 里导入。
