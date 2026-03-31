return {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
        enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 4,            -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20,     -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    },
    config = function(_, opts)
        require("treesitter-context").setup(opts)

        local function apply_treesitter_context_theme()
            local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
            local line_nr = vim.api.nvim_get_hl(0, { name = "LineNr", link = false })
            local float_border = vim.api.nvim_get_hl(0, { name = "FloatBorder", link = false })

            vim.api.nvim_set_hl(0, "TreesitterContext", { bg = normal.bg })
            vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { fg = line_nr.fg, bg = normal.bg })
            vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { fg = float_border.fg, bg = normal.bg })
        end

        local group = vim.api.nvim_create_augroup("TreesitterContextTheme", { clear = true })
        vim.api.nvim_create_autocmd("ColorScheme", {
            group = group,
            callback = apply_treesitter_context_theme,
        })

        apply_treesitter_context_theme()
    end,
}
