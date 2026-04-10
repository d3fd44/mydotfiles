vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
    { src = "https://github.com/folke/tokyonight.nvim" },
    {
        src = "https://github.com/saghen/blink.cmp",
        name = "blink.cmp",
        version = 'v1'
    },
})

local function load_plugins()
    local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
    for _, file in ipairs(vim.fn.readdir(plugin_dir)) do
        if file:match("%.lua$") then
            local module = file:gsub("%.lua$", "")
            require("plugins." .. module)
        end
    end
end

load_plugins()
