-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps

-- ctrl backspace/del to delete words
vim.keymap.set("i", "<C-BS>", "<C-w>", { noremap = true })
vim.keymap.set("i", "<C-H>", "<C-w>", { noremap = true })
vim.keymap.set("i", "<C-Del>", "<C-o>dw", { noremap = true })

-- f2 to rename
vim.keymap.set({ "n", "i" }, "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })

-- ctrl alt J/K to scroll while keeping cursor still
vim.keymap.set({"n", "i"}, "<C-M-K>", "8<C-y>", { noremap = true })
vim.keymap.set({"n", "i"}, "<C-M-J>", "8<C-e>", { noremap = true })

-- J/K to move cursor
-- vim.keymap.set("n", "K", "8k", { noremap = true })
-- vim.keymap.set("n", "J", "8j", { noremap = true })
vim.keymap.set("n", "<C-u>", "8<C-u>zz")
vim.keymap.set("n", "<C-d>", "8<C-d>zz")

-- toggle comments
vim.keymap.set("n", "<C-/>", "gcc", { remap = true })
vim.keymap.set("v", "<C-/>", "gc", { remap = true })
vim.keymap.set("n", "<C-_>", "gcc", { remap = true })
vim.keymap.set("v", "<C-_>", "gc", { remap = true })

-- home to ^
vim.keymap.set("i", "<Home>", "<C-o>^", { noremap = true })

-- ctrl w
vim.keymap.set("n", "<C-w>", ":bdelete<CR>", { noremap = true });

-- Map Alt + 1 to Alt + 9 to jump to the corresponding buffer by its ordinal number
vim.api.nvim_set_keymap("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })
-- Map Alt + 0 to jump to the last buffer
vim.api.nvim_set_keymap("n", "<A-0>", ":BufferLineGoToBuffer -1<CR>", { noremap = true, silent = true })
