-- nvim-cmp setup
local cmp = require 'cmp'
-- local luasnip = require 'luasnip'

cmp.setup {
  -- snippet = {
  --   expand = function(args)
  --     luasnip.lsp_expand(args.body)
  --   end,
  -- },
  mapping = cmp.mapping.preset.insert {
    ['<up>'] = cmp.mapping.scroll_docs(-4),
    ['<down>'] = cmp.mapping.scroll_docs(4),
    -- ['<c-space>'] = cmp.mapping.complete(),
    ['<c-j>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        -- elseif luasnip.expand_or_jumpable() then
        --   luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<s-tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
        -- elseif luasnip.jumpable(-1) then
        --   luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

vim.keymap.set('i', '<c-k>', cmp.complete, { silent = true })
