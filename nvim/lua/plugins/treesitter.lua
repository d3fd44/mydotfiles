---@diagnostic disable: missing-fields

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = { "c", "cpp", "python", "lua", "vim", "vimdoc", "javascript", "rust" },
            auto_install = true,
            highlight = {
                enable = true,
                disable = function(_, buf)
                    local max_filesize = 500 * 1024 -- 500 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false,
            },
        }
    end
}
