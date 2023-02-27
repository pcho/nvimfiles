return {
  'lukas-reineke/indent-blankline.nvim',
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
