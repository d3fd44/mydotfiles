local capabilities = require('blink.cmp').get_lsp_capabilities()

-- lua
vim.lsp.config['lua_ls'] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    settings = { Lua = { runtime = { version = 'LuaJIT', } } },
    capabilities = capabilities,
}
vim.lsp.enable('lua_ls')

-- c/c++
vim.lsp.config['clangd'] = {
    cmd = { 'clangd', '--background-index', '--clang-tidy', '--log=verbose', '--completion-style=detailed' },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    capabilities = capabilities,
}
vim.lsp.enable('clangd')

vim.lsp.config['pyright-langserver'] = {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    capabilities = capabilities,
}
vim.lsp.enable('pyright-langserver')

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
