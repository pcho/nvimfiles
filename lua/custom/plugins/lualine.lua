return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            icons_enabled = true,
            theme = "duskfox",
            component_separators = "",
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = { "undotree", "diff" },
            },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { "filename" },
            lualine_x = { "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        extensions = { "quickfix", "fugitive", "nvim-tree", "man" },
    },
}
