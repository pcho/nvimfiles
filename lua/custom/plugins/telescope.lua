return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            pickers = {
                find_files = {
                    find_command = {
                        "rg",
                        "--files",
                        "--hidden",
                        "--ignore",
                        "-u",
                        "--glob=!**/.git/*",
                        "--glob=!**/node_modules/*",
                        "--glob=!**/.next/*",
                    },
                },
            },
        },
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
            return vim.fn.executable("make") == 1
        end,
    },
}
