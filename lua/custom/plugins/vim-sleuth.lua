return {
    "tpope/vim-sleuth",
    config = function()
        vim.g.sleuth_lua_heuristics = 0
        vim.g.sleuth_sh_heuristics = 0
    end,
}
