---@diagnostic disable: undefined-global

return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            vim.cmd("colorscheme tokyonight-night")
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end
    },
    { "EdenEast/nightfox.nvim", },
    { "rebelot/kanagawa.nvim", },
    { "folke/tokyonight.nvim", },
    { "rose-pine/neovim",       name = "rose-pine" },
    { "catppuccin/nvim",        name = "catppuccin" },
}
