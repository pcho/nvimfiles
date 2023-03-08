return {
  'lukas-reineke/indent-blankline.nvim',
  lazy = true,
  event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
  opts = {
    use_treesitter = true,
    buftype_exclude = { 'terminal', 'nofile' },
    filetype_exclude = {
      'log',
      'fugitive',
      'gitcommit',
      'markdown',
      'txt',
      'help',
      'NvimTree',
      'git',
      'undotree',
      '',
    },
  },
}
