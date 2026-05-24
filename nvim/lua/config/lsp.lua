local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.lsp.config['lua_ls'] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    settings = { Lua = { runtime = { version = 'LuaJIT', } } },
    capabilities = capabilities,
}
vim.lsp.enable('lua_ls')

vim.lsp.config['clangd'] = {
    cmd = { 'clangd', '--background-index', '--clang-tidy', '--log=verbose', '--completion-style=detailed' },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    capabilities = capabilities,
}
vim.lsp.enable('clangd')

local project_root = vim.fn.getcwd()

vim.lsp.config['pyright'] = {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    settings = {
        python = {
            pythonPath = project_root .. '/.venv/bin/python'
        }
    }
}
vim.lsp.enable('pyright')

vim.lsp.config['ts_ls'] = {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { "javascript", "typescript", "typescriptreact" },
    capabilities = capabilities,
}
vim.lsp.enable('ts_ls')

vim.lsp.config['tinymist'] = {
    cmd = { "tinymist" },
    filetypes = { "typst" },
}
vim.lsp.enable('tinymist')

vim.lsp.config['slint-lsp'] = {
    cmd = { "slint-lsp" },
    filetypes = { "slint" },
}
vim.lsp.enable('slint-lsp')
