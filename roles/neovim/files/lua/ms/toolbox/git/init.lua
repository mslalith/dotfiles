local M = {}

M.picker_key = "toolbox_git"

-- Git cli commands
local current_branch_cmd = { "git", "rev-parse", "--abbrev-ref", "HEAD" }
local local_branches_cmd = { "git", "for-each-ref", "--format='%(refname:short)'", "refs/heads/" }

---@type ms.toolbox.Command[]
M.cmds = {
    {
        name = "New Branch",
        group = "Git",
        execute = function()
            Snacks.input.input({
                prompt = "New Branch Name",
            }, function(name)
                if not name then
                    return
                end
                if name == "" then
                    Toolbox.notify_error("Branch name cannot be empty")
                    return
                end

                local check_branch_cmd = { "git", "branch", "--list", name }
                Snacks.picker.util.cmd(check_branch_cmd, function(data)
                    if data[1] ~= "" then
                        Toolbox.notify_error("Branch already exists")
                        return
                    end

                    local create_branch_cmd = { "git", "checkout", "-b", name }
                    Snacks.picker.util.cmd(create_branch_cmd, function()
                        Toolbox.notify_info("Branch created")
                    end)
                end)
            end)
        end,
    },
    {
        name = "Fetch",
        group = "Git",
        execute = function()
            Toolbox.util.cmd.run {
                cmd = { "git", "fetch" },
                group = "Git",
                key = "git_fetch",
                title = "Git Fetch",
                message = "fetching",
            }
        end,
    },
    {
        name = "Pull",
        group = "Git",
        execute = function()
            Toolbox.util.cmd.run {
                cmd = { "git", "pull" },
                group = "Git",
                key = "git_pull",
                title = "Git Pull",
                message = "pulling",
            }
        end,
    },
    {
        name = "Push",
        group = "Git",
        execute = function()
            Toolbox.util.cmd.run {
                cmd = { "git", "push" },
                group = "Git",
                key = "git_push",
                title = "Git Push",
                message = "pushing",
            }
        end,
    },
}

---@param opts? snacks.picker.Config
---@return snacks.Picker
function M.show(opts)
    opts = opts or {}
    local items = Toolbox.commands_to_items(M.cmds)

    return Snacks.picker(vim.tbl_deep_extend("force", opts, {
        title = Toolbox.toolbox_name_for("Git"),
        items = items,
        format = "text",
        layout = MsConfig.snacks.layouts.vscode_bordered,
        confirm = function(picker, item)
            items[item.idx].execute()
            picker:close()
        end,
    }))
end

return M
