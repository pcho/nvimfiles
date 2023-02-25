return {
    "nvim-tree/nvim-tree.lua",
    version = "nightly",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        update_focused_file = { enable = true },
        hijack_cursor = true,
        reload_on_bufenter = true,
        view = {
            cursorline = false,
            mappings = {
                list = {
                    { key = { "l", "h" }, action = "expand" },
                    { key = "s",          action = "split" },
                    { key = "v",          action = "vsplit" },
                    { key = "t",          action = "tabnew" },
                    { key = "r",          action = "refresh" },
                    { key = "c",          action = "create" },
                    { key = "D",          action = "remove" },
                    { key = "R",          action = "rename" },
                },
            },
        },
        renderer = {
            highlight_git = true,
            indent_markers = {
                enable = true,
                inline_arrows = true,
                icons = {
                    corner = "└",
                    edge = "│",
                    item = "│",
                    bottom = "─",
                    none = " ",
                },
            },
            icons = {
                glyphs = {
                    git = {
                        unstaged = "",
                        staged = "",
                        unmerged = "",
                        renamed = "",
                        untracked = "",
                        deleted = "",
                    },
                },
            },
        },
        actions = {
            open_file = {
                quit_on_open = true,
                resize_window = true,
            },
        },
    },
    config = function(_, opts)
        require("nvim-tree").setup(opts)
        vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle, { silent = true })
    end,
}
