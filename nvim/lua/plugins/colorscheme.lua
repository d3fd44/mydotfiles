---@diagnostic disable: undefined-global

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            -- vim.cmd("colorscheme gruvbox")
            vim.cmd("colorscheme carbonfox")
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end
    },
    {
        "EdenEast/nightfox.nvim",
        -- config = function()
        --     vim.o.background = "dark"
        --     vim.cmd("colorscheme nightfox")
        -- end
    },
    {
        "rebelot/kanagawa.nvim",
        -- config = function()
        --     vim.o.background = "dark"
        --     vim.cmd("colorscheme kanagawa-wave")
        -- end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        -- config = function()
        -- vim.o.background = "dark"
        -- vim.cmd("colorscheme tokyonight-moon")
        --
        -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        -- end
    },
}
