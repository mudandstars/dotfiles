local function current_file_path()
  local current_file = vim.bo.buftype == '' and vim.fn.expand('%')
  if not current_file or current_file == '' then
    vim.notify('grug-far: current buffer has no file path', vim.log.levels.WARN)
    return nil
  end

  return current_file
end

local function current_word_prefill()
  local current_word = vim.fn.expand('<cword>')
  return current_word ~= '' and current_word or nil
end

local function open_grug_far_current_file()
  local current_file = current_file_path()
  if not current_file then
    return
  end

  require('grug-far').open({
    prefills = {
      search = current_word_prefill(),
      paths = current_file,
    },
  })
end

local function open_grug_far_current_file_visual()
  local current_file = current_file_path()
  if not current_file then
    return
  end

  require('grug-far').with_visual_selection({
    prefills = {
      paths = current_file,
    },
  })
end

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
              search = current_word_prefill(),
              filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
            },
          })
        end,
        mode = { 'n' },
        desc = 'Search and Replace (Current Filetype)',
      },
      {
        '<leader>sf',
        open_grug_far_current_file,
        mode = { 'n' },
        desc = 'Search and Replace (Current File)',
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
      {
        '<leader>sf',
        open_grug_far_current_file_visual,
        mode = { 'v' },
        desc = 'Search and Replace (Current File)',
      },
    },
    opts = {
      engines = {
        ripgrep = {
          defaults = {
            flags = '-u -F',
          },
        },
      },
    },
  },
}
