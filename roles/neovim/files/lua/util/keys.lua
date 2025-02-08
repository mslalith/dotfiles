---@class util.keys
local M = {}

function M.normal_mode(key, mapping, desc, opts)
    opts = opts or {}
    local _opts = vim.tbl_deep_extend("force", opts, { desc = desc })
    vim.keymap.set("n", key, mapping, _opts)
end

function M.insert_mode(key, mapping, desc, opts)
    opts = opts or {}
    local _opts = vim.tbl_deep_extend("force", opts, { desc = desc })
    vim.keymap.set("i", key, mapping, _opts)
end

function M.visual_mode(key, mapping, desc, opts)
    opts = opts or {}
    local _opts = vim.tbl_deep_extend("force", opts, { desc = desc })
    vim.keymap.set("v", key, mapping, _opts)
end

function M.visual_block_mode(key, mapping, desc, opts)
    opts = opts or {}
    local _opts = vim.tbl_deep_extend("force", opts, { desc = desc })
    vim.keymap.set("x", key, mapping, _opts)
end

function M.terminal_mode(key, mapping, desc, opts)
    opts = opts or {}
    local _opts = vim.tbl_deep_extend("force", opts, { desc = desc })
    vim.keymap.set("t", key, mapping, _opts)
end

return M
