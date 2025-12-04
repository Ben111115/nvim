# Neovim Configuration

A modern, powerful Neovim configuration with full LSP support for multiple languages including Go, TypeScript, JavaScript, Java, HTML, CSS, React, and Angular.

## Features

- **File Navigation**: NeoTree file explorer with Git integration
- **Fuzzy Finding**: Telescope for fast file and text searching
- **Integrated Terminal**: Toggleterm with floating and split terminal support
- **Buffer Management**: Bufferline with easy navigation
- **LSP Support**: Full language server protocol support with automatic installation via Mason
- **Modern UI**: VSCode-inspired theme with clean aesthetics
- **Git Integration**: Built-in Git signs and Lazygit integration
- **Auto-completion**: Powerful completion with nvim-cmp
- **Syntax Highlighting**: Treesitter-based highlighting for accurate syntax
- **Auto-pairs**: Intelligent bracket and tag closing

**Leader Key**: Space

## Quick Start

For detailed workflow and usage guide, see [nvim-workflow.md](./nvim-workflow.md).

## Navigation Guide

### Key Concepts in Neovim

In Neovim, there are three main ways to organize your workspace:

1. **Buffers**: These are loaded files in memory. You can have multiple buffers open at once, even if they're not visible.
2. **Windows**: These are viewports that display a buffer. You can split your screen to show multiple windows.
3. **Tabs**: These are collections of windows. Think of them as different workspace layouts.

### File Navigation with NeoTree

- `<Space>e`: Toggle NeoTree file explorer
- `<Space>o`: Focus on NeoTree
- In NeoTree:
  - `<Enter>`: Open file
  - `a`: Add new file
  - `A`: Add new directory
  - `d`: Delete file
  - `r`: Rename file
  - `.`: Set current directory as root
  - `<Backspace>`: Navigate up a directory
  - `H`: Toggle hidden files
  - `/`: Fuzzy finder in tree

### Fuzzy Finding with Telescope

- `<Space>ff`: Find files
- `<Space>fg`: Live grep (search file contents)
- `<Space>fb`: Browse open buffers
- `<Space>fh`: Search help documentation
- Inside Telescope:
  - `<Ctrl-j>` / `<Ctrl-k>`: Move up and down results
  - `<CR>` (Enter): Open selected item
  - `<Ctrl-q>`: Send results to quickfix list
  - `<Esc>`: Close Telescope

### Buffer Navigation

- `<Shift-h>`: Previous buffer
- `<Shift-l>`: Next buffer
- `<Space>c`: Close current buffer
- `<Space>fb`: Show buffer list with Telescope

### Window Management

- `<Ctrl-h/j/k/l>`: Navigate between windows
- `<Space>sv`: Split window vertically
- `<Space>sh`: Split window horizontally
- `<Ctrl-Up/Down/Left/Right>`: Resize windows

### Tab Management

- `<Space>tn`: New tab
- `<Space>tc`: Close tab
- `<Space>to`: Close all other tabs
- `<Space>tl`: Go to next tab
- `<Space>th`: Go to previous tab

### Terminal

- `<Space>t`: Toggle terminal
- Inside terminal:
  - `<Esc>` or `jk`: Exit terminal mode (return to normal mode)
  - `<Ctrl-h/j/k/l>`: Navigate between windows

### LSP Features

- `gd`: Go to definition
- `gD`: Go to declaration
- `K`: Hover documentation
- `gi`: Go to implementation
- `gr`: Find references
- `<Space>rn`: Rename symbol
- `<Space>ca`: Code actions
- `<Space>lf`: Format code
- `[d` / `]d`: Navigate between diagnostics
- `<Space>d`: Show diagnostics in a floating window

## Installation Instructions

### Prerequisites

- **Neovim 0.9.0 or later** (0.11+ recommended)
- **Git** for cloning the repository
- **A Nerd Font** (required for icons)
- **Node.js** (for TypeScript/JavaScript language servers)
- **ripgrep** (for Telescope text search)

### Installation Steps

