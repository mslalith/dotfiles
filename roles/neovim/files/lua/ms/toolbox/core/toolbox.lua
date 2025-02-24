local M = {}

M.name = "@ms Toolbox"

---@param cmd string|ms.toolbox.Command
---@return string
function M.name_for(cmd)
    local group = type(cmd) == "string" and cmd or cmd.group
    return M.name .. " (" .. group .. ")"
end

local General = require("ms.toolbox.general")
local Git = require("ms.toolbox.git")
local PickerHistory = require("ms.toolbox.core.picker_history")

-- TODO: revisit
M.git2 = require("ms.toolbox.git")
M.util = require("ms.toolbox.util")
M.command = require("ms.toolbox.core.command")

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

M.general = {
    show = function()
        PickerHistory.show_and_track(General.picker_key, General.show)
    end,
}

M.git = {
    show = function()
        PickerHistory.show_and_track(Git.picker_key, Git.show)
    end,
}

return M
