---@class ms.toolbox.AddPluginOpts
---@field name string
---@field commands ms.toolbox.plugins.PluginCommand[]

---@class ms.toolbox.plugins.PluginCommand
---@field name string
---@field execute function()

local M = {}

---@type ms.toolbox.plugins.PluginCommand[]
local plugins_commands = {}

---@param opts ms.toolbox.AddPluginOpts
function M.add_plugin_commands(opts)
    for _, cmd in ipairs(opts.commands) do
        ---@type ms.toolbox.plugins.PluginCommand
        local new_cmd = {
            name = opts.name .. ": " .. cmd.name,
            execute = cmd.execute,
        }
        table.insert(plugins_commands, new_cmd)
    end
end

---@param items ms.toolbox.plugins.PluginCommand[]
---@return ms.toolbox.finder.Item[]
local function get_items(items)
    local picker_items = {}
    for i, v in ipairs(items) do
        ---@type ms.toolbox.finder.Item
        local item = {
            idx = i,
            text = v.name,
            group = v.name,
            name = v.name,
            execute = v.execute,
            divider = false,
        }
        table.insert(picker_items, item)
    end
    return picker_items
end

---@param opts? snacks.picker.Config
---@return snacks.Picker
function M.show(opts)
    opts = opts or {}

    local items = get_items(plugins_commands)

    ---@type snacks.picker.Config
    local override_opts = {
        title = Toolbox.name_for("Plugin Commands"),
        items = items,
        format = "text",
        layout = MsConfig.snacks.layouts.vscode_bordered,
        confirm = function(picker, item)
            picker.was_picked = true
            items[item.idx].execute()
            picker:close()
        end,
    }

    return Snacks.picker(vim.tbl_deep_extend("force", opts, override_opts))
end

return M
