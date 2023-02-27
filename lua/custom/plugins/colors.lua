return {
  'EdenEast/nightfox.nvim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('duskfox')
  end,
  opts = {
    options = {
      transparent = false,
      dim_inactive = false,
    },
    palettes = {
      duskfox = {
        bg1 = '#13111C',
      },
    },
  },
}
