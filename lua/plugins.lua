-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })

  vim.cmd([[packadd packer.nvim]])
end

require('packer').startup(function(use)
  -- Package manager
  use({ 'wbthomason/packer.nvim' })

  -- UI/UX
  use({ 'preservim/vim-colors-pencil' })
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  })
  use({ 'gcmt/taboo.vim' })

  -- Syntax highlighting
  use({ 'kchmck/vim-coffee-script' })

  -- File management, search, navigation
  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    }
  })

  -- Autocompletion
  use({ 'github/copilot.vim' })
  use({ 'neoclide/coc.nvim', branch = 'release' })

  -- Formatters, selectors, accelerators
  use({ 'godlygeek/tabular' })
  use({ 'mbbill/undotree' })
  use({ 'tpope/vim-commentary' })
  use({ 'tpope/vim-endwise' })
  use({ 'tpope/vim-projectionist' })
  use({ 'tpope/vim-surround' })
  use({ 'mg979/vim-visual-multi', branch = 'master' })

  -- Git
  use({ 'tpope/vim-fugitive' })

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end
