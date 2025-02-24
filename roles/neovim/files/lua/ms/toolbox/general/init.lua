local M = {}

M.picker_key = "toolbox_general"

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
        sources.pickers.cmds,
        {
            {
                name = "Git Toolbox",
                group = "Git",
                execute = function()
                    Toolbox.git.show()
                end,
            },
        },
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

---@return ms.toolbox.Command[]
local function all_commands()
    ---@type ms.toolbox.Command[]
    local cmds = {}

    local sources = require("ms.toolbox.general.sources")

    local groups = {
        sources.pickers.cmds,
        {
            {
                name = "Git Toolbox",
                group = "Git",
                execute = function()
                    Toolbox.git.show()
                end,
            },
        },
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

local function get_items()
    local commands = all_commands()
    return Toolbox.command.get_finder_items(commands)
end

---@param opts? snacks.picker.Config
---@return snacks.Picker
function M.show(opts)
    local last_idx = 0
    local items = get_items()

    return Snacks.picker(vim.tbl_deep_extend("force", opts, {
        title = Toolbox.name,
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
            picker.was_picked = true
            items[item.idx].execute()
            picker:close()
        end,
    }))
end

return M
