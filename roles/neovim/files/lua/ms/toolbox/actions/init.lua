---@class toolbox.Actions
---@field git toolbox.actions.Git
local M = {}

setmetatable(M, {
    __index = function(t, k)
        t[k] = require("ms.toolbox.actions." .. k)
        return t[k]
    end,
})

return M
