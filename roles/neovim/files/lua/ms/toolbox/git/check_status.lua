---@class toolbox.picker.git.CheckStatus
local M = {}

M.picker_key = "toolbox_git_check_status"

---@param opts? snacks.picker.Config
---@return snacks.Picker
function M.show(opts)
    opts = opts or {}

    ---@type snacks.picker.Config
    local override_opts = {
        focus = "list",
        layout = MsConfig.snacks.layouts.vertical,
        confirm = function(picker)
            picker.was_picked = true
            picker:action("edit")
            picker:close()
        end,
        win = {
            list = {
                keys = {
                    ["s"] = "git_stage",
                    ["<space>"] = "git_stage",
                    ["<A-k>"] = "preview_scroll_up",
                    ["<A-j>"] = "preview_scroll_down",
                    ["<A-p>"] = "toggle_preview",
                    ["<A-m>"] = "toggle_maximize",
                },
            },
        },
    }

    return Snacks.picker.git_status(vim.tbl_deep_extend("force", opts, override_opts))
end

return M
