-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local multigrep = require("telescope.multigrep")
multigrep.setup()
vim.cmd('highlight Normal ctermbg=NONE guibg=NONE')
vim.cmd [[
hi LineNr guibg=NONE guifg=#c0c0c0
hi StatusLine guibg=NONE guifg=#ffffff
]]

if vim.fn.getenv("TERM_PROGRAM") == "ghostty" then
    vim.opt.title = true
    vim.opt.titlestring = "nvim:%{fnamemodify(getcwd(), ':t')}"
end

vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { bg = 'NONE' })
