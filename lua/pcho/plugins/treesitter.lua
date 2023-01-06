require('nvim-treesitter.configs').setup {
    ensure_installed = { 'go', 'lua', 'json', 'javascript', 'toml', 'yaml', 'python', 'rust', 'typescript', 'help', 'vim',
        'bash', 'html', 'css' },

    highlight = { enable = true },
    indent = { enable = true, disable = { 'python' } },
}

