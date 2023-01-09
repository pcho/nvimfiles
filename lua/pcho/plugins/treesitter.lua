require('nvim-treesitter.configs').setup {
    ensure_installed = { 'prisma', 'lua', 'json', 'javascript', 'toml', 'yaml', 'typescript', 'help', 'vim', 'bash', 'html', 'css', 'bash' },
    highlight = { enable = true },
    indent = { enable = true },
}
