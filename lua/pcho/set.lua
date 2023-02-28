vim.o.splitright = true
vim.o.splitbelow = true

vim.o.termguicolors = true

vim.o.mouse = 'a'
vim.o.fileformats = 'unix,mac,dos'
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.autowrite = true
vim.o.report = 0
vim.o.history = 500

vim.o.wrap = false

vim.o.cmdheight = 2
vim.o.showcmd = false
vim.o.showmatch = true
vim.opt.shortmess:append('acI')

vim.o.complete = '.,w,b,u,i,]'
vim.o.completeopt = 'longest,menuone,noselect'

vim.o.pumheight = 15

vim.o.wildmode = 'list:longest,full'
vim.opt.wildignore:append('*/venv/*')
vim.opt.wildignore:append('*/resources/*')
vim.opt.wildignore:append('*/undo/*')
vim.opt.wildignore:append('*/node_modules/*')
vim.opt.wildignore:append('*/git/*')
vim.opt.wildignore:append('*/workers-site/*')

vim.o.ttimeout = true
vim.o.ttimeoutlen = 1
vim.o.timeoutlen = 400
vim.o.scrolloff = 999
vim.o.scrolljump = -5

vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.linebreak = true
vim.o.breakindent = true
vim.o.copyindent = true
vim.o.preserveindent = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.expandtab = true

vim.o.swapfile = false
vim.o.undofile = true

vim.o.updatetime = 50
vim.wo.signcolumn = 'yes'
vim.o.cursorline = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.netrw_banner = 0
vim.g.netrw_dirhistmax = 0
vim.g.netrw_fastbrowse = 2
vim.g.netrw_special_syntax = 1

vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
