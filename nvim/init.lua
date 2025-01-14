-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local multigrep = require("telescope.multigrep")
multigrep.setup()
