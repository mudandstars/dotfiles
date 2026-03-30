return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    keys = {
      { "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
      { "<leader>gdh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview File History" },
      { "<leader>gdH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview Repo History" },
    },
    opts = {},
  },
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ibhagwan/fzf-lua",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>gpr", "<cmd>Octo pr list<cr>", desc = "PRs" },
      { "<leader>gpi", "<cmd>Octo issue list<cr>", desc = "Issues" },
      { "<leader>gpo", "<cmd>Octo actions<cr>", desc = "Octo Actions" },
    },
    opts = {
      picker = "fzf-lua",
      use_local_fs = false,
      github_hostname = "github.com",
      default_remote = { "upstream", "origin" },
    },
  },
}
