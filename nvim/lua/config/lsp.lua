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
    filetypes = { 'py', '.py' },
    capabilities = capabilities,
}
vim.lsp.enable('pyright-langserver')

-- local on_attach = function(client, bufnr)
--     -- Enable LSP features, like completion, go-to-definition, etc.
--     -- You can add key mappings here if desired
--     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>',
--         { noremap = true, silent = true })
--     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>gr', '<Cmd>lua vim.lsp.buf.references()<CR>',
--         { noremap = true, silent = true })
--     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>gh', '<Cmd>lua vim.lsp.buf.hover()<CR>',
--         { noremap = true, silent = true })
-- end

-- vim.lsp.start({
--     name = "pyright",
--     cmd = { "pyright" },
--     -- on_attach = on_attach,
-- })
