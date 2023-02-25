return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "j-hui/fidget.nvim",
            "folke/neodev.nvim",
        },
        config = function()
            local on_attach = function(_, bufnr)
                local nmap = function(keys, func, desc)
                    if desc then
                        desc = "LSP: " .. desc
                    end

                    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
                end

                nmap("<leader>rn", vim.lsp.buf.rename, "")
                nmap("<leader>ca", vim.lsp.buf.code_action, "")

                nmap("gd", vim.lsp.buf.definition, "")
                nmap("gr", require("telescope.builtin").lsp_references, "")
                nmap("gI", vim.lsp.buf.implementation, "")
                nmap("<leader>D", vim.lsp.buf.type_definition, "")

                nmap("K", vim.lsp.buf.hover, "")
                nmap("gD", vim.lsp.buf.declaration, "")

                vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
                    vim.lsp.buf.format()
                end, { desc = "Format current buffer with LSP" })
            end

            local servers = {
                rust_analyzer = {},
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
                bashls = {
                    bashIde = {
                        includeAllWorkspaceSymbols = true,
                    },
                },
                tsserver = {},
                lua_ls = {
                    Lua = {
                        workspace = {
                            checkThirdParty = false,
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = { enable = false },
                        diagnostic = {
                            globals = { "vim" },
                        },
                    },
                },
            }

            require("neodev").setup()

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            require("mason").setup()

            local mason_lspconfig = require "mason-lspconfig"

            mason_lspconfig.setup {
                ensure_installed = vim.tbl_keys(servers),
            }

            mason_lspconfig.setup_handlers {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = servers[server_name],
                    }
                end,
            }

            require("mason-tool-installer").setup {
                ensure_installed = {
                    "bash-language-server",
                    "tailwindcss-language-server",
                    "typescript-language-server",
                    "prisma-language-server",
                    "lua-language-server",
                    "html-lsp",
                    "css-lsp",
                    "eslint-lsp",
                    "json-lsp",
                    "css-lsp",
                    "rustfmt",
                    "yamlfmt",
                    "stylua",
                    "shellcheck",
                    "rust-analyzer",
                },
                auto_update = false,
                run_on_start = true,
                start_delay = 3000,
            }

            require("fidget").setup()
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local null_ls = require "null-ls"

            local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
            local event = "BufWritePre"
            local async = event == "BufWritePost"
            local builtins = null_ls.builtins

            null_ls.setup {
                sources = {
                    builtins.formatting.shfmt,
                    builtins.formatting.stylua,
                    builtins.formatting.rustfmt,
                    builtins.formatting.shellharden,
                    builtins.formatting.prettierd,
                    builtins.diagnostics.shellcheck,
                },
                on_attach = function(client, bufnr)
                    if client.supports_method "textDocument/formatting" then
                        vim.keymap.set("n", "<Leader>f", function()
                            vim.lsp.buf.format { bufnr = vim.api.nvim_get_current_buf() }
                        end, { buffer = bufnr, desc = "[lsp] format" })

                        vim.api.nvim_clear_autocmds { buffer = bufnr, group = group }
                        vim.api.nvim_create_autocmd(event, {
                            buffer = bufnr,
                            group = group,
                            callback = function()
                                vim.lsp.buf.format { bufnr = bufnr, async = async }
                            end,
                            desc = "[lsp] format on save",
                        })
                    end

                    if client.supports_method "textDocument/rangeFormatting" then
                        vim.keymap.set("x", "<Leader>f", function()
                            vim.lsp.buf.format { bufnr = vim.api.nvim_get_current_buf() }
                        end, { buffer = bufnr, desc = "[lsp] format" })
                    end
                end,
            }
        end,
    },
}
