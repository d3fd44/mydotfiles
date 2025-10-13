vim.g.mapleader = ' '

require("config.lazy")
require("config.options")
require("config.keymap")
require("config.diagnostics")

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = "highlight after yanking",
    callback = function()
        vim.highlight.on_yank()
    end
})
