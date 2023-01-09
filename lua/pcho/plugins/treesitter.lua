require('nvim-treesitter.configs').setup {
    ensure_installed = { 'prisma', 'lua', 'json', 'javascript', 'tsx', 'toml', 'yaml', 'typescript', 'help', 'vim', 'bash', 'html', 'css', 'bash' },
    autotag = {
        enable = true,
        filetypes = { 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'tsx', 'jsx', },
    },
    highlight = { enable = true },
    indent = { enable = true },
}
