---@class ms.toolbox.sources.notifications
local M = {}

---@type ms.toolbox.Command[]
M.cmds = {
    {
        name = "Show notifications",
        execute = function()
            require("snacks").notifier.show_history()
        end,
    },
    {
        name = "Hide notifications",
        execute = function()
            require("snacks").notifier.hide()
        end,
    },
}

return M
