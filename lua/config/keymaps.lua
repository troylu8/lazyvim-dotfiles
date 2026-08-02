-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps

-- ctrl backspace/del to delete words
vim.keymap.set("i", "<C-BS>", "<C-w>")
vim.keymap.set("i", "<C-H>", "<C-w>")
vim.keymap.set("i", "<C-Del>", "<C-o>dw")

-- f2 to rename
vim.keymap.set({ "n", "i" }, "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>")

-- ctrl J/K to do it 10 times
vim.keymap.set("n", "<C-k>", "10k")
vim.keymap.set("n", "<C-j>", "10j")

-- set C-u and C-d length
vim.keymap.set("n", "<C-u>", "10<C-u>zz", { silent = true })
vim.keymap.set("n", "<C-d>", "10<C-d>zz", { silent = true })

-- toggle comments
vim.keymap.set("n", "<C-/>", "gcc", { remap = true })
vim.keymap.set("v", "<C-/>", "gc", { remap = true })
vim.keymap.set("n", "<C-_>", "gcc", { remap = true })
vim.keymap.set("v", "<C-_>", "gc", { remap = true })

-- home to ^
vim.keymap.set("i", "<Home>", "<C-o>^")

-- alt + number to switch to that buffer
vim.keymap.set("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", { silent = true })
vim.keymap.set("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", { silent = true })
vim.keymap.set("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", { silent = true })
vim.keymap.set("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", { silent = true })
vim.keymap.set("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", { silent = true })
vim.keymap.set("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>", { silent = true })
vim.keymap.set("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>", { silent = true })
vim.keymap.set("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>", { silent = true })
vim.keymap.set("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>", { silent = true })
vim.keymap.set("n", "<A-0>", ":BufferLineGoToBuffer -1<CR>", { silent = true })

-- alt h/l to switch tabs
vim.keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.del("n", "<S-h>") -- disable default tab switching keybinds
vim.keymap.del("n", "<S-l>")

-- ctrl alt h/l to rearrange tabs
vim.keymap.set("n", "<C-A-h>", ":BufferLineMovePrev<CR>", { silent = true })
vim.keymap.set("n", "<C-A-l>", ":BufferLineMoveNext<CR>", { silent = true })

-- ctrl k to toggle inlay hints
vim.keymap.set("n", "<C-K>", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)
