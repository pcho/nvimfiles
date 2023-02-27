return {
  'akinsho/bufferline.nvim',
  version = 'v3.*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      diagnostics = 'nvim_lsp',
      always_show_bufferline = false,
      show_buffer_icons = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = true,
      -- mode = "tabs",
      separator_style = 'thin',
      indicator = {
        style = 'none',
      },
      offsets = {
        { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center' },
        { filetype = 'undotree', text = 'Undo Tree', text_align = 'center' },
      },
    },
    highlights = {
      fill = {
        bg = '#13111c',
        fg = '#b1acde',
      },
    },
  },
  config = function(_, opts)
    require('bufferline').setup(opts)
    vim.keymap.set('n', 'H', '<Cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', 'L', '<Cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true })

    vim.keymap.set('n', '<Leader>1', function()
      require('bufferline').go_to_buffer(1, true)
    end, { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>2', function()
      require('bufferline').go_to_buffer(2, true)
    end, { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>3', function()
      require('bufferline').go_to_buffer(3, true)
    end, { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>4', function()
      require('bufferline').go_to_buffer(4, true)
    end, { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>5', function()
      require('bufferline').go_to_buffer(5, true)
    end, { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>6', function()
      require('bufferline').go_to_buffer(6, true)
    end, { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>7', function()
      require('bufferline').go_to_buffer(7, true)
    end, { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>8', function()
      require('bufferline').go_to_buffer(8, true)
    end, { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>9', function()
      require('bufferline').go_to_buffer(9, true)
    end, { noremap = true, silent = true })
  end,
}
