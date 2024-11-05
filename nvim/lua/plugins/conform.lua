return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "phpcsfixer" },
        blade = { "blade-formatter" },

        html = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        vue = { "prettier" },

        lua = { "styleua " },
      },
      notify_on_error = true,
      formatters = {
        phpcsfixer = {
          command = "php-cs-fixer",
          args = {
            "fix",
            "$FILENAME",
            "--config=.php-cs-fixer.dist.php",
            "-v",
          },
          stdin = false,
        },
      },
    },
    keys = {
      {
        "<leader>cf",
        ":lua require('conform').format()<CR>",
        desc = "Format Current File",
      },
    },
  },
}
