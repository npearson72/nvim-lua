------------------------------------
-- Globals
------------------------------------
vim.g.coc_config_home = "$HOME/.dots/ansible/roles/neovim/files"

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
  'coc-solargraph',
  'coc-styled-components',
  'coc-snippets',
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
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function show_docs()
  local cw = vim.fn.expand('<cword>')

  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

------------------------------------
-- Commands
------------------------------------
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
vim.api.nvim_create_user_command("OrganizeImports", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

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

vim.keymap.set('i', '<tab>', [[coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? '<tab>' : coc#refresh()]], opts)
vim.keymap.set('i', '<s-tab>', [[coc#pum#visible() ? coc#pum#prev(1) : '\<c-h>']], opts)
vim.keymap.set('i', '<c-j>', [[coc#pum#visible() ? coc#pum#confirm() : '\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>']], opts)

vim.keymap.set('i', '<c-k>', 'coc#refresh()', { silent = true, expr = true })

vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })

vim.keymap.set('n', '<leader>d', show_docs, { silent = true })
vim.keymap.set("n", "<leader>a", "<Plug>(coc-codeaction)", { silent = true, nowait = true })

-- Coc Explorer
vim.keymap.set('n', '<leader>e', '<cmd>CocCommand explorer<cr>', { silent = true })
