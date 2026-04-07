vim.treesitter.start()
vim.schedule(function()
  if vim.bo.filetype == "blade" then
    vim.bo.syntax = "blade"
  end
end)
