vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>s', vim.cmd.UndotreeToggle)

vim.keymap.set('n', '<leader>w', ':w!<cr>')
vim.keymap.set('n', '<leader>e', ':e.<cr>')

vim.keymap.set('n', '<leader>vr', ':e $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>vs', ':e ~/.dotfiles/.zsh<cr>')
vim.keymap.set('n', '<leader>bin', ':e ~/.bin/<cr>')

vim.keymap.set('n', '<leader>v', vim.cmd.vsplit)
vim.keymap.set('n', '<leader>o', vim.cmd.split)

vim.keymap.set('n', '<leader>x', ':let @/ = ""<cr>', { silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<right>', ':vertical resize +3<cr>')
vim.keymap.set('n', '<left>', ':vertical resize -3<cr>')
vim.keymap.set('n', '<down>', ':resize +3<cr>')
vim.keymap.set('n', '<up>', ':resize -3<cr>')

vim.keymap.set('n', '<c-j>', '<c-w><c-j>')
vim.keymap.set('n', '<c-k>', '<c-w><c-k>')
vim.keymap.set('n', '<c-l>', '<c-w><c-l>')
vim.keymap.set('n', '<c-h>', '<c-w><c-h>')
