local configs = "nvim_utils"
vim.api.nvim_create_augroup(configs, { clear = true })

vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = configs,
    callback = function()
        vim.cmd "tabdo wincmd ="
    end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "FileType" }, {
    group = configs,
    pattern = { "*.txt", "*.md", "text" },
    command = "setlocal spell | setlocal cc=80",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    group = configs,
    pattern = { "gitcommit" },
    command = "setlocal spell | setlocal cc=51",
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = configs,
    pattern = { "*.ts,*.js,*.tsx" },
    command = "EslintFixAll",
})

vim.api.nvim_create_autocmd({ "TermOpen" }, {
    group = configs,
    pattern = "*",
    callback = function()
        if vim.o.buftype == "terminal" and vim.o.filetype ~= "lazy" then
            vim.cmd.startinsert()
        end
    end,
})

vim.api.nvim_create_autocmd("TermOpen", {
    group = configs,
    pattern = "*",
    command = "setlocal nonumber norelativenumber",
})

vim.api.nvim_create_autocmd("FileType", {
    group = configs,
    pattern = { "help", "man" },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<Cmd>quit<CR>", { silent = true, buffer = event.buf })
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = configs,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- https://github.com/neovim/neovim/issues/16339#issuecomment-1348133829
vim.api.nvim_create_autocmd({ "BufWinEnter", "FileType" }, {
    group = configs,
    callback = function()
        local ignore_buftype = { "quickfix", "nofile", "help" }
        local ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" }

        if vim.tbl_contains(ignore_buftype, vim.bo.buftype) then
            return
        end

        if vim.tbl_contains(ignore_filetype, vim.bo.filetype) then
            vim.cmd [[normal! gg]]
            return
        end

        if vim.fn.line "." > 1 then
            return
        end

        local last_line = vim.fn.line [['"]]
        local buff_last_line = vim.fn.line "$"

        if last_line > 0 and last_line <= buff_last_line then
            local win_last_line = vim.fn.line "w$"
            local win_first_line = vim.fn.line "w0"
            if win_last_line == buff_last_line then
                vim.cmd [[normal! g`"]]
            elseif buff_last_line - last_line > ((win_last_line - win_first_line) / 2) - 1 then
                vim.cmd [[normal! g`"zz]]
            else
                vim.cmd [[normal! G'"<c-e>]]
            end
        end
    end,
})

vim.api.nvim_create_user_command("CWKB", function()
    local bufnr = vim.fn.bufnr()
    local wins = vim.fn.getbufinfo({ bufnr = bufnr })[1].windows

    if #wins > 1 then
        vim.cmd "close"
    else
        vim.cmd "bdelete!"
    end
end, { force = true })

vim.keymap.set("n", "Q", ":CWKB<CR>", { silent = true })
