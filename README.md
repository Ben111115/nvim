# Neovim Configuration

A powerful Neovim configuration with support for Go, TypeScript, JavaScript, Java, HTML, CSS, React, and Angular.

## Features

- File navigation with NeoTree
- Fuzzy finding with Telescope
- Integrated terminal with Toggleterm
- Tab/buffer management with bufferline.nvim
- Automatic bracket and tag closing
- LSP support for multiple languages
- VSCode-like theme and clean UI
- Space as leader key

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

1. Ensure you have Neovim 0.8.0 or later installed
2. Clone this config to your Neovim config directory:
   ```bash
   git clone https://github.com/yourusername/nvim-config ~/.config/nvim
   ```
3. Launch Neovim. Lazy.nvim will automatically install itself and all plugins.
4. Run `:checkhealth` to verify your setup and install any missing dependencies.
5. For language server support, Mason will automatically install the necessary servers based on the configuration.
   - The TypeScript language server is installed separately to avoid naming conflicts
   - If any LSP servers fail to install automatically, you can install them manually:
   ```
   :Mason
   ```
   And navigate to the servers you need (gopls, typescript-language-server, html, cssls, etc.)
6. After the schemastore.nvim plugin is installed, you can uncomment the JSON schema support in the lsp/init.lua file.

**Note:** This configuration has been updated to:
- Use modern diagnostic sign definitions
- Use the new ts_ls (typescript) LSP server instead of the deprecated tsserver
- Handle automatic installation of language servers correctly

## External Dependencies

For full functionality, make sure you have:

### Required: Nerd Font

Diese Konfiguration benötigt eine Nerd Font für die korrekten Symbole und Icons. Ohne Nerd Font werden Fragezeichen oder falsche Zeichen angezeigt.

#### Installation einer Nerd Font:

1. **Für Linux:**
   ```bash
   # Installiere FiraCode Nerd Font (empfohlen)
   mkdir -p ~/.local/share/fonts
   cd ~/.local/share/fonts
   curl -fLo "Fira Code Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf
   fc-cache -f -v
   ```

2. **Für andere Betriebssysteme:**
   Besuche [Nerd Fonts Website](https://www.nerdfonts.com/font-downloads) und lade FiraCode, Hack, JetBrainsMono oder eine andere Nerd Font herunter.

3. **Terminaleinstellungen:**
   Stelle sicher, dass dein Terminal die installierte Nerd Font als Standardschrift verwendet.

Nach der Installation einer Nerd Font sollten alle Symbole und Icons korrekt angezeigt werden.

### Andere Abhängigkeiten

- **ripgrep:** Für die Textsuche mit Telescope
  ```bash
  # Ubuntu/Debian
  sudo apt install ripgrep

  # Arch Linux
  sudo pacman -S ripgrep

  # macOS
  brew install ripgrep
  ```

- **Language Servers:** Werden automatisch von Mason installiert, aber einige benötigen:
  - **Node.js:** Für TypeScript, JavaScript und viele andere Language Server
  - **Go:** Für Go-Entwicklung
  - **JDK:** Für Java-Entwicklung
  - **GCC/Clang:** Für C/C++ Entwicklung

## Customization

This configuration is modular, making it easy to customize:

- Edit `lua/options.lua` for Neovim core settings
- Edit `lua/keymaps.lua` for key bindings
- Edit `lua/plugins/init.lua` to add/remove plugins
- Edit LSP configuration in `lua/lsp/init.lua`
- Each plugin has its own configuration file in `lua/plugins/`