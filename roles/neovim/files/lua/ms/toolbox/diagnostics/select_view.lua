---@class toolbox.picker.diagnostic.SelectView
local M = {}

M.picker_key = "toolbox_diagnostic_select_view"

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
M.cmds = {
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
