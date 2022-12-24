-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = 'yes'

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

local keyset = vim.keymap.set

-- Autocomplete
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = { 
  silent = true,
  noremap = true,
  expr = true,
  replace_keycodes = false
 }

keyset('i', '<tab>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? \'<tab>\' : coc#refresh()', opts)
keyset('i', '<s-tab>', [[coc#pum#visible() ? coc#pum#prev(1) : '\<c-h>']], opts)
keyset('i', '<c-j>', [[coc#pum#visible() ? coc#pum#confirm() : '\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>']], opts)

keyset('i', '<c-k>', 'coc#refresh()', { silent = true, expr = true })

keyset('n', 'gd', '<Plug>(coc-definition)', { silent = true })
keyset('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
keyset('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
keyset('n', 'gr', '<Plug>(coc-references)', { silent = true })

function _G.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({  'vim', 'help'  }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end
keyset('n', '<leader>d', '<cmd>lua _G.show_docs()<cr>', { silent = true })

keyset('n', '<leader>e', '<cmd>CocCommand explorer<cr>', { silent = true })
