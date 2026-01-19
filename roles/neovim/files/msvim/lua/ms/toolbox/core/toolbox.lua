local M = {}

M.name = "@ms Toolbox"

---@param cmd string
---@return string
function M.name_for(cmd)
    if cmd == "" then
        return M.name
    end
    return M.name .. " (" .. cmd .. ")"
end

local PickerHistory = require("ms.toolbox.core.picker_history")

M.util = require("ms.toolbox.util")
M.command = require("ms.toolbox.core.command")
M.actions = require("ms.toolbox.actions")
M.general = require("ms.toolbox.pickers.general")
M.git = require("ms.toolbox.pickers.git")
M.plugins = require("ms.toolbox.pickers.plugins")
M.diagnostics = require("ms.toolbox.pickers.diagnostics")

M.notifier = {
    ---@param msg string
    ---@param level? number
    notify = function(msg, level)
        vim.notify(msg, level, { title = M.name })
    end,

    ---@param msg string
    info = function(msg)
        vim.notify(msg, vim.log.levels.INFO, { title = M.name })
    end,

    ---@param msg string
    error = function(msg)
        vim.notify(msg, vim.log.levels.ERROR, { title = M.name })
    end,
}

---@param title string
---@param cmds ms.toolbox.Command[]
---@param opts? snacks.picker.Config
---@return snacks.Picker
function M.show_picker(title, cmds, opts)
    opts = opts or {}
    local items = Toolbox.command.get_finder_items(cmds)

    return Snacks.picker(vim.tbl_deep_extend("force", opts, {
        title = Toolbox.name_for(title),
        items = items,
        format = "text",
        layout = MsConfig.snacks.layouts.vscode_bordered,
        confirm = function(picker, item)
            items[item.idx].execute()
            picker:close()
        end,
    }))
end

return M
