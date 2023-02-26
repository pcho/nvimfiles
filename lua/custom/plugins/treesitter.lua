return {
    "windwp/nvim-ts-autotag",
    "JoosepAlviste/nvim-ts-context-commentstring",
    { "windwp/nvim-autopairs", opts = {} },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context",
        },
        opts = {
            context_commentstring = {
                enable = true,
            },
            matchup = {
                enable = true,
            },
            ensure_installed = {
                "prisma",
                "lua",
                "json",
                "javascript",
                "tsx",
                "toml",
                "yaml",
                "typescript",
                "markdown",
                "help",
                "vim",
                "bash",
                "html",
                "css",
                "go",
                "python",
                "rust",
            },
            autotag = {
                enable = true,
                filetypes = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "tsx", "jsx" },
            },
            highlight = { enable = true },
            indent = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
            pcall(require("nvim-treesitter.install").update { with_sync = true })
        end,
    },
}
