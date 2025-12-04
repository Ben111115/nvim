# Neovim Workflow Guide

Complete guide for your Neovim setup and daily workflow.

## Opening Your Project

bash
# Open entire project
cd /path/to/your/project
nvim .

# Open specific files
nvim file1.js file2.js file3.py

# Open and jump to specific line
nvim file.js +42


## Core Navigation

### Leader Key
Your leader key is Space - all custom commands start with it.

### Window Navigation
- Ctrl + h - Move to left window
- Ctrl + j - Move to down window
- Ctrl + k - Move to up window
- Ctrl + l - Move to right window
- Ctrl + w then w - Cycle through all windows

### Window Resizing
- Ctrl + Up - Decrease window height
- Ctrl + Down - Increase window height
- Ctrl + Left - Decrease window width
- Ctrl + Right - Increase window width

## File Explorer (NeoTree)

### Opening NeoTree
- Space + e - Toggle NeoTree (left side)
- Space + o - Focus on NeoTree

### Inside NeoTree Navigation
- Enter - Open file
- s - Open in vertical split (right)
- S - Open in horizontal split (bottom)
- t - Open in new tab
- Space - Expand/collapse folder

### File Operations in NeoTree
- a - Add new file
- A - Add new directory
- d - Delete file/directory
- r - Rename
- y - Copy to clipboard
- x - Cut to clipboard
- p - Paste from clipboard
- c - Copy (with destination prompt)
- m - Move (with destination prompt)

### NeoTree Extras
- H - Toggle hidden files
- / - Fuzzy finder
- R - Refresh
- q - Close NeoTree window
- ? - Show help

## Finding Files (Telescope)

- Space + ff - Find files (fuzzy search)
- Space + fg - Live grep (search text in all files)
- Space + fb - Show open buffers
- Space + fh - Help tags

### Opening Files from Telescope in Splits
When in the Telescope file finder:
- Enter - Open file in current window
- Ctrl + x - Open file in horizontal split
- Ctrl + v - Open file in vertical split
- Ctrl + t - Open file in new tab

## Buffer Management (Files Open at Top)

Buffers are your open files shown in the bar at the top.

### Navigate Between Buffers
- Shift + l - Next buffer (move right)
- Shift + h - Previous buffer (move left)
- Space + bl - Next buffer
- Space + bh - Previous buffer

### Buffer Actions
- Space + bn - New empty buffer
- Space + bc - Close current buffer
- Space + bt - Close current buffer (alternative)
- Space + bo - Close all other buffers (keep current only)

## Tab Management (Actual Vim Tabs)

Note: Buffers (shown at top) are different from tabs. Most users work with buffers.

- Space + tn - New tab
- Space + tc - Close tab
- Space + tl - Next tab
- Space + th - Previous tab

## Terminal Usage

### Toggle Terminal (Floating)
- Space + tt - Toggle floating terminal
- Ctrl + \ - Also toggles terminal

### Exit Terminal Mode
- Esc - Exit terminal mode to normal mode
- jk - Alternative to exit terminal mode

### Navigation While in Terminal
- Ctrl + h/j/k/l - Navigate to other windows (same as normal mode)

### Additional Terminal Options

#### Open Terminal in Split
vim
:split | term    " Horizontal split with terminal
:vsplit | term   " Vertical split with terminal (right side)
:term            " Terminal in current window


#### Vertical Terminal on Right (Manual)
vim
:vsplit | term


Then resize with Ctrl + Left/Right

### Lazygit Integration
- Space + g - Open Lazygit in floating terminal

## Splitting Windows

- Space + sv - Split vertically (new window on right)
- Space + sh - Split horizontally (new window below)

## Closing Splits/Windows

- :q or :close - Close the current split window
- Ctrl + w then c - Close the current split window
- Ctrl + w then o - Close all splits except the current one
- :only - Close all splits except the current one (same as above)

## Editing Keybinds

