---@class ms.toolbox.Command
---@field name string
---@field group string
---@field execute fun()
---
---@class ms.toolbox.finder.Item : snacks.picker.finder.Item
---@field idx number
---@field group string
---@field name string
---@field divider boolean
---@field execute fun()

local toolbox_name = "@ms Toolbox"

---@param group? string Show only group commands. Show all if nil
---@return ms.toolbox.finder.Item[]
local function get_items(group)
    ---@type ms.toolbox.finder.Item[]
    local items = {}
    local commands = require("ms.toolbox.commands").all_commands()
    for i, v in ipairs(commands) do
        ---@type ms.toolbox.finder.Item
        local item = {
            idx = i,
            group = v.group,
            text = v.name,
            name = v.name,
            execute = v.execute,
            divider = v.name == "-",
        }
        if not group or v.group == group then
            table.insert(items, item)
        end
    end
    return items
end

---@param group? string Show only group commands. Show all if nil
local function show_toolbox(group)
    local last_idx = 0
    local items = get_items(group)

    Snacks.picker {
        title = toolbox_name,
        source = "ms_toolbox",
        items = items,
        format = function(item, picker)
            local width = picker.layout.opts.layout.width * vim.o.columns
            width = math.floor(width)
            width = (width / 10) * 10 - 4

            local text = items[item.idx].divider and string.rep(item.text, width) or item.text

            ---@type snacks.picker.Highlight[]
            return {
                { text, item.text_hl },
            }
        end,
        on_change = function(picker, item)
            if items[item.idx].divider then
                if last_idx < item.idx then
                    picker:action("list_down")
                else
                    picker:action("list_up")
                end
            end
            last_idx = item.idx
        end,
        layout = MsConfig.snacks.layouts.vscode_bordered,
        confirm = function(picker, item)
            picker:close()
            items[item.idx].execute()
        end,
    }
end

local M = {
    "folke/snacks.nvim",
    keys = {
        {
            "<leader>jj",
            function()
                show_toolbox()
            end,
            desc = toolbox_name,
        },
        {
            "<leader>jg",
            function()
                show_toolbox("Git")
            end,
            desc = toolbox_name,
        },
    },
}

---@param msg string
function M.notify_error(msg)
    vim.notify(msg, vim.log.levels.ERROR, { title = toolbox_name })
end

return M
