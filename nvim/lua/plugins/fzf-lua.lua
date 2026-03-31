return {
  { 'nvim-telescope/telescope.nvim', enabled = false },
  {
    'ibhagwan/fzf-lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'folke/trouble.nvim',
    },
    opts = function(_, opts)
      local fzf = require('fzf-lua')
      local config = fzf.config

      if LazyVim.has('trouble.nvim') then
        local trouble_open = require('trouble.sources.fzf').actions.open
        config.defaults.actions = config.defaults.actions or {}
        config.defaults.actions.files = config.defaults.actions.files or {}
        config.defaults.actions.grep = config.defaults.actions.grep or {}
        config.defaults.actions.files['ctrl-t'] = trouble_open
        config.defaults.actions.grep['ctrl-t'] = trouble_open
      end

      opts = opts or {}
      opts.winopts = vim.tbl_deep_extend('force', opts.winopts or {}, {
        fullscreen = true,
        title_flags = false,
        preview = {
          layout = 'vertical',
          vertical = 'down:50%',
        },
      })
      opts.defaults = vim.tbl_deep_extend('force', opts.defaults or {}, {
        formatter = 'path.filename_first',
      })
      opts.fzf_opts = vim.tbl_extend('force', opts.fzf_opts or {}, {
        ['--layout'] = 'reverse',
      })
      config.defaults.keymap = config.defaults.keymap or {}
      config.defaults.keymap.builtin = config.defaults.keymap.builtin or {}
      config.defaults.keymap.builtin['<c-d>'] = 'preview-page-down'
      config.defaults.keymap.builtin['<c-u>'] = 'preview-page-up'
      config.defaults.actions.files['alt-h'] = false
      config.defaults.actions.files['alt-i'] = false
      config.defaults.actions.files['alt-f'] = false
      opts.files = vim.tbl_deep_extend('force', opts.files or {}, {
        hidden = true,
        fd_opts = '--type f --hidden --follow --exclude .git --exclude node_modules --exclude vendor',
        no_ignore = true,
        no_ignore_vcs = true,
        rg_opts = '--color=never --files --hidden --follow -g "!.git" -g "!**/node_modules/**" -g "!**/vendor/**"',
        _headers = { 'cwd' },
      })
      opts.grep = vim.tbl_deep_extend('force', opts.grep or {}, {
        rg_opts = '--column --line-number --no-heading --color=always --smart-case --fixed-strings --hidden --no-ignore --no-ignore-vcs --max-columns=4096 -g "!**/node_modules/**" -g "!**/vendor/**" -e',
        _headers = { 'cwd' },
      })
      return opts
    end,
    keys = {
      {
        '<leader>gd',
        function()
          vim.lsp.buf.definition()
        end,
        desc = 'Goto Definition',
      },
      {
        '<leader>a',
        function()
          local allowed = { Class = true, Method = true, Function = true }
          require('fzf-lua').lsp_document_symbols({
            regex_filter = function(entry)
              local kind = entry.kind
              if type(kind) == 'number' then
                kind = vim.lsp.protocol.SymbolKind[kind]
              end
              return allowed[kind] == true
            end,
          })
        end,
      },
      {
        '<leader>fr',
        function()
          require('fzf-lua').history({
            -- Telescope-style "normal mode" is not supported in fzf's UI.
            -- Use j/k for moving in this picker to feel closer to that flow.
            fzf_opts = { ['--bind'] = 'j:down,k:up,ctrl-d:preview-page-down,ctrl-u:preview-page-up' },
          })
        end,
        desc = 'Recent Buffers',
      },
      {
        '<leader><space>',
        function()
          require('fzf-lua').files()
        end,
        desc = 'Find Files (insert mode)',
      },
      {
        '<leader>fm',
        function()
          require('fzf-lua').live_grep_glob({
            prompt = 'Multi Grep> ',
            glob_separator = '%s%s+',
          })
        end,
        desc = 'Multi Grep',
      },
    },
  },
}
