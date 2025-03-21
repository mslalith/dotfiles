local M = {}

M.name = "@ms Toolbox"

---@param cmd string|ms.toolbox.Command
---@return string
function M.name_for(cmd)
    local group = type(cmd) == "string" and cmd or cmd.group
    return M.name .. " (" .. group .. ")"
end

local PickerHistory = require("ms.toolbox.core.picker_history")

M.general = require("ms.toolbox.general")
M.git = require("ms.toolbox.git")
M.util = require("ms.toolbox.util")
M.command = require("ms.toolbox.core.command")
M.actions = require("ms.toolbox.actions")
M.plugins = require("ms.toolbox.plugins")

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

return M
