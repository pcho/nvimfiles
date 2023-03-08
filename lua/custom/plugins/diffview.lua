return {
  'sindrets/diffview.nvim',
  lazy = true,
  keys = {
    { '<leader>df', '<Cmd>DiffviewOpen<cr>' },
    { '<leader>dc', '<Cmd>DiffviewClose<cr>' },
  },
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    require('diffview').setup({
      file_panel = {
        win_config = {
          position = 'bottom',
          height = 12,
        },
      },
    })
  end,
}
