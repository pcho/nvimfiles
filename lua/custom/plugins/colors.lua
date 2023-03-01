return {
  'EdenEast/nightfox.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('nightfox').setup({
      options = {
        transparent = false,
        dim_inactive = false,
      },
      palettes = {
        duskfox = {
          bg1 = '#13111c',
          bg3 = '#1d1a36',
        },
      },
      groups = {
        all = {
          IncSearch = {
            bg = "palette.green",
            fg = "palette.bg1"
          },
          Search = {
            bg = "palette.green",
            fg = "palette.bg1"
          },
          CurSearch = {
            bg = "palette.green",
            fg = "palette.bg1"
          },
        },
      }
    })
    vim.cmd.colorscheme('duskfox')
  end,
}
