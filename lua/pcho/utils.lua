vim.cmd([[
function! CloseWindowOrKillBuffer()
    let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))
    if number_of_windows_to_this_buffer > 1
        wincmd c
    else
        bdelete
    endif
endfunction
]])

vim.keymap.set("n", "Q", ":call CloseWindowOrKillBuffer()<CR>", { silent = true })

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- https://github.com/neovim/neovim/issues/16339#issuecomment-1348133829
local ignore_buftype = { "quickfix", "nofile", "help" }
local ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" }

local function run()
    if vim.tbl_contains(ignore_buftype, vim.bo.buftype) then
        return
    end

    if vim.tbl_contains(ignore_filetype, vim.bo.filetype) then
        vim.cmd([[normal! gg]])
        return
    end

    if vim.fn.line(".") > 1 then
        return
    end

    local last_line = vim.fn.line([['"]])
    local buff_last_line = vim.fn.line("$")

    if last_line > 0 and last_line <= buff_last_line then
        local win_last_line = vim.fn.line("w$")
        local win_first_line = vim.fn.line("w0")
        if win_last_line == buff_last_line then
            vim.cmd([[normal! g`"]])
        elseif buff_last_line - last_line > ((win_last_line - win_first_line) / 2) - 1 then
            vim.cmd([[normal! g`"zz]])
        else
            vim.cmd([[normal! G'"<c-e>]])
        end
    end
end

vim.api.nvim_create_autocmd({ "BufWinEnter", "FileType" }, {
    group = vim.api.nvim_create_augroup("nvim-lastplace", {}),
    callback = run,
})
