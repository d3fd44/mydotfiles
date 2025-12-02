---@diagnostic disable: undefined-global

vim.keymap.set("n", "<C-j>", "<nop>", { noremap = true })
vim.keymap.set("i", "<C-d>", "<nop>", { noremap = true })
vim.keymap.set("i", "<C-u>", "<nop>", { noremap = true })
vim.keymap.set("n", "U", "<nop>", { noremap = true })

vim.keymap.set("n", "<Esc>", ":nohl<CR>")
vim.keymap.set("i", "<C-h>", "<left>", { noremap = true })
vim.keymap.set("i", "<C-j>", "<down>", { noremap = true })
vim.keymap.set("i", "<C-k>", "<up>", { noremap = true })
vim.keymap.set("i", "<C-l>", "<right>", { noremap = true })
vim.keymap.set("i", "<C-b>", "<C-o>b", { noremap = true })
vim.keymap.set("i", "<C-f>", "<C-o>w", { noremap = true })

vim.keymap.set("n", "<A-]>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<A-[>", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<Leader>s", "<C-w>s", { noremap = true })
vim.keymap.set("n", "<Leader>v", "<C-w>v", { noremap = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-q>", "", {
    noremap = true,
    silent = true,
    callback = function()
        local s = pcall(function() vim.cmd("close") end) -- close window
        if not s then
            s = pcall(function() vim.cmd("bd") end)      -- last window? close buffer
            if not s then print("Unsaved Buffer, use 'bd!' to force quit") end
        end
    end,
})

vim.keymap.set("x", "<Leader>p", "\"_dP")

vim.keymap.set({ "n", "v" }, "<Leader>d", "\"_d")
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>e", "<cmd>Ex<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "<Leader>.", "", {
    noremap = true,
    callback = function()
        local ft = vim.bo.filetype
        if ft == 'python' then
            vim.cmd('w | !python %')
        elseif ft == 'javascript' then
            vim.cmd('w | !node %')
        elseif ft == 'lua' then
            vim.cmd('w | so %')
        end
    end
})
