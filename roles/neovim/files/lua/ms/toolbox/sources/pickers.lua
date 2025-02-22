---@class ms.toolbox.sources.pickers
local M = {}

---@type ms.toolbox.Command[]
M.cmds = {
    {
        name = "Jump history",
        execute = function()
            require("snacks").picker.jumps()
        end,
    },
}

return M
