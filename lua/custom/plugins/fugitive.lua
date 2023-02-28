return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gs', '<Cmd>Git<cr>')
    vim.keymap.set('n', '<leader>gm', '<Cmd>Git push -u origin master<cr>')
    vim.keymap.set('n', '<leader>gp', '<Cmd>Git push -u origin ')
    vim.keymap.set('n', '<leader>gr', '<Cmd>Git reset HEAD~1 --soft<cr>')
  end,
}
