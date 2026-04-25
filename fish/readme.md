# .config/fish 目录结构说明

Fish Shell 的 XDG 标准配置目录。以下是各文件/文件夹的作用：

---

### `config.fish`

Fish 的主配置文件，每次启动 Fish 时自动执行。当前配置包含：

- 将 `/usr/local/go/bin` 和 `$HOME/go/bin` 加入 `PATH`（Go 工具链）
- 加载 `zoxide`（智能目录跳转工具，替代 `cd`）
- 别名：
  - `sl` → `ls`（手误纠正）
  - `zl` → `zellij`（终端复用器）
- 自定义函数 `wingocode`：快速跳转到 WSL 挂载的 Go 项目目录 `/mnt/d/GoCode`
- 将 `~/.local/bin` 加入 PATH
- WSLg Wayland socket 修复：解决 WSL 下 `wl-clipboard` 和 Claude Code 粘贴图片时 Wayland 通信问题

### `conf.d/`

延迟加载的配置片段目录。这里的 `.fish` 文件会在 `config.fish` 之后自动执行，适合放第三方工具生成的配置。

- **`rustup.fish`**：由 Rust 工具链安装器自动生成，执行 `source "$HOME/.cargo/env.fish"` 来加载 Cargo/Rust 环境变量。

### `functions/`

自定义函数目录。放入 `.fish` 文件，文件名即函数名，Fish 会自动加载。比在 `config.fish` 里直接写 `function` 更整洁。当前为空。

### `completions/`

自动补全定义目录。放入 `.fish` 文件为 CLI 工具提供 tab 补全。当前为空，常用工具（如 `git`、`cargo` 等）的补全通常由工具自己生成到这里。

### `fish_variables`

Fish 的通用变量持久化存储文件。Fish 用此文件保存跨会话的变量（通过 `set -U` 设置）。由 Fish 自动管理，无需手动编辑。
