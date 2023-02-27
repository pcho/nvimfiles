return {
  'christoomey/vim-tmux-navigator',
  config = function()
    vim.keymap.set('n', '<c-j>', '<c-w><c-j>')
    vim.keymap.set('n', '<c-k>', '<c-w><c-k>')
    vim.keymap.set('n', '<c-l>', '<c-w><c-l>')
    vim.keymap.set('n', '<c-h>', '<c-w><c-h>')
    vim.keymap.set('n', '<c-h>', vim.cmd.TmuxNavigateLeft, { silent = true })
    vim.keymap.set('n', '<c-j>', vim.cmd.TmuxNavigateDown, { silent = true })
    vim.keymap.set('n', '<c-k>', vim.cmd.TmuxNavigateUp, { silent = true })
    vim.keymap.set('n', '<c-l>', vim.cmd.TmuxNavigateRight, { silent = true })
  end,
}
