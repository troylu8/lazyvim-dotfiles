-- Always keep at most 1 "preview" buffer open. 
-- "Preview" buffers are ones that are opened but never edited, 
-- only one stays open at a time. (others are automatically closed)
--
-- Upon editing it, "preview" buffer becomes an "active" buffer,
-- which is never automatically closed.


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
        -- skip when switching into an active buf or the preview buf
        if active_bufs[e.buf] ~= nil or e.buf == preview_buf then
            return
        end

        -- ignore if we are switching into a buf that isn't a normal file buf
        if vim.bo[e.buf].buftype ~= "" then
            return
        end

        -- ignore if we are switching into the [No Name] buf
        if vim.api.nvim_buf_get_name(e.buf) == "" then
            return
        end

        -- delete preview buf if possible
        if vim.api.nvim_buf_is_valid(preview_buf) then
            local buf_to_delete = preview_buf
            vim.schedule(function()
                if vim.api.nvim_buf_is_valid(buf_to_delete) then
                    vim.bo[buf_to_delete].buflisted = false
                    vim.api.nvim_buf_delete(buf_to_delete, { unload = true })
                end
            end)
        end

        preview_buf = e.buf
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


return {}
