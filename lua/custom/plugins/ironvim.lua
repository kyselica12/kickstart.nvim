return {
  'Vigemus/iron.nvim',
  config = function()
    local iron = require 'iron.core'

    iron.setup {
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Whether the repl buffer is a "buffer" or a "window"
        repl_definition = {
          python = {
            command = { 'ipython' }, -- Or use "python" or "bpython"
          },
          lua = {
            command = { 'lua' },
          },
        },
        repl_open_cmd = require('iron.view').split.vertical.botright(0.4),
      },
      keymaps = {
        send_motion = '<space>sc',
        visual_send = '<space>sc',
        send_file = '<space>sf',
        send_line = '<space>sl',
        send_mark = '<space>sm',
        mark_motion = '<space>mc',
        mark_visual = '<space>mc',
        remove_mark = '<space>md',
        cr = '<space>s<cr>',
        interrupt = '<space>s<space>',
        exit = '<space>sq',
        clear = '<space>cl',
      },
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true,
    }
  end,
}
