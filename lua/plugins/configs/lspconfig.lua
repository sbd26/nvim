require "nvchad.lsp"
require("lspconfig").lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  hint = {enable = true},
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}
local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "tsserver"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    hint = {enable = true},
  }
end

lspconfig.clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--header-insertion=never",
  },
  hint = {enable = true},
}
