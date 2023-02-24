vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>s", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<leader>w", ":w!<cr>")
-- vim.keymap.set('n', '<leader>e', ':e.<cr>')
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle, { silent = true })

vim.keymap.set("n", "<leader>vr", ":e $MYVIMRC<cr>")
vim.keymap.set("n", "<leader>vv", ":lcd %:p:h<cr>")
vim.keymap.set("n", "<leader>vs", ":e ~/.dotfiles/.zsh<cr>")
vim.keymap.set("n", "<leader>bin", ":e ~/.bin/<cr>")

vim.keymap.set("n", "<leader>v", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>o", vim.cmd.split)

vim.keymap.set("n", "<leader>W", ":set wrap!<cr>")

vim.keymap.set("n", "<leader>x", ':let @/ = ""<cr>', { silent = true })

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<right>", ":vertical resize +3<cr>")
vim.keymap.set("n", "<left>", ":vertical resize -3<cr>")
vim.keymap.set("n", "<down>", ":resize +3<cr>")
vim.keymap.set("n", "<up>", ":resize -3<cr>")

vim.keymap.set("n", "<c-j>", "<c-w><c-j>")
vim.keymap.set("n", "<c-k>", "<c-w><c-k>")
vim.keymap.set("n", "<c-l>", "<c-w><c-l>")
vim.keymap.set("n", "<c-h>", "<c-w><c-h>")

vim.keymap.set("n", "<c-h>", vim.cmd.TmuxNavigateLeft, { silent = true })
vim.keymap.set("n", "<c-j>", vim.cmd.TmuxNavigateDown, { silent = true })
vim.keymap.set("n", "<c-k>", vim.cmd.TmuxNavigateUp, { silent = true })
vim.keymap.set("n", "<c-l>", vim.cmd.TmuxNavigateRight, { silent = true })

vim.keymap.set("n", "<leader>nos", ":setlocal spell!<cr>")
vim.keymap.set("n", "<leader>pl", ":setlocal spell spelllang=pl<cr>")
vim.keymap.set("n", "<leader>en", ":setlocal spell spelllang=en<cr>")
