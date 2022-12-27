------------------------------------
-- User commands
------------------------------------
vim.api.nvim_create_user_command('ZoomToggle',
function()
  if zoomed then
    vim.fn.execute(zoomed_winrestcmd)
    zoomed = false
  else
    zoomed_winrestcmd = vim.fn.winrestcmd()
    vim.cmd([[ resize ]])
    vim.cmd([[ vertical resize ]])
    zoomed = true
  end
end,
{})

vim.api.nvim_create_user_command('ToggleRelativeLineNumbers',
function(params)
  if params.args == 'on' then
    vim.opt.number = false
    vim.opt.relativenumber = true
  else
    vim.opt.number = true
    vim.opt.relativenumber = false
  end
end,
{ nargs='*' })

------------------------------------
-- Autocommands
------------------------------------
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
