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
        name = "Toggle distraction free mode",
        execute = function()
            require("ms.bufferline").toggle()
            require("ms.lualine").toggle()
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

---@type toolbox.Command[]
local other_cmds = {
    {
        name = "Show image under cursor",
        execute = function()
            require("snacks").image.hover()
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

    local groups = {
        picker_cmds,
        toggle_cmds,
        notification_cmds,
    }

    for _, v in ipairs(groups) do
        MsConfig.tbl_insert(cmds, v)
        table.insert(cmds, divider)
    end

    -- remove last divider
    table.remove(cmds, #cmds)

    return cmds
end

return M
