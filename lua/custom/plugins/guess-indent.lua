return {
  'nmac427/guess-indent.nvim',
  lazy = true,
  event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
  opts = {
    buftype_exclude = {
      'nvimtree',
    },
  },
}
