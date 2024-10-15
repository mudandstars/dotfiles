return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-telescope/telescope-live-grep-args.nvim',
  },
  keys = {
    { '<leader>a', function() require("telescope.builtin").lsp_document_symbols({ symbols = { "method", "function" } }) end },
  },
  config = function()
    require('telescope').setup({
      defaults = {
        path_display = { truncate = 1 },
        prompt_prefix = '   ',
        selection_caret = '  ',
        layout_config = {
          prompt_position = 'top',
        },
        preview = {
          timeout = 200,
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
        },
      },
    })
  end,
}
