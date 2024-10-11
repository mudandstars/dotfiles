return {
    'nvim-treesitter/nvim-treesitter-context',
    lazy = true,
    config = function()
        require 'treesitter-context'.setup {
            enable = true,  -- Enable this plugin (Can be toggled with :TSContextToggle)
            max_lines = 0,  -- How many lines the window should span. Values <= 0 mean no limit.
            trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            patterns = {    -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                -- For all filetypes
                default = {
                    'class',
                    'function',
                    'method',
                },
            },
        }
    end
}
