local actions = require('telescope.actions')
local action_layout = require('telescope.actions.layout')
local action_state = require('telescope.actions.state')
local builtin = require('telescope.builtin')

local pickers = {
  builtin.find_files,
  builtin.oldfiles,
  index = 1,
}

pickers.cycle = function()
  if pickers.index >= #pickers then
    pickers.index = 1
  else
    pickers.index = pickers.index + 1
  end
  pickers[pickers.index]({
    default_text = action_state.get_current_line()
  })
end

pickers.close = function(prompt_bufnr)
  pickers.index = 1
  actions.close(prompt_bufnr)
end

pickers.select_default = function(prompt_bufnr)
  pickers.index = 1
  actions.select_default(prompt_bufnr, 'default')
end

pickers.select_tab = function(prompt_bufnr)
  pickers.index = 1
  actions.select_tab(prompt_bufnr, 'default')
end

pickers.select_vertical = function(prompt_bufnr)
  pickers.index = 1
  actions.select_vertical(prompt_bufnr, 'default')
end

pickers.select_horizontal = function(prompt_bufnr)
  pickers.index = 1
  actions.select_horizontal(prompt_bufnr, 'default')
end

require('telescope').setup {
  defaults = {
    sorting_strategy = 'ascending',
    scroll_strategy = 'limit',
    layout_config = {
      prompt_position = 'top'
    },
    mappings = {
      i = {
        ['<c-f>'] = {
          pickers.cycle,
          type = 'action',
          opts = { nowait = true, silent = true }
        },
        ['<esc>'] = {
          pickers.close,
          type = 'action',
          opts = { nowait = true, silent = true }
        },
        ['<cr>'] = {
          pickers.select_default,
          type = 'action',
          opts = { nowait = true, silent = true }
        },
        ['<c-t>'] = {
          pickers.select_tab,
          type = 'action',
          opts = { nowait = true, silent = true }
        },
        ['<c-v>'] = {
          pickers.select_vertical,
          type = 'action',
          opts = { nowait = true, silent = true }
        },
        ['<c-s>'] = {
          pickers.select_horizontal,
          type = 'action',
          opts = { nowait = true, silent = true }
        },
        ['<c-j>'] = actions.move_selection_next,
        ['<c-k>'] = actions.move_selection_previous,
        ['<c-p>'] = action_layout.toggle_preview,
        ['<c-h>'] = 'which_key'
      }
    }
  },
  pickers = {
    find_files = {
      find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' }
    },
  }
}

vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>s', function()
  builtin.grep_string({ search = vim.fn.input('Rg > ') })
end)
