local M = {}

---@type toolbox.Command[]
local picker_cmds = {
    {
        name = "Jump history",
        execute = function()
            require("snacks").picker.jumps()
        end,
    },
}

---@type toolbox.Command[]
local toggle_cmds = {
    {
        name = "Toggle bufferline",
        execute = function()
            require("plugins.bufferline").toggle()
        end,
    },
    {
        name = "Toggle dim mode",
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
        execute = function()
            require("snacks").zen()
        end,
    },
    {
        name = "Toggle indent guides",
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

---@type toolbox.Command[]
local notification_cmds = {
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

local divider = {
    name = "-",
    execute = function() end,
}

---@return toolbox.Command[]
function M.all_commands()
    ---@type toolbox.Command[]
    local cmds = {}
    MsConfig.tbl_insert(cmds, picker_cmds)
    table.insert(cmds, divider)
    MsConfig.tbl_insert(cmds, toggle_cmds)
    table.insert(cmds, divider)
    MsConfig.tbl_insert(cmds, notification_cmds)
    return cmds
end

return M
