local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'j-hui/fidget.nvim',
            'folke/neodev.nvim',
        },
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }

    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup()
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })

    use 'christoomey/vim-tmux-navigator'
    use 'MunifTanjim/prettier.nvim'
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'numToStr/Comment.nvim'
    use 'tpope/vim-sleuth'

    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

    local has_plugins, plugins = pcall(require, 'custom.plugins')
    if has_plugins then
        plugins(use)
    end

    if is_bootstrap then
        require('packer').sync()
    end
end)

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})

vim.o.termguicolors = true

require('nightfox').setup({
    options = {
        transparent = false,
        dim_inactive = false,
    },
    palettes = {
        duskfox = {
            bg1 = "#13111C",
        },
    },
})

vim.cmd [[colorscheme duskfox]]

vim.o.mouse = 'a'

vim.o.swapfile = false
vim.o.showcmd = false
vim.o.showmatch = true
vim.o.shortmess = 'acI'
vim.o.fileformats = 'unix,mac,dos'
vim.o.autowrite = true
vim.o.history = 500
vim.o.report = 0
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

vim.o.ttimeout = true
vim.o.ttimeoutlen = 1

vim.o.scrolloff = 999
vim.o.scrolljump = -5

vim.o.wrap = false

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.cmdheight = 2

vim.o.breakindent = true
vim.o.undofile = true

vim.o.updatetime = 50
vim.wo.signcolumn = 'yes'

vim.o.complete = '.,w,b,u,i,]'
vim.o.completeopt = 'longest,menuone,noselect'

vim.o.wildmode = 'list:longest,full'
vim.o.wildignore = '*.git'
vim.o.wildignore = '*/venv/*'
vim.o.wildignore = '*/node_modules/*'
vim.o.wildignore = '*/workers-site/*'
vim.o.wildignore = '*/public/*'
vim.o.wildignore = '*/plugged/*'
vim.o.wildignore = '*/resources/*'
vim.o.wildignore = '*/undo/*'

vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\\"'

vim.g.netrw_banner = 0
vim.g.netrw_dirhistmax = 0
vim.g.netrw_fastbrowse = 2
vim.g.netrw_special_syntax = 1

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'duskfox',
        component_separators = '',
        section_separators = '',
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
}

require('Comment').setup()

require('gitsigns').setup {
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '-' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
}

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
}

pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<c-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>g', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })

local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.keymap.set("n", "<Leader>f", function()
                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })

            vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
            vim.api.nvim_create_autocmd(event, {
                buffer = bufnr,
                group = group,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr, async = async })
                end,
                desc = "[lsp] format on save",
            })
        end

        if client.supports_method("textDocument/rangeFormatting") then
            vim.keymap.set("x", "<Leader>f", function()
                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })
        end
    end,
})

local prettier = require("prettier")

prettier.setup({
    bin = 'prettierd', -- or `'prettierd'` (v0.22+)
    filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
    },
})

require('nvim-treesitter.configs').setup {
    ensure_installed = { 'go', 'lua', 'json', 'javascript', 'toml', 'yaml', 'python', 'rust', 'typescript', 'help', 'vim',
        'bash', 'html', 'css' },

    highlight = { enable = true },
    indent = { enable = true, disable = { 'python' } },
}

local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

local servers = {
    eslint = {},
    html = {},
    tailwindcss = {},
    bashls = {},
    tsserver = {},

    sumneko_lua = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

require('neodev').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('mason').setup()

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
}

require('fidget').setup()

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}

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

vim.keymap.set('n', 'Q', ':call CloseWindowOrKillBuffer()<CR>', { silent = true })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

vim.keymap.set('n', '<leader>w', ':w!<cr>')
vim.keymap.set('n', '<leader>e', ':e.<cr>')

vim.keymap.set('n', '<leader>vr', ':e $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>vs', ':e ~/.dotfiles/.zsh<cr>')
vim.keymap.set('n', '<leader>bin', ':e ~/.bin/<cr>')

vim.keymap.set('n', '<leader>v', ':vsplit<cr>')
vim.keymap.set('n', '<leader>o', ':split<cr>')

vim.keymap.set('n', '<leader>x', ':let @/ = ""<cr>', { silent = true })

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
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
