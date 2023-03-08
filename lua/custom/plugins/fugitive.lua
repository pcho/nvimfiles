return {
  'tpope/vim-fugitive',
  lazy = true,
  keys = {
    { '<leader>gs', '<Cmd>Git<cr>' },
    { '<leader>gm', '<Cmd>Git push -u origin master<cr>' },
    { '<leader>gp', '<Cmd>Git push -u origin ' },
    { '<leader>gr', '<Cmd>Git reset HEAD~1 --soft<cr>' },
  }
}
