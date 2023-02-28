return {
  'sindrets/diffview.nvim',
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
    vim.keymap.set('n', '<leader>df', '<Cmd>DiffviewOpen<cr>', {})
    vim.keymap.set('n', '<leader>dc', '<Cmd>DiffviewClose<cr>', {})
  end,
}
