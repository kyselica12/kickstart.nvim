return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    require('lualine').setup {
      options = {
        theme = 'auto',
        globalstatus = true,
        section_separators = '',
        component_separators = '',
        disabled_filetypes = {
          statusline = { 'neo-tree' }, -- Hide statusline in Neo-tree
          winbar = {},
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'diff' }, -- removed 'branch'
        lualine_c = {
          {
            'filename',
            path = 1, -- relative to CWD
          },
        },
        lualine_x = { 'encoding', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { 'neo-tree', 'lazy', 'mason' },
    }
  end,
}
