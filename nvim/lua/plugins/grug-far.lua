return {
  {
    'MagicDuck/grug-far.nvim',
    cmd = { 'GrugFar', 'GrugFarWithin' },
    keys = {
      {
        '<leader>sr',
        function()
          local ext = vim.bo.buftype == '' and vim.fn.expand('%:e')
          require('grug-far').open({
            prefills = {
              filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
            },
          })
        end,
        mode = { 'n' },
        desc = 'Search and Replace (Current Filetype)',
      },
      {
        '<leader>sR',
        function()
          require('grug-far').open()
        end,
        mode = { 'n' },
        desc = 'Search and Replace (All Files)',
      },
      {
        '<leader>sr',
        function()
          require('grug-far').with_visual_selection({
            prefills = {
              search = vim.fn.getreg('"'),
            },
          })
        end,
        mode = { 'v' },
        desc = 'Search and Replace',
      },
    },
    opts = {},
  },
}
