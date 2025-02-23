---@class Toolbox
---@field git ms.toolbox.sources.git
local M = {
    "folke/snacks.nvim",
}

M.toolbox_name = "@ms Toolbox"

---@type table<string, snacks.Picker>
local pickers = {}

function M.show_git_toolbox()
    local current_picker = Snacks.picker.get()[1]
    current_picker:close()
    pickers["git_toolbox"] = current_picker
    require("ms.toolbox.git").show_git_toolbox()
end

function M.on_close(picker_name)
    local last = pickers[picker_name]
    if last then
        pickers[picker_name] = nil
        local picker = last.new(last.opts)
        picker:show()
    end
end

---@param cmd string|ms.toolbox.Command
---@return string
function M.toolbox_name_for(cmd)
    local group = type(cmd) == "string" and cmd or cmd.group
    return M.toolbox_name .. " (" .. group .. ")"
end

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

---@param group? string Show only group commands. Show all if nil
---@return ms.toolbox.finder.Item[]
local function get_items(group)
    local commands = require("ms.toolbox.commands").all_commands()
    commands = vim.tbl_filter(function(cmd)
        return not group or cmd.group == group
    end, commands)
    return M.commands_to_items(commands)
end

---@param commands ms.toolbox.Command[]
---@return ms.toolbox.finder.Item[]
function M.commands_to_items(commands)
    ---@type ms.toolbox.finder.Item[]
    local items = {}
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
        table.insert(items, item)
    end
    return items
end

---@param group? string Show only group commands. Show all if nil
local function show_toolbox(title, group)
    title = title or M.toolbox_name
    local last_idx = 0
    local items = get_items(group)

    Snacks.picker {
        title = title,
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
            items[item.idx].execute()
            picker:close()
        end,
    }
end

M.keys = {
    {
        "<leader>tt",
        function()
            show_toolbox()
        end,
        desc = M.toolbox_name,
    },
    {
        "<leader>tg",
        function()
            M.show_git_toolbox()
        end,
        desc = M.toolbox_name_for("Git"),
    },
}

---@param msg string
function M.notify_info(msg)
    vim.notify(msg, vim.log.levels.INFO, { title = M.toolbox_name })
end

---@param msg string
function M.notify_error(msg)
    vim.notify(msg, vim.log.levels.ERROR, { title = M.toolbox_name })
end

return M
