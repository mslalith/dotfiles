local M = {}

---@return boolean
local function is_virtual_lines_enabled()
    if vim.diagnostic.config().virtual_lines then
        return true
    end

    local diagnostic = require("tiny-inline-diagnostic.diagnostic")
    if diagnostic.user_toggle_state then
        return true
    end

    return false
end

local function enable_default_diagnostics()
    M.show_hide_inbuilt_line_diagnostics(false)
    M.show_hide_tiny_inline_diagnostics(true)
end

local function disable_all_diagnostics()
    M.show_hide_inbuilt_line_diagnostics(false)
    M.show_hide_tiny_inline_diagnostics(false)
end

---@param show boolean
function M.show_hide_inbuilt_line_diagnostics(show)
    if show then
        vim.diagnostic.config {
            virtual_lines = {
                current_line = true,
            },
        }
    else
        vim.diagnostic.config { virtual_lines = false }
    end
end

---@param show boolean
function M.show_hide_tiny_inline_diagnostics(show)
    local diagnostic = require("tiny-inline-diagnostic")
    if show then
        diagnostic.enable()
    else
        diagnostic.disable()
    end
end

---@type ms.toolbox.Command[]
local select_view_cmds = {
    {
        name = "In-built Line Diagnostics",
        group = "Diagnostics",
        execute = function()
            M.show_hide_inbuilt_line_diagnostics(true)
            M.show_hide_tiny_inline_diagnostics(false)
        end,
    },
    {
        name = "Tiny Inline Diagnostics",
        group = "Diagnostics",
        execute = function()
            M.show_hide_inbuilt_line_diagnostics(false)
            M.show_hide_tiny_inline_diagnostics(true)
        end,
    },
}

---@type ms.toolbox.Command[]
local cmds = {
    {
        name = "Toggle virtual text",
        group = "Diagnostics",
        execute = function()
            if vim.diagnostic.config().virtual_text then
                vim.diagnostic.config { virtual_text = false }
            else
                vim.diagnostic.config { virtual_text = true }
            end
        end,
    },
    {
        name = "Toggle virtual lines",
        group = "Diagnostics",
        execute = function()
            if is_virtual_lines_enabled() then
                disable_all_diagnostics()
            else
                enable_default_diagnostics()
            end
        end,
    },
    {
        name = "Select diagnostic view",
        group = "Diagnostics",
        execute = function()
            Toolbox.show_picker("Diagnostics", select_view_cmds)
        end,
    },
}

---@param opts? snacks.picker.Config
---@return snacks.Picker
function M.show(opts)
    Toolbox.show_picker("Diagnostics", cmds, opts)
end

return M
