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
        requires = {
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        },
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
        requires = {
            'windwp/nvim-ts-autotag'
        }
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

    use 'onsails/lspkind.nvim'
    use 'mbbill/undotree'
    use 'christoomey/vim-tmux-navigator'
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
vim.o.shortmess = 'acI'

vim.o.complete = '.,w,b,u,i,]'
vim.o.completeopt = 'longest,menuone,noselect'

vim.o.wildmode = 'list:longest,full'
vim.o.wildignore = '*/venv/*'
vim.o.wildignore = '*/resources/*'
vim.o.wildignore = '*/undo/*'

vim.o.ttimeout = true
vim.o.ttimeoutlen = 1
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

vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\\"'

vim.g.netrw_banner = 0
vim.g.netrw_dirhistmax = 0
vim.g.netrw_fastbrowse = 2
vim.g.netrw_special_syntax = 1

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

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- https://github.com/neovim/neovim/issues/16339#issuecomment-1348133829
local ignore_buftype = { "quickfix", "nofile", "help" }
local ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" }

local function run()
  if vim.tbl_contains(ignore_buftype, vim.bo.buftype) then
    return
  end

  if vim.tbl_contains(ignore_filetype, vim.bo.filetype) then
    vim.cmd[[normal! gg]]
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
      vim.cmd[[normal! g`"]]
    elseif buff_last_line - last_line > ((win_last_line - win_first_line) / 2) - 1 then
      vim.cmd[[normal! g`"zz]]
    else
      vim.cmd[[normal! G'"<c-e>]]
    end
  end
end

vim.api.nvim_create_autocmd({'BufWinEnter', 'FileType'}, {
  group    = vim.api.nvim_create_augroup('nvim-lastplace', {}),
  callback = run
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

require('nvim-treesitter.configs').setup {
    ensure_installed = { 'prisma', 'lua', 'json', 'javascript', 'tsx', 'toml', 'yaml', 'typescript', 'help', 'vim', 'bash', 'html', 'css', 'go', 'python', 'rust', },
    autotag = {
        enable = true,
        filetypes = { 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'tsx', 'jsx', },
    },
    highlight = { enable = true },
    indent = { enable = true },
}

local builtin = require('telescope.builtin')

pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>d', builtin.oldfiles, {})
vim.keymap.set('n', '<leader><space>', builtin.buffers, {})
vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})

local null_ls = require("null-ls")
local lspkind = require("lspkind")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre"
local async = event == "BufWritePost"
local builtins = null_ls.builtins

null_ls.setup({
    sources = {
        builtins.formatting.shfmt,
        builtins.formatting.shellharden,
        builtins.formatting.prettierd,
    },
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

local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '')
    nmap('<leader>ca', vim.lsp.buf.code_action, '')

    nmap('gd', vim.lsp.buf.definition, '')
    nmap('gr', require('telescope.builtin').lsp_references, '')
    nmap('gI', vim.lsp.buf.implementation, '')
    nmap('<leader>D', vim.lsp.buf.type_definition, '')

    nmap('K', vim.lsp.buf.hover, '')
    nmap('gD', vim.lsp.buf.declaration, '')

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

local servers = {
    eslint = {},
    cssls = {},
    jsonls = {},
    html = {},
    tailwindcss = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                },
            },
        },
    },
    bashls = {},
    tsserver = {},

    sumneko_lua = {
        Lua = {
            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false },
            diagnostic = {
                globals = { 'vim' }
            }
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
        { name = 'path' },
        { name = 'luasnip' },
    },
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = lspkind.cmp_format({
            mode = "symbol_text",
            preset = "codicons",
            menu = {
                path = "[P]",
                nvim_lsp = "[L]",
                luasnip = "[S]",
            },
        }),
    }
}

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>s', vim.cmd.UndotreeToggle)

vim.keymap.set('n', '<leader>w', ':w!<cr>')
vim.keymap.set('n', '<leader>e', ':e.<cr>')

vim.keymap.set('n', '<leader>vr', ':e $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>vv', ':e ~/.dotfiles/.nvim<cr>')
vim.keymap.set('n', '<leader>vs', ':e ~/.dotfiles/.zsh<cr>')
vim.keymap.set('n', '<leader>bin', ':e ~/.bin/<cr>')

vim.keymap.set('n', '<leader>v', vim.cmd.vsplit)
vim.keymap.set('n', '<leader>o', vim.cmd.split)

vim.keymap.set('n', '<leader>W', ':set wrap!<cr>')

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

vim.keymap.set('n', '<leader>nos', ':setlocal spell!<cr>')
vim.keymap.set('n', '<leader>pl', ':setlocal spell spelllang=pl<cr>')
vim.keymap.set('n', '<leader>en', ':setlocal spell spelllang=en<cr>')
