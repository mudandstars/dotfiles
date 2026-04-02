return {
    'felixele217/hello-test.nvim',
    enabled = true,
    -- dir = "~/code/plugins/hello-test.nvim",
    config = function(_, opts)
        local hello_test = require('hello-test')

        hello_test.setup(opts)

        local function run_fullscreen(run_fn)
            run_fn()
            vim.schedule(function()
                vim.cmd('wincmd |')
                vim.cmd('wincmd _')
            end)
        end

        vim.keymap.set('n', '<leader>ta', function()
            run_fullscreen(hello_test.run_tests)
        end)

        vim.keymap.set('n', '<leader>tl', function()
            run_fullscreen(hello_test.run_last)
        end)

        vim.keymap.set('n', '<leader>tf', function()
            run_fullscreen(hello_test.run_file)
        end)

        vim.keymap.set('n', '<leader>tt', function()
            run_fullscreen(hello_test.run_test_at_cursor)
        end)
    end,
    opts = {
        root_dir_cmd = "./vendor/bin/pest",
    },
}
