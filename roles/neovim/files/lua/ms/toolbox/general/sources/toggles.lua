---@class ms.toolbox.sources.toggles
local M = {}

---@type ms.toolbox.Command[]
M.cmds = {
    {
        name = "Toggle distraction free mode",
        group = "Toggles",
        execute = function()
            require("ms.bufferline").toggle()
            require("ms.lualine").toggle()
        end,
    },
    {
        name = "Toggle dim mode",
        group = "Toggles",
        execute = function()
            local snacks_dim = require("snacks").dim
            if snacks_dim.enabled then
                snacks_dim.disable()
            else
                snacks_dim.enable()
            end
        end,
    },
    {
        name = "Toggle zen mode",
        group = "Toggles",
        execute = function()
            require("snacks").zen()
        end,
    },
    {
        name = "Toggle indent guides",
        group = "Toggles",
        execute = function()
            local snacks_indent = require("snacks").indent
            if snacks_indent.enabled then
                snacks_indent.disable()
            else
                snacks_indent.enable()
            end
        end,
    },
}

return M
