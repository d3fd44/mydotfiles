---@diagnostic disable: undefined-global

-- fixing some annoying keymaps
vim.keymap.set("n", "<C-j>", "<nop>")
vim.keymap.set("i", "<C-d>", "<nop>")
vim.keymap.set("i", "<C-u>", "<nop>")
vim.keymap.set("n", "U", "<nop>")

-- movement
vim.keymap.set("n", "<Esc>", ":nohl<CR>")
vim.keymap.set("n", "U", ":join<CR>", { noremap = true }) -- 'Unbreak' feels more join than join itself, isn't it?
vim.keymap.set("i", "<C-h>", "<left>", { noremap = true })
vim.keymap.set("i", "<C-j>", "<down>", { noremap = true })
vim.keymap.set("i", "<C-k>", "<up>", { noremap = true })
vim.keymap.set("i", "<C-l>", "<right>", { noremap = true })
vim.keymap.set("n", "J", "6j")
vim.keymap.set("n", "K", "6k")


-- window and buffer management
vim.keymap.set("n", "<A-]>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<A-[>", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<Leader>h", "<C-w>s", { noremap = true })
vim.keymap.set("n", "<Leader>v", "<C-w>v", { noremap = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-q>", "", {
    noremap = true,
    silent = true,
    callback = function()
        local s = pcall(function() vim.cmd("close") end) -- try closing window first
        if not s then
            s = pcall(function() vim.cmd("bd") end)      -- close buffer if it is the last window
            if not s then print("Unsaved Buffer, use 'bd!' to force quit") end
        end
    end,
})

-- text editing
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("x", "<Leader>p", "\"_dP")
vim.keymap.set({ "n", "v" }, "<Leader>d", "\"_d")
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- others
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>e", "<cmd>Ex<CR>", { silent = true })
vim.keymap.set("n", "H", function() vim.cmd("lua vim.lsp.buf.hover()") end, { noremap = true })

vim.api.nvim_set_keymap("n", "<Leader>.", "", {
    noremap = true,
    callback = function()
        local ft = vim.bo.filetype
        if ft == 'python' then
            vim.cmd('w | !python %')
        end
    end
})
