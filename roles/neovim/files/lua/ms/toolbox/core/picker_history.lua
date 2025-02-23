local M = {}

---@class toolbox.LastPicker
---@field opts snacks.picker.Config
---@field selected snacks.picker.Item[]
---@field cursor number
---@field top number
---@field filter snacks.picker.Filter

---@type table<string, toolbox.LastPicker>
local picker_history = {}

---@param picker snacks.Picker
---@return toolbox.LastPicker
local function get_saveable_picker_details(picker)
    return {
        opts = picker.init_opts or {},
        selected = picker:selected { fallback = false },
        cursor = picker.list.cursor,
        topline = picker.list.top,
        filter = picker.input.filter,
    }
end

---@param last toolbox.LastPicker
local function resume_picker(last)
    last.opts.pattern = last.filter.pattern
    last.opts.search = last.filter.search
    local new_picker = Snacks.picker.pick(last.opts)
    new_picker:show()
    new_picker.list:set_selected(last.selected)
    new_picker.list:update()
    new_picker.input:update()
    new_picker.matcher.task:on(
        "done",
        vim.schedule_wrap(function()
            if new_picker.closed then
                return
            end
            new_picker.list:view(last.cursor, last.top)
        end)
    )
end

local function on_close(picker_key)
    local prev_picker = picker_history[picker_key]
    if prev_picker then
        picker_history[picker_key] = nil
        resume_picker(prev_picker)
    end
end

---@param key string
---@param show_cb fun(opts: snacks.picker.Config): snacks.Picker
function M.show_and_track(key, show_cb)
    local last_picker = Snacks.picker.get()[1]

    ---@type snacks.picker.Config
    local opts = {
        on_close = function()
            if last_picker then
                picker_history[key] = get_saveable_picker_details(last_picker)
            end
            on_close(key)
        end,
    }

    show_cb(opts)
end

return M
