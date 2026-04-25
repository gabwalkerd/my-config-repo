# Zellij 配置目录

本目录存放 [Zellij](https://github.com/zellij-org/zellij) 终端复用器的用户配置文件。Zellij 是一个现代化的终端工作区管理器，类似 tmux，但提供更友好的开箱即用体验。

## 文件说明

### `config.kdl` — 当前生效的配置文件

这是 Zellij 的主配置文件，使用 KDL（KDL Document Language）格式编写。Zellij 启动时会读取此文件。

**主要内容：**

| 配置块 | 作用 |
|--------|------|
| `keybinds` | 所有键盘快捷键绑定，按模式（mode）分组，定义了 pane、tab、resize、move、scroll、search、session、tmux 等模式下的按键行为 |
| `plugins` | 内置插件别名配置，可修改各插件的实现来源（如 status-bar、tab-bar、session-manager 等） |
| `load_plugins` | 会话启动时自动加载的后台插件列表 |
| `web_client` | Web 客户端字体设置 |
| 注释区域 | 大量可选的配置项（均已注释），包含主题、默认 shell、鼠标模式、会话序列化、Web 服务器等设置 |

**当前激活的关键配置：**
- `keybinds clear-defaults=true`：清空默认按键绑定，完全采用自定义绑定
- `default_mode "normal"`：默认输入模式为 normal
- 自定义了 `normal` 模式下的 vim 风格方向键（`Alt+h/j/k/l` 移动焦点）
- 文件选择器（strider）的初始目录为 `/`

### `config.kdl.bak` — 自动备份 #1

Zellij 在自动生成/更新 `config.kdl` 之前会将旧文件备份到此。与当前版本的差异：
- **无 `normal` 模式**：没有独立的 normal 键位模式定义
- **焦点移动方式不同**：`Alt+h/j/k/l` 和 `Alt+方向键` 放在 `shared_except "locked"` 中，始终全局可用，而非绑定到特定模式
- 滚动模式下不包含 Alt 方向键绑定

### `config.kdl.bak.1` — 自动备份 #2（最早版本）

更早的配置备份。特点：
- 同样无 `normal` 模式
- 滚动模式下包含 `Alt+方向键` 和 `Alt+h/j/k/l` 的焦点移动（带 `SwitchToMode "normal"`）
- `default_mode "normal"` 已激活
- 整体结构与当前版本更接近

## 版本演化

```
config.kdl.bak.1（最早）→ config.kdl.bak → config.kdl（当前）
```

主要变化趋势：
1. 引入了独立的 `normal` 模式，将 vim 风格导航键从全局移到该模式中
2. 滚动模式中增加了 Alt 方向键导航绑定
3. 按键绑定逐渐向更模块化的模式分组演进

## 注意事项

- 修改配置后需要重启 Zellij 会话才能生效（部分配置项标注了 "Requires restart"）
- 不要直接删除 `.bak` 文件——它们是 Zellij 自动生成配置时的回滚保障
- KDL 格式对缩进和括号敏感，手动编辑时需注意语法
