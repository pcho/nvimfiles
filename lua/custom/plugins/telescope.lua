return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-ui-select.nvim",
                config = function()
                    require("telescope").load_extension "ui-select"
                end,
            },
        },
        config = function()
            require("telescope").setup {
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = require("telescope.actions").close,
                        },
                    },
                },
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
            }
            local builtin = require "telescope.builtin"

            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")

            vim.keymap.set("n", "<leader>d", builtin.oldfiles, {})
            vim.keymap.set("n", "<leader>b", builtin.buffers, {})
            vim.keymap.set("n", "<leader>q", builtin.diagnostics, {})
            vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", {})
            vim.keymap.set("n", "<c-p>", builtin.find_files, {})
            vim.keymap.set("n", "<leader>h", builtin.help_tags, {})
            vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
            return vim.fn.executable "make" == 1
        end,
    },
}
