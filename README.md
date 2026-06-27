# AI 酒馆

用 Claude Code 订阅驱动的 SillyTavern 角色扮演环境，不需要额外付 API 费用。

---

## 给 Claude 的安装指令

把下面这段话发给 Claude Code，它会帮你完成所有安装：

> 帮我克隆并安装 AI 酒馆。步骤：
> 1. 在 D:\ 下新建 ai-tavern 目录（如果已存在跳过）
> 2. `git clone https://github.com/angelicaglen/ai-tavern.git D:\ai-tavern`
> 3. 进入 `D:\ai-tavern` 运行 `.\setup.ps1`
> 4. 安装完成后运行 `.\start.ps1`
> 5. 告诉我打开哪个网址

---

## 手动安装（备用）

**前置要求**：Claude Code 已登录、Node.js 18+、Python 3.10+、Git

```powershell
git clone https://github.com/angelicaglen/ai-tavern.git
cd ai-tavern
.\setup.ps1
.\start.ps1
```

---

## 启动后访问

| 地址 | 用途 |
|------|------|
| http://localhost:5001 | Bridge 控制台（选模型和 effort） |
| http://localhost:4000 | SillyTavern（角色扮演界面） |

---

## 首次连接 Bridge

在 SillyTavern（4000）里：
1. 点左上角插头图标
2. API 类型选 **Text Completion**
3. Source 选 **OpenAI 兼容**
4. 服务器填 `http://localhost:5001`
5. API Key 随便填，点连接

---

## 角色卡

把 `.json` 或 `.png` 格式角色卡放入 `角色卡/` 目录，在 SillyTavern 里导入。
