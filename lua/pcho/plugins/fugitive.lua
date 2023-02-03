vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.keymap.set('n', '<leader>gm', ':Git push -u origin master<cr>');
vim.keymap.set('n', '<leader>gp', ':Git push -u origin ');
vim.keymap.set('n', '<leader>gr', ':Git reset HEAD~1 --soft<cr>');
