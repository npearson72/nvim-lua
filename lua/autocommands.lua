vim.cmd([[
augroup CursorLine
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter,CursorMoved * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

augroup CursorColumn
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter,CursorMoved * setlocal cursorcolumn
  autocmd WinLeave * setlocal nocursorcolumn
augroup END
]])


vim.cmd([[
augroup ToggleRelativeLineNumbersOff
  autocmd!
  autocmd InsertEnter,TextYankPost,CmdlineLeave * ToggleRelativeLineNumbers off
augroup END
]])
