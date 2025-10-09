-- Toggle Terminal Configuration
require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

-- Terminal keymaps
local Terminal = require("toggleterm.terminal").Terminal

-- Function to create terminals
local function create_terminal(opts)
  return Terminal:new(opts)
end

-- Create some predefined terminals
local lazygit = create_terminal({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
})

-- Function to toggle lazygit terminal
function _G.toggle_lazygit()
  lazygit:toggle()
end

-- Create mappings for these terminals
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua toggle_lazygit()<CR>", {noremap = true, silent = true})

-- Add custom terminal functions to _G
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- Auto-command to set terminal keymaps when terminal opens
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')