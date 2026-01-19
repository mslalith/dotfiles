local M = {}

---@type ms.toolbox.Command[]
local picker_cmds = {
    {
        name = "Jump history",
        group = "Pickers",
        execute = function()
            require("snacks").picker.jumps()
        end,
    },
}

---@type ms.toolbox.Command[]
local toggle_cmds = {
    {
        name = "Toggle distraction free mode",
        group = "Toggles",
        execute = function()
            require("ms.bufferline").toggle()
            require("ms.lualine").toggle()
        end,
    },
    {
        name = "Toggle Bufferline",
        group = "Toggles",
        execute = function()
            require("ms.bufferline").toggle()
        end,
    },
    {
        name = "Toggle dim mode",
        group = "Toggles",
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
        group = "Toggles",
        execute = function()
            require("snacks").zen()
        end,
    },
    {
        name = "Toggle indent guides",
        group = "Toggles",
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

---@type ms.toolbox.Command[]
local notification_cmds = {
    {
        name = "Show notifications",
        group = "Notifications",
        execute = function()
            require("snacks").notifier.show_history()
        end,
    },
    {
        name = "Hide notifications",
        group = "Notifications",
        execute = function()
            require("snacks").notifier.hide()
        end,
    },
}

-- TODO: revisit this
---@type ms.toolbox.Command[]
local other_cmds = {
    {
        name = "Show image under cursor",
        group = "Others",
        execute = function()
            require("snacks").image.hover()
        end,
    },
}

---@param opts? snacks.picker.Config
---@return snacks.Picker
function M.show(opts)
    ---@type ms.toolbox.Command[]
    local cmds = {}

    local cmd_sources = {
        picker_cmds,
        toggle_cmds,
        notification_cmds,
        other_cmds,
    }

    for _, v in ipairs(cmd_sources) do
        MsConfig.tbl_insert(cmds, v)
    end

    Toolbox.show_picker("", cmds, opts)
end

return M
