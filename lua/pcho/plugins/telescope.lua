local builtin = require('telescope.builtin')

pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>d', builtin.oldfiles, {})
vim.keymap.set('n', '<leader><space>', builtin.buffers, {})
vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
