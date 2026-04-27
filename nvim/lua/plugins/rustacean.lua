vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()

        vim.keymap.set("n", "<leader>ca", function()
            vim.cmd.RustLsp('codeAction')
        end, { silent = true, buffer = bufnr })

        vim.keymap.set("n", "K", function()
            vim.cmd.RustLsp({ 'hover', 'actions' })
        end, { silent = true, buffer = bufnr })
    end,
})

vim.g.rustaceanvim = {
    tools = {
    },
    server = {
        on_attach = function(client, bufnr)
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            -- keymaps or like in here
        end,
        default_settings = {
            ['rust-analyzer'] = {
                inlayHints = {
                    chainingHints = {
                        enable = true,
                    },
                    typeHints = { enable = true },
                    parameterHints = { enable = true },
                    maxLength = 25,
                },
            },
        },

    },
}
