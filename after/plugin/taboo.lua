vim.g.taboo_tab_format = ' %f '

-- Tabs
vim.keymap.set('n', 't', '<esc>:tabnew<cr>')
vim.keymap.set('n', 'T', '<esc><c-w>T')
vim.keymap.set('n', '{', '<esc>gT')
vim.keymap.set('n', '}', '<esc>gt')
