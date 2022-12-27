vim.opt.termguicolors = true
vim.opt.colorcolumn = '80'

vim.cmd([[ colorscheme pencil ]], { silent = true, bang = true })

local options = {
  -- General
  ColorColumn = {
    ctermbg = 235,
    bg = '#262626'
  },

  CursorColumn = {
    link = 'ColorColumn'
  },

  CursorLine = {
    link = 'ColorColumn'
  },

  -- Coc
  CocInfoSign = {
    ctermfg = 03,
    fg = '#a89c14'
  },

  CocInfoHighlight = {
    sp = '#a89c14',
    undercurl = true
  },

  CocWarningSign = {
    ctermfg = 167,
    fg = '#d75f5f'
  },

  CocWarningHighlight = {
    sp = '#d75f5f',
    undercurl = true
  },

  CocErrorSign = {
    ctermfg = 01,
    fg = '#c30771'
  },

  CocErrorHighlight = {
    sp = '#e32791',
    undercurl = true
  },

  CocHintSign = {
    ctermfg = 01,
    fg = '#008ec4',
  },

  CocHintHighlight = {
    sp = '#008ec4',
    undercurl = true
  },

  CocInfoFloat = {
    ctermfg = 251,
    fg = '#c6c6c6'
  },

  CocWarningFloat = {
    link = 'CocInfoFloat'
  },

  CocErrorFloat = {
    link = 'CocInfoFloat'
  },

  CocGitAdd = {
    ctermfg = 2,
    fg = '#10a778'
  },

  CocGitChange = {
    ctermfg = 3,
    fg = '#a89c14'
  },

  CocGitDelete = {
    ctermfg = 9,
    fg = '#e32791'
  },

  CocGitDeleteChange = {
    link = 'CocGitDelete'
  },

  -- Taboo
  TabLine = {
    ctermfg = 238,
    ctermbg = 235,
    fg = '#444444',
    bg = '#262626'
  },

  TabLineFill = {
    ctermfg = 235,
    ctermbg = 235,
    fg = '#262626',
    bg = '#262626'
  },

  TabLineSel = {
    ctermfg = 2,
    fg = '#10a778'
  }
}

function set_highlight(options)
  for k, v in pairs(options) do
    vim.api.nvim_set_hl(0, k, v)
  end
end

set_highlight(options)
