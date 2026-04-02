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
        ["<Tab>"] = { "snippet_forward", "select_and_accept", "fallback" },
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
  },
}
