-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- ********** START ACTIVE/PREVIEW BUFFERS BEHAVIOR **********

local active_bufs = {}
local preview_buf = -1

vim.api.nvim_create_autocmd("SessionLoadPost", {
    callback = function()
        active_bufs = {}
        preview_buf = -1

        -- when loading a session, set all bufs as active
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.bo[buf].buftype == "" then
                active_bufs[buf] = true
            end
        end
    end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "TextChanged" }, {
    callback = function(e)
        -- ignore bufs that arent normal file bufs
        if vim.bo[e.buf].buftype ~= "" then
            return
        end

        active_bufs[e.buf] = true
        if e.buf == preview_buf then
            preview_buf = -1
        end
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(e)
        -- ignore bufs that arent normal file bufs
        if vim.bo[e.buf].buftype ~= "" then
            return
        end

        -- if new buf is neither active nor the preview buf
        if active_bufs[e.buf] == nil and e.buf ~= preview_buf then
            -- if there's an existing preview buf, delete it
            if preview_buf ~= -1 then
                local buf_to_delete = preview_buf
                vim.schedule(function()
                    if vim.api.nvim_buf_is_valid(buf_to_delete) then
                        vim.bo[buf_to_delete].buflisted = false
                        vim.api.nvim_buf_delete(buf_to_delete, { unload = true })
                    end
                end)
            end

            preview_buf = e.buf
        end
    end,
})

vim.api.nvim_create_autocmd("BufDelete", {
    callback = function(e)
        active_bufs[e.buf] = nil
        if e.buf == preview_buf then
            preview_buf = -1
        end
    end,
})

-- ********** END ACTIVE/PREVIEW BUFFERS BEHAVIOR **********
