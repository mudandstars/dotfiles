-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local multigrep = require("telescope.multigrep")
multigrep.setup()
vim.cmd('highlight Normal ctermbg=NONE guibg=NONE')
vim.cmd [[
hi LineNr guibg=NONE guifg=#c0c0c0
hi StatusLine guibg=NONE guifg=#ffffff
]]
