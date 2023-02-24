return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader>s", vim.cmd.UndotreeToggle)
    end,
}
