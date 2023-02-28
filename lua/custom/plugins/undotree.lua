return {
  'mbbill/undotree',
  config = function()
    vim.keymap.set('n', '<leader>s', '<Cmd>UndotreeToggle<cr>')
  end,
}
