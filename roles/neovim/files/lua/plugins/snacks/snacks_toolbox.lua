---@class ms_toolbox.Command
---@field name string
---@field execute fun()
---
---@class ms_toolbox.finder.Item : snacks.picker.finder.Item
---@field idx number
---@field name string
---@field execute fun()

---@type ms_toolbox.Command[]
local commands = {
    {
        name = "Toggle Dim mode",
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
        name = "Toggle Zen mode",
        execute = function()
            require("snacks").zen()
        end,
    },
}

local function show_toolbox()
    ---@type ms_toolbox.finder.Item[]
    local items = {}
    for i, v in ipairs(commands) do
        ---@type ms_toolbox.finder.Item
        local item = {
            idx = i,
            text = v.name,
            name = v.name,
            execute = v.execute,
        }
        table.insert(items, item)
    end

    Snacks.picker {
        title = "@ms Toolbox",
        source = "ms_toolbox",
        items = items,
        format = "text",
        layout = MsVim.snacks.layouts.vscode_bordered,
        confirm = function(picker, item)
            picker:close()
            items[item.idx].execute()
        end,
    }
end

return {
    "folke/snacks.nvim",
    keys = function()
        MsVim.keys.normal_mode("<leader>j", function()
            show_toolbox()
        end, "@ms Toolbox")
    end,
}