### Visual Mode
- < - Indent left (stays in visual mode)
- > - Indent right (stays in visual mode)
- Alt + j - Move selected text down
- Alt + k - Move selected text up
- p - Paste without overwriting register

### Normal Mode
- Ctrl + d - Page down (cursor stays centered)
- Ctrl + u - Page up (cursor stays centered)
- n - Next search result (centered)
- N - Previous search result (centered)

### Character Jumping
- s<char> - Jump to next occurrence of character
- . - Next occurrence of same character
- , - Previous occurrence of same character

## Quick Actions

### Save and Quit
- Space + w - Save file
- Space + q - Quit
- Space + Q - Quit all without saving

### Search
- Space + h - Clear search highlighting

## LSP (Code Intelligence)

### Formatting
- Space + lf - Format code with LSP

### Diagnostics
- Space + d - Show diagnostic in floating window
- [d - Go to previous diagnostic
- ]d - Go to next diagnostic

## Recommended Daily Workflow

### 1. Start Your Session
bash
cd ~/your-project
nvim .


### 2. Open File Explorer
- Space + e to toggle NeoTree
- Navigate with j/k, open files with Enter

### 3. Find Files Quickly
- Space + ff to fuzzy find files
- Start typing filename, Enter to open

### 4. Work with Multiple Files
- Files open as buffers (shown at top)
- Shift + l and Shift + h to switch between them
- Space + bc to close unwanted buffers

### 5. Split Your View
- Space + sv for vertical split
- Ctrl + h/l to jump between splits
- Work on two files side by side

### 6. Open Terminal on Right
vim
:vsplit | term

- Terminal opens on right side
- Esc to exit terminal mode
- Ctrl + h to go back to editor
- Ctrl + l to go back to terminal

### 7. Search Across Project
- Space + fg for live grep
- Type search term, see results instantly
- Enter to jump to result

### 8. Use Git Integration
- Space + g for Lazygit
- Manage commits, branches, etc.
- q to close Lazygit

## Tips & Tricks

1. *Keep NeoTree closed* most of the time, use Space + ff (Telescope) to find files faster
2. *Use buffers instead of tabs* - they're more efficient
3. *Split vertically* for code + terminal workflow
4. *Telescope is your friend* - learn to use fuzzy finding instead of manual navigation
5. *Terminal navigation* - Ctrl + h/l lets you jump between editor and terminal seamlessly

## Common Scenarios

### Scenario: Working on Feature with Tests

1. Space + ff → Open main file
2. Space + sv → Split vertically
3. :term in right split → Open terminal
4. Ctrl + h → Back to editor
5. Space + ff → Open test file
6. Write code, Ctrl + l → Jump to terminal
7. Run tests in terminal
8. Ctrl + h → Back to code

### Scenario: Debugging Across Multiple Files

1. Space + fg → Search for function name
2. Results show all occurrences
3. Enter on result → Jump to file
4. Shift + l/h → Navigate between buffer results
5. Space + d → Check diagnostics
6. [d / ]d → Navigate errors

### Scenario: Quick File Edit

1. Space + ff → Find file
2. Make changes
3. Space + w → Save
4. Space + q → Quit (or Shift + h to previous buffer)

## Summary of Most Used Keys

| Key Combo | Action |
|-----------|--------|
| Space + e | Toggle file explorer |
| Space + ff | Find files |
| Space + fg | Search in files |
| Shift + l/h | Next/previous buffer |
| Ctrl + h/j/k/l | Navigate windows |
| Space + sv | Vertical split |
| Space + tt | Toggle terminal |
| :vsplit \| term | Terminal on right |
| Space + w | Save |
| Space + bc | Close buffer |

---

*Configuration Location:* ~/.config/nvim/

For more customization, edit:
- ~/.config/nvim/lua/keymaps.lua - All keybindings
- ~/.config/nvim/lua/plugins/toggleterm.lua - Terminal settings
- ~/.config/nvim/lua/plugins/neotree.lua - File explorer settings
