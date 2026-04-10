require('blink.cmp').setup({
    signature = { enabled = true },

    keymap = {
        preset = 'default',
        ['<C-k>'] = {},
        ['<C-v>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },

    appearance = {
        nerd_font_variant = 'mono',
    },

    completion = {
        documentation = {
            auto_show = true,
            window = { border = 'rounded' },
        },
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- build manually (~/.local/share/nvim/site/pack/core/opt/blink.cmp)
    fuzzy = {
        implementation = 'rust',
    },
})
