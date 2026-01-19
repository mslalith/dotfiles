---@class util.keys
local M = {}

function M.normal(key, mapping, desc, opts)
    opts = opts or {}
    opts = vim.tbl_deep_extend("force", opts, { desc = desc })
    vim.keymap.set("n", key, mapping, opts)
end

function M.insert(key, mapping, desc, opts)
    opts = opts or {}
    opts = vim.tbl_deep_extend("force", opts, { desc = desc })
    vim.keymap.set("i", key, mapping, opts)
end

function M.visual(key, mapping, desc, opts)
    opts = opts or {}
    opts = vim.tbl_deep_extend("force", opts, { desc = desc })
    vim.keymap.set("v", key, mapping, opts)
end

function M.visual_block(key, mapping, desc, opts)
    opts = opts or {}
    opts = vim.tbl_deep_extend("force", opts, { desc = desc })
    vim.keymap.set("x", key, mapping, opts)
end

function M.terminal(key, mapping, desc, opts)
    opts = opts or {}
    opts = vim.tbl_deep_extend("force", opts, { desc = desc })
    vim.keymap.set("t", key, mapping, opts)
end

function M.unbind_normal(key, opts)
    opts = opts or {}
    vim.keymap.set("n", key, "<nop>", opts)
end

return M
