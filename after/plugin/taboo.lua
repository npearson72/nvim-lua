vim.g.taboo_tab_format = ' %f '

vim.api.nvim_set_hl(0, 'TabLine', {
  ctermfg = 238,
  ctermbg = 235,
  fg = '#444444',
  bg = '#262626'
})

vim.api.nvim_set_hl(0, 'TabLineFill', {
  ctermfg = 235,
  ctermbg = 235,
  fg = '#262626',
  bg = '#262626'
})

vim.api.nvim_set_hl(0, 'TabLineSel', {
  ctermfg = 2,
  ctermbg = nil,
  fg = '#10a778',
  bg = nil
})
