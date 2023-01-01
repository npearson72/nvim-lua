------------------------------------
-- Globals
------------------------------------
vim.g.coc_config_home = '$HOME/.dots/ansible/roles/neovim/files'

vim.g.python_host_prog = '/usr/bin/python'
vim.g.python_host_prog3 = '/usr/local/bin/python3'

vim.g.coc_global_extensions = {
  'coc-css',
  'coc-emmet',
  'coc-emoji',
  'coc-eslint',
  'coc-explorer',
  'coc-git',
  'coc-html',
  'coc-json',
  'coc-prettier',
  'coc-prisma',
  'coc-snippets',
  'coc-solargraph',
  'coc-styled-components',
  'coc-sumneko-lua',
  'coc-tsserver',
  'coc-vetur',
}

------------------------------------
-- Settings
------------------------------------
vim.opt.updatetime = 300
vim.opt.signcolumn = 'yes'

------------------------------------
-- Functions
------------------------------------
local function show_docs()
  local cw = vim.fn.expand('<cword>')

  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

local function _check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local function pum_next()
  if vim.api.nvim_eval('coc#pum#visible()') then
    return vim.api.nvim_eval('coc#pum#next(1)')
  elseif _check_back_space() then
    return '<tab>'
  else
    vim.api.nvim_eval('coc#refresh()')
  end
end

local function pum_prev()
  if vim.api.nvim_eval('coc#pum#visible()') then
    return vim.api.nvim_eval('coc#pum#prev(1)')
  else
    return '<c-h>'
  end
end

local function pum_confirm()
  if vim.api.nvim_eval('coc#pum#visible()') then
    return vim.api.nvim_eval('coc#pum#confirm()')
  else
    return '<c-g>u<cr><c-r>=coc#on_enter()<cr>'
  end
end

------------------------------------
-- Commands
------------------------------------
vim.api.nvim_create_user_command('Format', [[call CocAction('format')]], {})
vim.api.nvim_create_user_command(
  'OrganizeImports',
  [[call CocActionAsync('runCommand', 'editor.action.organizeImport')]],
  {}
)

------------------------------------
-- Mappings
------------------------------------

-- Autocomplete
local opts = {
  silent = true,
  noremap = true,
  expr = true,
  replace_keycodes = false
}

vim.keymap.set('i', '<tab>', pum_next, opts)
vim.keymap.set('i', '<s-tab>', pum_prev, opts)
vim.keymap.set('i', '<c-j>', pum_confirm, opts)

vim.keymap.set('i', '<c-k>', 'coc#refresh()', { silent = true, expr = true })

vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })

vim.keymap.set('n', '<leader>d', show_docs, { silent = true })
vim.keymap.set('n', '<leader>a', '<Plug>(coc-codeaction)', {
  silent = true,
  nowait = true
})

-- Coc Explorer
vim.keymap.set('n', '<leader>e', '<cmd>CocCommand explorer<cr>', {
  silent = true
})
