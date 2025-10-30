---@diagnostic disable: undefined-global

vim.g.mapleader = ' '

require("config.lazy")
require("config.options")
require("config.keymap")
require("config.diagnostics")
require("config.lsp")

vim.api.nvim_create_autocmd('TextYankPost', { callback = function() vim.highlight.on_yank() end })

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function() vim.lsp.buf.format({ bufnr = args.buf, id = client.id }) end
            })
        end
    end
})
