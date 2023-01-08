require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'json', 'javascript', 'toml', 'yaml', 'typescript', 'help', 'vim', 'bash', 'html', 'css' },
    highlight = { enable = true },
    indent = { enable = true },
}
