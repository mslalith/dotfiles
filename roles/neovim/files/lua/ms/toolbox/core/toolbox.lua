local M = {}

M.name = "@ms Toolbox"

---@param cmd string|ms.toolbox.Command
---@return string
function M.name_for(cmd)
    local group = type(cmd) == "string" and cmd or cmd.group
    return M.name .. " (" .. group .. ")"
end

local General = require("ms.toolbox.general")
local Git = require("ms.toolbox.git")
M.util = require("ms.toolbox.util")

---@type table<string, snacks.Picker>
local track_pickers = {}

local function on_close(picker_name)
    local last = track_pickers[picker_name]
    if last then
        track_pickers[picker_name] = nil
        local picker = last.new(last.opts)
        picker:show()
    end
end

---@param key string
---@param show_cb fun(opts: snacks.picker.Config): snacks.Picker
local function update_track_picker(key, show_cb)
    local current_picker = Snacks.picker.get()[1]
    track_pickers[key] = current_picker

    ---@type snacks.picker.Config
    local opts = {
        win = {
            input = {
                keys = {
                    ["<Esc>"] = function(win)
                        win:close()
                        on_close(key)
                    end,
                },
            },
        },
    }

    show_cb(opts)
end

M.notifier = {
    ---@param msg string
    ---@param level? number
    notify = function(msg, level)
        vim.notify(msg, level, { title = M.name })
    end,

    ---@param msg string
    info = function(msg)
        vim.notify(msg, vim.log.levels.INFO, { title = M.name })
    end,

    ---@param msg string
    error = function(msg)
        vim.notify(msg, vim.log.levels.ERROR, { title = M.name })
    end,
}

M.general = {
    show = function()
        update_track_picker(General.picker_key, General.show)
    end,
}

M.git = {
    show = function()
        update_track_picker(Git.picker_key, Git.show)
    end,
}

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

return M
