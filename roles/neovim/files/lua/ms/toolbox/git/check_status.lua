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
        actions = {
            commit = function(picker)
                Toolbox.actions.git.commit(function()
                    vim.schedule(function()
                        picker:close()
                    end)
                end)
            end,
            amend = function(picker)
                Toolbox.actions.git.amend(function()
                    vim.schedule(function()
                        picker:close()
                    end)
                end)
            end,
            lazygit_status = function(picker)
                MsConfig.snacks.lazygit_status()
                picker:close()
            end,
        },
        win = {
            list = {
                keys = {
                    ["e"] = "edit",
                    ["s"] = "git_stage",
                    ["<space>"] = "git_stage",
                    ["<A-k>"] = "preview_scroll_up",
                    ["<A-j>"] = "preview_scroll_down",
                    ["<A-p>"] = "toggle_preview",
                    ["<A-m>"] = "toggle_maximize",
                    ["c"] = "commit",
                    ["a"] = "amend",
                    ["l"] = "lazygit_status",
                },
            },
        },
    }

    return Snacks.picker.git_status(vim.tbl_deep_extend("force", opts, override_opts))
end

return M
