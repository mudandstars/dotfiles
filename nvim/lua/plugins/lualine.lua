return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function(_, opts)
    opts = opts or {}
    opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
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
    })

    opts.sections = opts.sections or {}
    opts.sections.lualine_a = { "mode" }
    opts.sections.lualine_b = { { "branch", icon = "" }, "diff", "diagnostics" }
    opts.sections.lualine_c = { { "filename", path = 1 } }
    opts.sections.lualine_x = {}
    opts.sections.lualine_y = {}
    opts.sections.lualine_z = {}

    opts.extensions = opts.extensions or {}
    for _, ext in ipairs(opts.extensions) do
      if type(ext) == "table" and ext.sections then
        ext.sections.lualine_b = { { "branch", icon = "" }, "diff", "diagnostics" }
      end
    end

    return opts
  end,
}
