return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "blade", "php", "php_only", "phpdoc" })
      opts.highlight = opts.highlight or {}
      opts.highlight.enable = true
      return opts
    end,
    config = function(plugin, opts)
      local parser_config = require("nvim-treesitter.parsers")
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }

      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      require("lazyvim.plugins.treesitter")[1].config(plugin, opts)
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      custom_calculation = function(_, language_tree)
        if vim.bo.filetype == "blade" and language_tree._lang ~= "javascript" then
          return "{{-- %s --}}"
        end
      end,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    opts = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["if"] = "@function.inner",
          ["af"] = "@function.outer",
          ["ia"] = "@parameter.inner",
          ["aa"] = "@parameter.outer",
        },
      },
    },
  },
}
