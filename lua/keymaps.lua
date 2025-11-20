-- Keymaps for Neovim

-- Helper function for mapping keys
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Set leader key to space (also set in init.lua)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize windows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")
map("n", "<leader>bc", ":bd<CR>")  -- Close current buffer
map("n", "<leader>bt", ":bd<CR>")  -- Close current buffer (alternative)

-- Stay in indent mode when indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Keep search terms in the middle
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Better paste - don't overwrite register when pasting over selection
map("v", "p", '"_dP')

-- Clear search highlighting with <leader>h
map("n", "<leader>h", ":nohlsearch<CR>")

-- Quick save and quit
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>Q", ":qa!<CR>")

-- Split window
map("n", "<leader>sv", ":vsplit<CR>") -- Split vertically
map("n", "<leader>sh", ":split<CR>")  -- Split horizontally

-- File explorer (NeoTree)
map("n", "<leader>e", ":Neotree toggle<CR>")
map("n", "<leader>o", ":Neotree focus<CR>")

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")
map("n", "<leader>fb", ":Telescope buffers<CR>")
map("n", "<leader>fh", ":Telescope help_tags<CR>")

-- Terminal toggle (changed to <leader>tt to avoid conflict with tab commands)
map("n", "<leader>tt", ":ToggleTerm<CR>")
map("t", "<Esc>", "<C-\\><C-n>") -- Exit terminal mode

-- LSP related keymaps
-- Will be set in the LSP on_attach function

-- Format code with LSP
map("n", "<leader>lf", ":lua vim.lsp.buf.format({ async = true })<CR>")

-- Diagnostics
map("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>")
map("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>")
map("n", "]d", ":lua vim.diagnostic.goto_next()<CR>")

-- Stay in visual mode when indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Buffer management (what you see in bufferline at the top)
map("n", "<leader>bn", ":enew<CR>")   -- New buffer
map("n", "<leader>bl", ":bnext<CR>")   -- Next buffer
map("n", "<leader>bh", ":bprevious<CR>") -- Previous buffer
map("n", "<leader>bo", ":%bd|e#|bd#<CR>")   -- Close all other buffers

-- Actual Vim tabs management (if you ever use them)
map("n", "<leader>tn", ":tabnew<CR>")   -- New tab
map("n", "<leader>tc", ":tabclose<CR>")  -- Close tab
map("n", "<leader>tl", ":tabnext<CR>")   -- Next tab
map("n", "<leader>th", ":tabprevious<CR>") -- Previous tab

-- Simple character jumping with unused keys (using 's' as base key)
-- Use 's' followed by a character to jump directly to that character
-- Note: This replaces the default 's' functionality (delete character and enter insert mode)
map("n", "s", "f")  -- Jump directly to character
map("x", "s", "f")  -- Jump in visual mode
map("o", "s", "f")  -- Jump in operator-pending mode

-- Navigate to next/previous occurrence of the same character
-- Using dot and comma for next/previous is intuitive and easy to reach
map("n", ".", ";")  -- Next occurrence of the same character
map("n", ",", ",")  -- Previous occurrence of the same character
map("x", ".", ";")  -- Next occurrence in visual mode
map("x", ",", ",")  -- Previous occurrence in visual mode
map("o", ".", ";")  -- Next occurrence in operator-pending mode
map("o", ",", ",")  -- Previous occurrence in operator-pending mode