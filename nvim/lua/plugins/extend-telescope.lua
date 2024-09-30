return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" }, -- Make sure plenary is installed
  config = function()
    require("telescope").setup({
      defaults = {
        cwd = vim.fn.getcwd(), -- Use the current working directory of Neovim
      },
    })
  end,
}
