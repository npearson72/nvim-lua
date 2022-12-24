vim.opt.termguicolors = true

vim.cmd([[ colorscheme pencil ]])

-- Coc

vim.api.nvim_set_hl(0, 'CocInfoSign', {
  ctermfg = 03,
  ctermbg = nil,
  fg = '#a89c14',
  bg = nil
})

vim.api.nvim_set_hl(0, 'CocWarningSign', {
  ctermfg = 167,
  ctermbg = nil,
  fg = '#d75f5f',
  bg = nil
})

vim.api.nvim_set_hl(0, 'CocErrorSign', {
  ctermfg = 01,
  ctermbg = nil,
  fg = '#c30771',
  bg = nil
})

vim.api.nvim_set_hl(0, 'CocHintSign', {
  ctermfg = 01,
  ctermbg = nil,
  fg = '#008ec4',
  bg = nil
})

vim.api.nvim_set_hl(0, 'CocInfoHighlight', {
  sp = '#a89c14',
  undercurl = true
})

vim.api.nvim_set_hl(0, 'CocWarningHighlight', {
  sp = '#d75f5f',
  undercurl = true
})

vim.api.nvim_set_hl(0, 'CocErrorHighlight',  {
  sp = '#e32791',
  undercurl = true
})

vim.api.nvim_set_hl(0, 'CocHintHighlight',  {
  sp = '#008ec4',
  undercurl = true
})

vim.api.nvim_set_hl(0, 'CocInfoFloat', {
  ctermfg = 251,
  ctermbg = nil,
  fg = '#c6c6c6',
  bg = nil
})

vim.api.nvim_set_hl(0, "CocWarningFloat", { link = "CocInfoFloat" })
vim.api.nvim_set_hl(0, "CocErrorFloat", { link = "CocInfoFloat" })

vim.api.nvim_set_hl(0, 'CocGitAdd', {
  ctermfg = 2,
  ctermbg = nil,
  fg = '#10a778',
  bg = nil
})

vim.api.nvim_set_hl(0, 'CocGitChange', {
  ctermfg = 3,
  ctermbg = nil,
  fg = '#a89c14',
  bg = nil
})

vim.api.nvim_set_hl(0, 'CocGitDelete', {
  ctermfg = 9,
  ctermbg = nil,
  fg = '#e32791',
  bg = nil
})

vim.api.nvim_set_hl(0, 'CocGitDeleteChange', { link = CocGitDelete } )


-- Taboo

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
