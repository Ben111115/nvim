-- Main init file for Neovim configuration
-- Author: [Your Name]
-- Date: October 2023

-- Bootstrap lazy.nvim plugin manager if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key to space (before lazy setup)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set options and keymaps first
require("options")    -- General Neovim options
require("keymaps")    -- Key mappings

-- Load plugins before LSP
require("lazy").setup(require("plugins")) -- Plugins

-- Load LSP configuration after plugins are loaded
-- Uncomment after first run of plugins installation
require("lsp")