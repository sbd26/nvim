local M = {}

M.treesitter = {
  auto_install = true,
  ensure_installed = {
    "vim",
    "lua",
    "c",
    "cpp",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "codelldb",
    -- c/cpp stuff
    -- "clangd",
    -- "clang-format",
  },
}

return M
