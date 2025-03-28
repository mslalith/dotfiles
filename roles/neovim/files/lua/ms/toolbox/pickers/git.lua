local M = {}

-- Git cli commands
local current_branch_cmd = { "git", "rev-parse", "--abbrev-ref", "HEAD" }
local local_branches_cmd = { "git", "for-each-ref", "--format='%(refname:short)'", "refs/heads/" }

---@type ms.toolbox.Command[]
local cmds = {
    {
        name = "New Branch",
        group = "Git",
        execute = function()
            Toolbox.actions.git.create_branch()
        end,
    },
    {
        name = "Commit",
        group = "Git",
        execute = function()
            Toolbox.actions.git.commit()
        end,
    },
    {
        name = "Fetch",
        group = "Git",
        execute = function()
            Toolbox.util.cmd.run_with_progress {
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
            Toolbox.util.cmd.run_with_progress {
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
            Toolbox.actions.git.push()
        end,
    },
    {
        name = "Status",
        group = "Git",
        execute = function()
            Toolbox.git.show_status()
        end,
    },
}

---@param opts? snacks.picker.Config
---@return snacks.Picker
function M.show(opts)
    Toolbox.show_picker("Git", cmds, opts)
end

---@param opts? snacks.picker.Config
---@return snacks.Picker
function M.show_status(opts)
    opts = opts or {}

    ---@type snacks.picker.Config
    local override_opts = {
        focus = "list",
        layout = MsConfig.snacks.layouts.vertical,
        confirm = function(picker)
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
