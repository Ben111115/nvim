-- LSP Configuration
-- Set up Mason to manage LSP servers
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- Ensure TypeScript language server is installed separately via Mason
local mason_registry = require("mason-registry")
local function ensure_ts_installed()
  if not mason_registry.is_installed("typescript-language-server") then
    vim.notify("Installing typescript-language-server...", vim.log.levels.INFO)
    local ts_pkg = mason_registry.get_package("typescript-language-server")
    ts_pkg:install():once("closed", function()
      vim.notify("typescript-language-server installed successfully!", vim.log.levels.INFO)
    end)
  end
end

-- Attempt to install TypeScript server, capture errors gracefully
pcall(ensure_ts_installed)

-- Set up Mason-lspconfig
require("mason-lspconfig").setup({
  -- Ensure these servers are automatically installed and set up
  ensure_installed = {
    "gopls",            -- Go
    "html",             -- HTML
    "cssls",            -- CSS
    "angularls",        -- Angular
    "jdtls",            -- Java
    "jsonls",           -- JSON
    "lua_ls",           -- Lua
    "emmet_ls",         -- Emmet
    -- Note: TypeScript server will be installed separately
  },
  automatic_installation = true,
})

-- Custom on_attach function for LSP servers
-- This function is run when an LSP connects to a particular buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Define buffer-local mappings for LSP functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, bufopts)

  -- Set up document highlighting
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_clear_autocmds { group = "lsp_document_highlight", buffer = bufnr }
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = vim.lsp.buf.document_highlight,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Document Highlight",
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Clear All the References",
    })
  end
end

-- nvim-cmp supports additional completion capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Set up individual LSP servers with specific settings
local lspconfig = require('lspconfig')

-- Configure each language server
-- Go
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

-- TypeScript/JavaScript (using ts_ls instead of deprecated tsserver)
lspconfig.typescript.setup { -- Use typescript (ts_ls) instead of tsserver
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      }
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      }
    }
  }
}

-- HTML
lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "htmldjango" },
}

-- CSS
lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Angular
lspconfig.angularls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Java
lspconfig.jdtls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- JSON
lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    json = {
      -- Remove schemastore dependency since it's not installed
      -- schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}

-- Emmet
lspconfig.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "vue", "svelte" },
}

-- Setup diagnostic signs (using modern method instead of sign_define)
local icons = { Error = " ", Warn = " ", Hint = " ", Info = " " }
local diagnostics = {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.Error,
      [vim.diagnostic.severity.WARN] = icons.Warn,
      [vim.diagnostic.severity.INFO] = icons.Info,
      [vim.diagnostic.severity.HINT] = icons.Hint,
    },
  },
}

-- Configure diagnostic display
vim.diagnostic.config({
  virtual_text = true,
  signs = diagnostics.signs,  -- Use our custom signs
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

-- Add border to hover and signature help
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "rounded" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "rounded" }
)