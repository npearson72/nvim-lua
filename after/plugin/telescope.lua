local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

require('telescope').setup{
  defaults = {
    layout_strategy = 'horizontal',
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous
      }
    }
  }
}
