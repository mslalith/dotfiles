---@class ms.toolbox.CommandsCenter
local M = {}

-- TODO: revisit this
---@type ms.toolbox.Command[]
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

---@return ms.toolbox.Command[]
function M.all_commands()
    ---@type ms.toolbox.Command[]
    local cmds = {}

    local sources = require("ms.toolbox.sources")

    local groups = {
        sources.git.cmds,
        sources.pickers.cmds,
        sources.toggles.cmds,
        sources.notifications.cmds,
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
