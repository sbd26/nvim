--Startup Commands
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=300}
  augroup END
]], false)

--Save The folding after laeave
vim.cmd([[
  augroup AutoSaveView
    autocmd!
    autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview
  augroup END
]])
--Open NvimTree while entering a directory
vim.cmd [[
  augroup auto_toggle_file_explorer
    autocmd!
    autocmd BufEnter * if isdirectory(expand('%')) && !exists('b:suppress_netrw') && !&diff | silent! :NvimTreeOpen| endif
  augroup END
]]

--Clear The Search Highlight after inserting into insert Mode
vim.cmd [[
  augroup auto_clear_search_highlight
    autocmd!
    autocmd InsertEnter * silent! :nohlsearch
  augroup END
]]
