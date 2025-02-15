---@class ms_toolbox.Command
---@field name string
---@field execute fun()
---
---@class ms_toolbox.finder.Item : snacks.picker.finder.Item
---@field idx number
---@field name string
---@field execute fun()

---@return ms_toolbox.Command[]
local function build_commands()
    ---@type ms_toolbox.Command[]
    local picker_cmds = {
        {
            name = "Jump history",
            execute = function()
                require("snacks").picker.jumps()
            end,
        },
    }

    ---@type ms_toolbox.Command[]
    local toggle_cmds = {
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

    local all_cmds = {}
    MsVim.tbl_insert(all_cmds, picker_cmds)
    MsVim.tbl_insert(all_cmds, toggle_cmds)
    return all_cmds
end

local function show_toolbox()
    ---@type ms_toolbox.finder.Item[]
    local items = {}
    local commands = build_commands()
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
