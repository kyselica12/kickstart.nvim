local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

function OpenFloatingTerm(opts)
  opts = opts or {}
  -- Calculate 80% of the editor size
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)

  -- Center the floating window
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Create a new buffer (scratch buffer)
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
    -- vim.api.nvim_open_term(buf)
  end

  -- Define window options
  local opts = {
    style = 'minimal',
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    border = 'rounded',
  }

  local win = vim.api.nvim_open_win(buf, true, opts)

  return { buf = buf, win = win }
end

function ToogleFloatingTerm()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = OpenFloatingTerm { buf = state.floating.buf }
    if vim.bo[state.floating.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
    end
    vim.cmd 'startinsert'
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

vim.api.nvim_create_user_command('FloatWindow', function()
  local buf, win = OpenFloatingTerm()
end, {})

-- Map <leader>t to toggle the terminal
vim.keymap.set('n', '<C-\\>', ToogleFloatingTerm, { desc = 'Toggle Terminal' })
vim.keymap.set('i', '<C-\\>', ToogleFloatingTerm, { desc = 'Toggle Terminal' })
vim.keymap.set('t', '<C-\\>', ToogleFloatingTerm, { desc = 'Toggle Terminal' })
