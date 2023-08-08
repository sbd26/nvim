---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>w"] = {
      ":w <CR>",
      "Save Current Buffer",
    },
    ["<leader>q"] = {
      ":q <CR>",
      "Quit From Current Buffer",
    },
    ["<leader>p"] = { ":%y+<cr>", "Copy to clipboard" },
    ["<leader>s"] = { ":wq <CR>", "Save and Quit" },
    ["<leader>fq"] = { ":q! <CR>", "Force Quit" },
    ["<leader>fr"] = { ":luafile % <CR>", "Refresh LuaFile" },
    ["<Esc>"] = { ":noh <CR>", "Clear Search Result" },

    ["<C-h>"] = { "<C-w>h", "window left" },
    ["<C-l>"] = { "<C-w>l", "window right" },
    ["<C-j>"] = { "<C-w>j", "window down" },
    ["<C-k>"] = { "<C-w>k", "window up" },
    ["<leader>k"] = { ":BufferCloseBuffersLeft <CR>", "window up" },
    ["<leader>ct"] = { ":tabnew <CR>", "Create New Tab" },
    ["<leader>sm"] = { ":ShowMappings <CR>", "Show All Mappings" },
    ["<leader>md"] = {":m .+1 <CR>" , "+1"},
    ["<leader>mu"] = {":m .-2 <CR>" , "+1"},
  },
}

M.competitive = {
  plugin = true,
  n = {
    ["<leader>cta"] = { ":CompetiTestAdd <CR>", "Add TestCase" },
    ["<leader>ctr"] = { ":CompetiTest receive <CR>", "Recieve Test Case" },
    ["<leader>cr"] = { ":CompetiTestRun<cr>", "TestCaseRun" },
  },
}


M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {":DapToggleBreakpoint <CR>", "Add BreakPoint"},
    ["<leader>dr"] = {":DapContinue <CR>", "Continue The Dap"},
  }
}


return M
