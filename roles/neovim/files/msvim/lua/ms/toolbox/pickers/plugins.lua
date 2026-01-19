---@class ms.toolbox.AddPluginOpts
---@field name string
---@field commands ms.toolbox.Command[]

local M = {}

---@type ms.toolbox.Command[]
local plugins_commands = {}

---@param opts ms.toolbox.AddPluginOpts
function M.add_plugin_commands(opts)
    for _, cmd in ipairs(opts.commands) do
        ---@type ms.toolbox.Command
        local new_cmd = vim.tbl_deep_extend("force", cmd, {
            name = opts.name .. ": " .. cmd.name,
        })
        table.insert(plugins_commands, new_cmd)
    end
end

---@param opts? snacks.picker.Config
---@return snacks.Picker
function M.show(opts)
    Toolbox.show_picker("Plugin Commands", plugins_commands, opts)
end

return M
