vim.keymap.set('n', '<leader>w', '<Cmd>write!<cr>')

vim.keymap.set('n', '<leader>vr', '<Cmd>edit $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>vv', '<Cmd>lcd %:p:h<cr>')
vim.keymap.set('n', '<leader>vs', '<Cmd>edit ~/.dotfiles/.zsh<cr>')
vim.keymap.set('n', '<leader>bin', '<Cmd>edit ~/.bin/<cr>')

vim.keymap.set('n', '<leader>v', '<Cmd>vsplit<cr>')
vim.keymap.set('n', '<leader>o', '<Cmd>split<cr>')

vim.keymap.set('n', '<leader>W', '<Cmd>set wrap!<cr>')

vim.keymap.set('n', '<leader>x', '<Cmd>let @/ = ""<cr>', { silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<right>', '<Cmd>vertical resize +3<cr>')
vim.keymap.set('n', '<left>', '<Cmd>vertical resize -3<cr>')
vim.keymap.set('n', '<down>', '<Cmd>resize +3<cr>')
vim.keymap.set('n', '<up>', '<Cmd>resize -3<cr>')

vim.keymap.set('n', '<leader>nos', '<Cmd>setlocal spell!<cr>')
vim.keymap.set('n', '<leader>pl', '<Cmd>setlocal spell spelllang=pl<cr>')
vim.keymap.set('n', '<leader>en', '<Cmd>setlocal spell spelllang=en<cr>')
