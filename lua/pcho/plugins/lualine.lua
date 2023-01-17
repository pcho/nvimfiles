require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'duskfox',
        component_separators = '',
        section_separators = '',
        disabled_filetypes = {
            statusline = { "undotree", "diff" },
        },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    extensions = { 'quickfix' }
}
