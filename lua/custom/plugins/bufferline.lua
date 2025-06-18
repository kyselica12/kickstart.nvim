return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers', -- can be "tabs" if you prefer
        separator_style = 'slant', -- or "thick", "thin", etc.
        diagnostics = 'nvim_lsp',
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            text_align = 'center',
            separator = true,
          },
        },
      },
    }
    vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>', { silent = true, desc = 'Next buffer' })
    vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>', { silent = true, desc = 'Previous buffer' })
  end,
}
