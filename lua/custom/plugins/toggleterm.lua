return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup({
        open_mapping = '<leader>ft',
        hide_numbers = true,
        autochdir = false,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = '2',
        start_in_insert = true,
        insert_mappings = true,
        persist_size = false,
        persist_mode = true,
        close_on_exit = false,
        shell = vim.o.shell,
        direction = 'horizontal',
        auto_scroll = true,
        float_opts = {
          border = 'rounded',
          width = math.floor(vim.o.columns * 0.8),
          height = math.floor(vim.o.lines * 0.8),
          winblend = 5,
        },
        highlights = {
          Normal = { link = 'Normal' },
          NormalFloat = { link = 'NormalFloat' },
          FloatBorder = { link = 'TelescopeBorder' },
        },
        size = function(term)
          if term.direction == 'horizontal' then
            return 10
          elseif term.direction == 'vertical' then
            return math.floor(vim.o.columns * 0.3)
          end
        end,
        on_create = function(term)
          local opts = { buffer = term.bufnr }
          vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
          vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
          vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
          vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
          vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
          vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
          vim.keymap.set('t', '<C-q>', function()
            vim.cmd.quit({ bang = true })
          end, opts)
        end,
      })

      vim.keymap.set(
        { 'n', 't' },
        '<leader>vt',
        [[<Cmd>execute 50+v:count "ToggleTerm direction=vertical"<CR>]]
      )
      vim.keymap.set(
        { 'n', 't' },
        '<leader>ht',
        [[<Cmd>execute 100+v:count "ToggleTerm direction=horizontal"<CR>]]
      )
    end,
  },
}
