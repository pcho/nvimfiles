return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = true,
    event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects', lazy = true, },
      { 'JoosepAlviste/nvim-ts-context-commentstring', lazy = true, },
      { 'windwp/nvim-ts-autotag',                      lazy = true, },
      { 'windwp/nvim-autopairs',                       opts = {},   lazy = true, },
    },
    opts = {
      context_commentstring = {
        enable = true,
      },
      matchup = {
        enable = true,
      },
      ensure_installed = {
        'prisma',
        'lua',
        'json',
        'javascript',
        'tsx',
        'toml',
        'yaml',
        'typescript',
        'markdown',
        'help',
        'vim',
        'bash',
        'html',
        'css',
        'go',
        'python',
        'rust',
      },
      autotag = {
        enable = true,
        filetypes = {
          'html',
          'javascript',
          'typescript',
          'javascriptreact',
          'typescriptreact',
          'tsx',
          'jsx',
        },
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
      pcall(require('nvim-treesitter.install').update({ with_sync = true }))
    end,
  },
}
