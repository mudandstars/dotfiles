local treesitter_context_was_enabled = nil

local function disable_treesitter_context_for_diffview()
  local ok, treesitter_context = pcall(require, "treesitter-context")
  if not ok then
    return
  end

  if treesitter_context_was_enabled == nil then
    treesitter_context_was_enabled = treesitter_context.enabled()
  end

  if treesitter_context.enabled() then
    treesitter_context.disable()
  end
end

local function restore_treesitter_context_after_diffview()
  local ok, treesitter_context = pcall(require, "treesitter-context")
  if not ok then
    return
  end

  if treesitter_context_was_enabled then
    treesitter_context.enable()
  end

  treesitter_context_was_enabled = nil
end

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
    opts = function(_, opts)
      local actions = require("diffview.actions")

      opts = opts or {}
      opts.view = vim.tbl_deep_extend("force", opts.view or {}, {
        default = {
          layout = "diff1_plain",
        },
        merge_tool = {
          layout = "diff1_plain",
        },
        file_history = {
          layout = "diff1_plain",
        },
      })
      opts.hooks = vim.tbl_deep_extend("force", opts.hooks or {}, {
        view_opened = disable_treesitter_context_for_diffview,
        view_enter = disable_treesitter_context_for_diffview,
        view_leave = restore_treesitter_context_after_diffview,
        view_closed = restore_treesitter_context_after_diffview,
      })
      opts.keymaps = vim.tbl_deep_extend("force", opts.keymaps or {}, {
        diff1 = {
          { "n", "[x", actions.prev_conflict, { desc = "Go to the previous conflict" } },
          { "n", "]x", actions.next_conflict, { desc = "Go to the next conflict" } },
          { "n", "<leader>co", actions.conflict_choose("ours"), { desc = "Choose the OURS version of a conflict" } },
          { "n", "<leader>ct", actions.conflict_choose("theirs"), { desc = "Choose the THEIRS version of a conflict" } },
          { "n", "<leader>cb", actions.conflict_choose("base"), { desc = "Choose the BASE version of a conflict" } },
          { "n", "<leader>ca", actions.conflict_choose("all"), { desc = "Choose all versions of a conflict" } },
          { "n", "dx", actions.conflict_choose("none"), { desc = "Delete the conflict region" } },
          { "n", "<leader>cO", actions.conflict_choose_all("ours"), { desc = "Choose the OURS version of a conflict for the whole file" } },
          { "n", "<leader>cT", actions.conflict_choose_all("theirs"), { desc = "Choose the THEIRS version of a conflict for the whole file" } },
          { "n", "<leader>cB", actions.conflict_choose_all("base"), { desc = "Choose the BASE version of a conflict for the whole file" } },
          { "n", "<leader>cA", actions.conflict_choose_all("all"), { desc = "Choose all versions of a conflict for the whole file" } },
          { "n", "dX", actions.conflict_choose_all("none"), { desc = "Delete the conflict region for the whole file" } },
          { "n", "g?", actions.help({ "view", "diff1" }), { desc = "Open the help panel" } },
        },
      })

      return opts
    end,
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
