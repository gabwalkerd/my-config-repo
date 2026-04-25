# Helix 编辑器配置

本目录是 Helix 编辑器的用户配置目录（`~/.config/helix`），Helix 启动时会自动加载此处的 `config.toml` 和 `languages.toml`。

## 文件与目录

### `config.toml`

主配置文件，包含以下设置：

- **主题**：使用自定义主题 `grv-wti`（位于 `themes/` 目录）
- **快捷键**：`C-j` 绑定跳转到上一个位置（jump_backward），`C-i` 绑定跳转到下一个位置（jump_forward）
- **编辑器选项**：
  - `cursorline` — 高亮当前行
  - `true-color` — 启用真彩色
  - `bufferline` — 始终显示标签栏
  - `color-modes` — 根据模式改变光标颜色
  - `popup-border` — 所有弹窗显示边框
  - `end-of-line-diagnostics` — 行尾以 hint 样式显示诊断信息
  - `inline-diagnostics.cursor-line` — 光标所在行显示 warning 级别的诊断
  - `lsp.display-progress-messages` — 显示 LSP 进度消息
- **光标形状**：插入模式为竖线（bar），选择模式为下划线（underline）
- **软换行**：已启用
- **缩进引导线**：使用 `|` 字符渲染

### `languages.toml`

语言服务器和各语言的特定配置：

- **clangd**（C/C++）：配置了 `--clang-tidy` 启用 clang-tidy 检查，使用 WebKit 作为回退代码风格，禁用头文件自动插入
- **Scheme**：使用 `steel-language-server` 提供语言支持
- 底部有一段注释掉的 Rust 调试器配置（lldb-dap），含 `rustc_primer.py` 脚本路径

### `config-bk/`

前一版配置文件的手动备份，包含旧版 `config.toml` 和 `languages.toml`：

- 旧 config.toml 曾使用 `gruvbox` 主题，inline diagnostics 等级为 `error`，所有模式光标均为竖线（bar）
- 旧 languages.toml 曾详细配置了 Rust（rust-analyzer）、C（clangd）、Go（gopls）、Zig（zls）、TypeScript/JavaScript（deno-lsp）、C++（clangd）等语言的缩进和 LSP

### `runtime/`

Helix 运行时资源目录。`grammars/` 下存放编译好的 tree-sitter 语法解析共享库（.so 文件），共约 27,000 个文件，占用约 1.4 GB。`grammars/sources/` 下为各语法的源代码。这些文件为 200 多种语言提供语法高亮支持。由 `hx --grammar fetch` 和 `hx --grammar build` 命令自动生成和管理。

### `themes/`

三个自定义颜色主题：

| 文件 | 说明 |
|---|---|
| `grv.toml` | 从 Gruvbox 主题派生的完全自定义版本，根据个人审美调整了注释、关键字、函数、变量、UI 元素、诊断信息等几乎所有语法范围的配色 |
| `grv-wti.toml` | 继承自 `grv`，去掉了注释、text.emphasis、变量和 inlay hint 的斜体样式，保留 markup.italic 和 markup.quote 的斜体。**这是当前使用的主题** |
| `gruvbox-wti.toml` | 继承自 Helix 内置的 `gruvbox` 主题，去掉了 attribute、comment、enum variant、variable.builtin 和 variable.parameter 的斜体样式 |
