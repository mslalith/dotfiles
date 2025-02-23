---@class ms.toolbox.sources.pickers
local M = {}

---@type ms.toolbox.Command[]
M.cmds = {
    {
        name = "Jump history",
        group = "Pickers",
        execute = function()
            require("snacks").picker.jumps()
        end,
    },
}

return M
