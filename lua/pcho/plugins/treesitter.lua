require('nvim-treesitter.configs').setup {
    matchup = {
        enable = true,
    },
    ensure_installed = { 'prisma', 'lua', 'json', 'javascript', 'tsx', 'toml', 'yaml', 'typescript', 'help', 'vim', 'bash', 'html', 'css', 'go', 'python', 'rust', },
    autotag = {
        enable = true,
        filetypes = { 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'tsx', 'jsx', },
    },
    highlight = { enable = true },
    indent = { enable = true },
}
