vim.lsp.start {
    name = 'laravel-language-server',
    cmd = {
        'npx',
        'ts-node',
        vim.fn.expand '~/code/laravel-language-server/server/src/server.ts',
    },
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    settings = {},
    init_options = {},          -- also tried vim.empty_dict()
    root_dir = vim.fn.getcwd(), -- also tried vim.empty_dict()
}
