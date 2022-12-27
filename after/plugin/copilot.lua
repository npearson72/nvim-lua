vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.keymap.set('i', '<c-l>', [[copilot#Accept('\<cr>')]], {
  silent = true,
  script = true,
  expr = true
})
