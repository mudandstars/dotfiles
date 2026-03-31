return {
  { "catppuccin/nvim", name = "catppuccin" },
  { "navarasu/onedark.nvim" },
  { "folke/tokyonight.nvim" },
  {
    "Mofiqul/vscode.nvim",
    opts = {
      -- Keep your original look but add a touch more contrast on key UI surfaces.
      group_overrides = {
        CursorLine = { bg = "#2A2D2E" },
        Visual = { bg = "#3A3D41" },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
      -- style = "warm",
    },
  },
}
