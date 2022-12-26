local actions = require('telescope.actions')
local action_layout = require("telescope.actions.layout")
local builtin = require('telescope.builtin')

require('telescope').setup{
  defaults = {
    sorting_strategy = "ascending",
    scroll_strategy = "limit",
    layout_config = {
      prompt_position = "top"
    },
    mappings = {
      n = {
        ["<c-p>"] = action_layout.toggle_preview
      },
      i = {
        ["<esc>"] = actions.close,
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
        ["<c-p>"] = action_layout.toggle_preview,
        ["<c-h>"] = "which_key"
      }
    }
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
    },
  }
}

vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>s', function()
  builtin.grep_string({ search = vim.fn.input("Rg > ") })
end)