1. **Backup your existing Neovim configuration** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone https://github.com/Ben111115/nvim.git ~/.config/nvim
   ```

3. **Launch Neovim**:
   ```bash
   nvim
   ```
   Lazy.nvim will automatically install itself and all plugins on first launch.

4. **Verify installation**:
   ```vim
   :checkhealth
   ```

5. **Language Server Installation**:
   - Mason will automatically install configured language servers
   - For manual installation: `:Mason`
   - Supported servers: `ts_ls` (TypeScript), `gopls` (Go), `html`, `cssls`, `angularls`, `jdtls` (Java), `jsonls`, `lua_ls`, `emmet_ls`

### Important Notes

- The configuration uses `ts_ls` as the TypeScript language server (updated from deprecated `tsserver`)
- On Neovim 0.11+, you may see a deprecation warning about lspconfig - this is informational only and doesn't affect functionality
- All language servers are managed through Mason for easy installation and updates

## External Dependencies

For full functionality, make sure you have:

## External Dependencies

### Required: Nerd Font

This configuration requires a Nerd Font for proper icon display. Without it, you'll see question marks or incorrect characters.

#### Installing a Nerd Font:

**Linux:**
```bash
# Install FiraCode Nerd Font (recommended)
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "Fira Code Regular Nerd Font Complete.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf
fc-cache -f -v
```

**Other Operating Systems:**
Visit [Nerd Fonts Website](https://www.nerdfonts.com/font-downloads) and download FiraCode, Hack, JetBrainsMono, or another Nerd Font.

**Terminal Settings:**
Ensure your terminal uses the installed Nerd Font as its default font.

### Other Dependencies

**ripgrep** (for Telescope text search):
```bash
# Ubuntu/Debian
sudo apt install ripgrep

# Arch Linux
sudo pacman -S ripgrep

# macOS
brew install ripgrep
```

**Language-Specific Tools:**
- **Node.js**: For TypeScript, JavaScript, and many LSP servers
- **Go**: For Go development (gopls)
- **JDK**: For Java development (jdtls)
- **GCC/Clang**: For C/C++ development

All language servers are automatically installed via Mason when you open files of the respective types.

## Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lazy-lock.json          # Plugin version lock file
├── lua/
│   ├── options.lua         # Neovim core settings
│   ├── keymaps.lua         # Key bindings
│   ├── lsp/
│   │   └── init.lua        # LSP configuration
│   └── plugins/
│       ├── init.lua        # Plugin specifications
│       ├── bufferline.lua  # Buffer/tab line
│       ├── cmp.lua         # Auto-completion
│       ├── lualine.lua     # Status line
│       ├── neotree.lua     # File explorer
│       ├── telescope.lua   # Fuzzy finder
│       ├── toggleterm.lua  # Terminal
│       └── treesitter.lua  # Syntax highlighting
├── README.md
└── nvim-workflow.md        # Detailed workflow guide
```

## Customization

This configuration is modular and easy to customize:

- **Core Settings**: Edit `lua/options.lua`
- **Key Bindings**: Edit `lua/keymaps.lua`
- **Plugins**: Add/remove in `lua/plugins/init.lua`
- **LSP Configuration**: Edit `lua/lsp/init.lua`
- **Individual Plugin Settings**: Each plugin has its own file in `lua/plugins/`

## Supported Languages

Full LSP support for:
- TypeScript/JavaScript (ts_ls)
- Go (gopls)
- HTML (html)
- CSS/SCSS (cssls)
- Angular (angularls)
- Java (jdtls)
- JSON (jsonls)
- Lua (lua_ls)
- Emmet (emmet_ls)

## Key Mappings Summary

| Key | Action |
|-----|--------|
| `Space` | Leader key |
| `Space + e` | Toggle file explorer |
| `Space + ff` | Find files |
| `Space + fg` | Live grep (search text) |
| `Space + fb` | Browse buffers |
| `Shift + h/l` | Previous/Next buffer |
| `Space + w` | Save file |
| `Space + q` | Quit |
| `Space + tt` | Toggle terminal |
| `Ctrl + h/j/k/l` | Navigate windows |
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Hover documentation |
| `Space + ca` | Code actions |
| `Space + rn` | Rename symbol |

For complete keybinding list and workflow, see [nvim-workflow.md](./nvim-workflow.md).

## Troubleshooting

### Icons not showing
Install a Nerd Font and set it in your terminal settings.

### Language server not working
1. Check `:Mason` to see if the server is installed
2. Run `:LspInfo` to see active servers
3. Run `:checkhealth` for diagnostics

### Telescope not finding files
Install `ripgrep`: See External Dependencies section above.

### Deprecation warning on startup (Neovim 0.11+)
The warning about lspconfig being deprecated is informational only. The configuration works perfectly and will be updated when lspconfig v3.0.0 is released.

## Contributing

Feel free to fork and customize this configuration for your needs. Pull requests for improvements are welcome!

## License

MIT License - Feel free to use and modify as needed.

---

**Repository**: [https://github.com/Ben111115/nvim](https://github.com/Ben111115/nvim)

For detailed usage and workflow guide, see [nvim-workflow.md](./nvim-workflow.md).