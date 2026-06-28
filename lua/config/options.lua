-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.scroll = 8
vim.opt.mousescroll = "ver:1,hor:6"
vim.g.root_spec = { "cwd" }
vim.opt.listchars = {
    tab = "  ",
    trail = " ",
}
vim.lsp.inlay_hint.enable(false)
vim.g.clipboard = {
    name = "dms",
    copy = {
        ["+"] = { "dms", "cl", "copy" },
        ["*"] = { "dms", "cl", "copy" },
    },
    paste = {
        ["+"] = { "dms", "cl", "paste" },
        ["*"] = { "dms", "cl", "paste" },
    },
    cache_enabled = 0,
}

vim.g.scrollview_diagnostics_hint_symbol = "."
vim.g.scrollview_diagnostics_info_symbol = "."
vim.g.scrollview_diagnostics_warn_symbol = "."
vim.g.scrollview_diagnostics_error_symbol = "!"

