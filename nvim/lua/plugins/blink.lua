return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        signature = { enabled = true },

        keymap = { -- see ':h blink-cmp-config-keymap'
            preset = 'default',
            ['<C-k>'] = {},
            ['<C-v>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },
        appearance = { nerd_font_variant = 'mono' },
        completion = {
            documentation = {
                auto_show = true,
                window = { border = "rounded", }
            },
        },
        sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }, },
        fuzzy = {
            -- implementation = "prefer_rust_with_warning", -- see ':h blink-cmp-config-fuzzy'
            implementation = "rust", -- see ':h blink-cmp-config-fuzzy'
        }
    },
    opts_extend = { "sources.default" }
}
