-- Neovim options configuration
local opt = vim.opt

-- Font settings for GUI versions of Neovim (like Neovide, etc.)
-- Use a Nerd Font for proper icon rendering
if vim.g.neovide or vim.g.goneovim or vim.g.nvui then
  opt.guifont = "FiraCode Nerd Font:h11" -- Adjust size as needed
end

-- Line numbers
opt.number = true         -- Show line numbers
opt.relativenumber = true -- Show relative line numbers

-- Tabs and indentation (4 spaces as requested)
opt.tabstop = 4           -- Number of spaces tabs count for
opt.softtabstop = 4       -- Number of spaces for a tab in editing operations
opt.shiftwidth = 4        -- Size of an indent
opt.expandtab = true      -- Use spaces instead of tabs
opt.smartindent = true    -- Insert indents automatically
opt.autoindent = true     -- Copy indent from current line when starting a new line

-- Search
opt.ignorecase = true     -- Ignore case in search patterns
opt.smartcase = true      -- Override ignorecase when search contains uppercase

-- UI
opt.termguicolors = true  -- Enable 24-bit RGB colors
opt.cursorline = true     -- Highlight the current line
opt.signcolumn = "yes"    -- Always show sign column (for LSP, Git)
opt.showmode = false      -- Don't show mode (will be shown in status line)
opt.scrolloff = 8         -- Min number of lines to keep above/below cursor
opt.sidescrolloff = 8     -- Min number of columns to keep left/right of cursor
opt.splitbelow = true     -- New horizontal splits go below
opt.splitright = true     -- New vertical splits go right
opt.colorcolumn = "80"    -- Highlight column at 80 characters
opt.cmdheight = 1         -- More space for displaying messages

-- Behavior
opt.hidden = true         -- Allow switching from unsaved buffers
opt.undofile = true       -- Persistent undo
opt.updatetime = 300      -- Faster completion (default is 4000)
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.mouse = "a"           -- Enable mouse support
opt.completeopt = "menu,menuone,noselect" -- Better completion experience
opt.backup = false        -- Don't create backup files
opt.writebackup = false   -- Don't create backup files during write
opt.swapfile = false      -- Don't create swap files

-- Appearance
opt.wrap = false          -- Don't wrap lines
opt.list = true           -- Show some invisible characters
opt.listchars = {         -- Show characters for tabs and trailing spaces
  tab = "→ ",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "␣",
}

-- File handling
opt.fileencoding = "utf-8" -- Use UTF-8 encoding

-- Miscellaneous
opt.timeoutlen = 500      -- Time to wait for a mapped sequence to complete (ms)
opt.wildignore = "*/node_modules/*,*/dist/*" -- Ignore these directories
