return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      icons_enabled = true,
      theme = {
        normal = {
          a = { fg = '#00ffff', bg = 'NONE', }, -- Cyan bold for the path
          b = { fg = '#cc6666', bg = 'NONE', }, -- Green bold for the arrow prompt
          c = { fg = '#808080', bg = 'NONE' },  -- White for general text
        },
        insert = {
          a = { fg = '#00ffff', bg = 'NONE', },
          b = { fg = '#cc6666', bg = 'NONE', },
          c = { fg = '#808080', bg = 'NONE' },
        },
        visual = {
          a = { fg = '#00ffff', bg = 'NONE', },
          b = { fg = '#cc6666', bg = 'NONE', },
          c = { fg = '#808080', bg = 'NONE' },
        },
        replace = {
          a = { fg = '#00ffff', bg = 'NONE', },
          b = { fg = '#cc6666', bg = 'NONE', },
          c = { fg = '#808080', bg = 'NONE' },
        },
        command = {
          a = { fg = '#00ffff', bg = 'NONE', },
          b = { fg = '#cc6666', bg = 'NONE', },
          c = { fg = '#808080', bg = 'NONE' },
        },
        inactive = {
          a = { fg = '#00ffff', bg = 'NONE' },
          b = { fg = '#cc6666', bg = 'NONE' },
          c = { fg = '#808080', bg = 'NONE' },
        },
      },
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
  },
}
