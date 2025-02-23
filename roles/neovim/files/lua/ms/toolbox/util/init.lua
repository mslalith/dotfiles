---@class ToolboxUtils
---@field cmd toolbox.util.Cmd
local M = {}

setmetatable(M, {
    __index = function(t, k)
        t[k] = require("ms.toolbox.util." .. k)
        return t[k]
    end,
})

return M
