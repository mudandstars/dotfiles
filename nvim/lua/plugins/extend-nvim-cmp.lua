return {
  { "hrsh7th/nvim-cmp", enabled = false },
  {
    "saghen/blink.cmp",
    enabled = true,
    version = "v1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      keymap = {
        preset = "none",
        ["<Tab>"] = {
          function(cmp)
            local ok, suggestion = pcall(require, "copilot.suggestion")
            if ok and suggestion.is_visible() then
              suggestion.accept()
              return true
            end
          end,
          "snippet_forward",
          "select_and_accept",
          "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
        ["<CR>"] = { "select_and_accept", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
      },
      completion = {
        ghost_text = { enabled = false },
      },
      signature = { enabled = true },
      sources = {
        default = { "copilot", "snippets", "lsp", "buffer", "path" },
      },
    },
    config = function(_, opts)
      require("blink.cmp").setup(opts)

      local group = vim.api.nvim_create_augroup("BlinkCopilotIntegration", { clear = true })

      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = "BlinkCmpMenuOpen",
        callback = function()
          local ok, suggestion = pcall(require, "copilot.suggestion")
          if ok then
            suggestion.dismiss()
          end
          vim.b.copilot_suggestion_hidden = true
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = "BlinkCmpMenuClose",
        callback = function()
          vim.b.copilot_suggestion_hidden = false
        end,
      })
    end,
  },
}
