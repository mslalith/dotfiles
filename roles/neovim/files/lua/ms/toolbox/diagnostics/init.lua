---@class toolbox.picker.Diagnostics
---@field select_view toolbox.picker.diagnostic.SelectView
local M = {}

setmetatable(M, {
    __index = function(t, k)
        t[k] = require("ms.toolbox.diagnostics." .. k)
        return t[k]
    end,
})

M.picker_key = "toolbox_diagnostics"

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
    Toolbox.diagnostics.select_view.show_hide_inbuilt_line_diagnostics(false)
    Toolbox.diagnostics.select_view.show_hide_tiny_inline_diagnostics(true)
end

local function disable_all_diagnostics()
    Toolbox.diagnostics.select_view.show_hide_inbuilt_line_diagnostics(false)
    Toolbox.diagnostics.select_view.show_hide_tiny_inline_diagnostics(false)
end

---@type ms.toolbox.Command[]
M.cmds = {
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
            Toolbox.diagnostics.select_view.show()
        end,
    },
}

---@param opts? snacks.picker.Config
---@return snacks.Picker
function M.show(opts)
    opts = opts or {}
    local items = Toolbox.command.get_finder_items(M.cmds)

    return Snacks.picker(vim.tbl_deep_extend("force", opts, {
        title = Toolbox.name_for("Diagnostics"),
        items = items,
        format = "text",
        layout = MsConfig.snacks.layouts.vscode_bordered,
        confirm = function(picker, item)
            picker.was_picked = true
            items[item.idx].execute()
            picker:close()
        end,
    }))
end

return M
