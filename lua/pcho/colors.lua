require('nightfox').setup({
    options = {
        transparent = false,
        dim_inactive = false,
    },
    palettes = {
        duskfox = {
            bg1 = "#13111C",
        },
    },
})

vim.cmd [[colorscheme duskfox]]
