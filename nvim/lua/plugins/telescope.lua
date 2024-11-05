return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-telescope/telescope-live-grep-args.nvim',
    'folke/trouble.nvim',
  },
  keys = {
    { '<leader>a', function() require("telescope.builtin").lsp_document_symbols({ symbols = { "class", "method", "function" } }) end },
  },
  config = function()
    local actions = require("telescope.actions")
    local open_with_trouble = require("trouble.sources.telescope").open

    require('telescope').setup({
      defaults = {
        mappings = {
          i = { ["<c-t>"] = open_with_trouble },
          n = { ["<c-t>"] = open_with_trouble },
        },
        path_display = { truncate = 1 },
        prompt_prefix = '   ',
        selection_caret = '  ',
        layout_config = {
          prompt_position = 'top',
        },
        preview = {
          timeout = 200,
          treesitter = false,
        },
        sorting_strategy = 'ascending',
        vimgrep_arguments = {
          'rg',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--fixed-strings', -- Add this line to disable regex searching
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        oldfiles = {
          prompt_title = 'Search',
          initial_mode = 'normal',
        },
        lsp_document_symbols = {
          symbol_width = 55,
          initial_mode = 'normal',
        },
        buffers = {
          initial_mode = 'normal',
        },
        lsp_references = {
          initial_mode = 'normal',
        },
      },
    })
  end,
}
