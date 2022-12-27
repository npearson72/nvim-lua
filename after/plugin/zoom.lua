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

vim.keymap.set('n', 'wo', ':ZoomToggle<cr>', { silent = true })
