vim.g.mapleader = ','

-- Movement
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<s-j>', '<c-d>')
vim.keymap.set('n', '<s-k>', '<c-u>')
vim.keymap.set('n', '<c-j>', '}')
vim.keymap.set('n', '<c-k>', '{')
vim.keymap.set('n', '<c-h>', '^')
vim.keymap.set('n', '<c-l>', '$')
vim.keymap.set('v', '<c-h>', '^')
vim.keymap.set('v', '<c-l>', '$')

-- Windows
vim.keymap.set('n', 'wl', '<c-w>l')
vim.keymap.set('n', 'wh', '<c-w>h')
vim.keymap.set('n', 'wj', '<c-w>j')
vim.keymap.set('n', 'wk', '<c-w>k')
vim.keymap.set('n', 'w=', '<c-w>=')
vim.keymap.set('n', 'wL', '<c-w>L')
vim.keymap.set('n', 'wH', '<c-w>H')
vim.keymap.set('n', 'wJ', '<c-w>J')
vim.keymap.set('n', 'wK', '<c-w>K')
vim.keymap.set('n', 'ws', '<c-w>x')
vim.keymap.set('n', 'wr', '<c-w>r')
vim.keymap.set('n', 'wR', '<c-w>R')
vim.keymap.set('n', 'wo', ':ZoomToggle<cr>')
