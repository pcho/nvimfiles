return {
  'christoomey/vim-tmux-navigator',
  event = 'VeryLazy',
  config = function()
    vim.keymap.set('n', '<c-j>', '<c-w><c-j>')
    vim.keymap.set('n', '<c-k>', '<c-w><c-k>')
    vim.keymap.set('n', '<c-l>', '<c-w><c-l>')
    vim.keymap.set('n', '<c-h>', '<c-w><c-h>')
    vim.keymap.set('n', '<c-h>', '<Cmd>TmuxNavigateLeft<cr>', { silent = true })
    vim.keymap.set('n', '<c-j>', '<Cmd>TmuxNavigateDown<cr>', { silent = true })
    vim.keymap.set('n', '<c-k>', '<Cmd>TmuxNavigateUp<cr>', { silent = true })
    vim.keymap.set('n', '<c-l>', '<Cmd>TmuxNavigateRight<cr>', { silent = true })
  end,
}
