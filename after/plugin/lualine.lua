local function readonly()
  if vim.bo.readonly then
    return ''
  else
    return ''
  end
end

local function position()
  return [[%l/%L:%c  %p%%]]
end

local colors = {
  black      = '#262626',
  light_gray = '#767676',
  dark_gray  = '#424242',
  orange     = '#d75f5f',
  red        = '#c30771',
}

local pencil_dark = {
  normal = {
    a = { fg = colors.light_gray, bg = colors.black },
    b = { fg = colors.light_gray, bg = colors.black },
    c = { fg = colors.light_gray, bg = colors.black },
  },

  inactive = {
    a = { fg = colors.dark_gray, bg = colors.black },
    b = { fg = colors.dark_gray, bg = colors.black },
    c = { fg = colors.dark_gray, bg = colors.black },
  },
}

require('lualine').setup {
  options = {
    theme = pencil_dark,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
        symbols = {
          readonly = ''
        },
      }
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = { 'fileformat', 'fileencoding', 'filetype', position },
    lualine_z = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic', 'coc' },
        sections = { 'error', 'warn' },
        diagnostics_color = {
          error = { fg = colors.black, bg = colors.red },
          warn = { fg = colors.black, bg = colors.orange },
        },
        symbols = {error = 'E', warn = 'W'},
        colored = true,
        update_in_insert = false,
        always_visible = false,
      }
    },
  },
  inactive_sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
        symbols = {
          readonly = ''
        }
      }
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic', 'coc' },
        sections = { 'error', 'warn' },
        diagnostics_color = {
          error = { fg = colors.black, bg = colors.red },
          warn = { fg = colors.black, bg = colors.orange },
        },
        symbols = {error = 'E', warn = 'W'},
        colored = true,
        update_in_insert = false,
        always_visible = false,
      }
    },
  },
  tabline = {},
  extensions = {},
}
