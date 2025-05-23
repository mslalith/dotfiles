local M = {
    "sindrets/diffview.nvim",
    keys = { "<leader>", "d" },
    cond = MsConfig.is_git_repo,
    dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
    local actions = require("diffview.actions")

    MsConfig.keys.normal("<leader>d", ":DiffviewToggle<CR>", "Toggle Git Diff")

    vim.api.nvim_create_user_command("DiffviewToggle", function(e)
        local view = require("diffview.lib").get_current_view()

        if view then
            vim.cmd("DiffviewClose")
        else
            vim.cmd("DiffviewOpen " .. e.args)
        end
    end, { nargs = "*" })

    require("diffview").setup {
        use_icons = true, -- Requires nvim-web-devicons
        icons = { -- Only applies when use_icons is true.
            folder_closed = "",
            folder_open = "",
        },
        signs = {
            fold_closed = "",
            fold_open = "",
        },
        keymaps = {
            disable_defaults = false, -- Disable the default keymaps
            view = {
                -- The `view` bindings are active in the diff buffers, only when the current
                -- tabpage is a Diffview.
                ["<tab>"] = actions.select_next_entry, -- Open the diff for the next file
                ["<s-tab>"] = actions.select_prev_entry, -- Open the diff for the previous file
                ["gf"] = actions.goto_file, -- Open the file in a new split in the previous tabpage
                ["<C-w><C-f>"] = actions.goto_file_split, -- Open the file in a new split
                ["<C-w>gf"] = actions.goto_file_tab, -- Open the file in a new tabpage
                ["<leader>e"] = actions.focus_files, -- Bring focus to the files panel
                ["<leader>b"] = actions.toggle_files, -- Toggle the files panel.
            },
            file_panel = {
                ["j"] = actions.next_entry, -- Bring the cursor to the next file entry
                ["<down>"] = actions.next_entry,
                ["k"] = actions.prev_entry, -- Bring the cursor to the previous file entry.
                ["<up>"] = actions.prev_entry,
                ["<cr>"] = actions.select_entry, -- Open the diff for the selected entry.
                ["o"] = actions.select_entry,
                ["<2-LeftMouse>"] = actions.select_entry,
                ["-"] = false, -- actions.toggle_stage_entry, -- Stage / unstage the selected entry.
                ["S"] = false, -- actions.stage_all,          -- Stage all entries.
                ["U"] = false, -- actions.unstage_all,        -- Unstage all entries.
                ["X"] = false, -- actions.restore_entry,      -- Restore entry to the state on the left side.
                ["R"] = actions.refresh_files, -- Update stats and entries in the file list.
                ["L"] = actions.open_commit_log, -- Open the commit log panel.
                ["<c-b>"] = actions.scroll_view(-0.25), -- Scroll the view up
                ["<c-f>"] = actions.scroll_view(0.25), -- Scroll the view down
                ["<tab>"] = actions.select_next_entry,
                ["<s-tab>"] = actions.select_prev_entry,
                ["gf"] = actions.goto_file,
                ["<C-w><C-f>"] = actions.goto_file_split,
                ["<C-w>gf"] = actions.goto_file_tab,
                ["i"] = actions.listing_style, -- Toggle between 'list' and 'tree' views
                ["f"] = actions.toggle_flatten_dirs, -- Flatten empty subdirectories in tree listing style.
                ["<leader>e"] = actions.focus_files,
                ["<leader>b"] = actions.toggle_files,
            },
            file_history_panel = {
                ["g!"] = actions.options, -- Open the option panel
                ["<C-A-d>"] = actions.open_in_diffview, -- Open the entry under the cursor in a diffview
                ["y"] = actions.copy_hash, -- Copy the commit hash of the entry under the cursor
                ["L"] = actions.open_commit_log,
                ["zR"] = actions.open_all_folds,
                ["zM"] = actions.close_all_folds,
                ["j"] = actions.next_entry,
                ["<down>"] = actions.next_entry,
                ["k"] = actions.prev_entry,
                ["<up>"] = actions.prev_entry,
                ["<cr>"] = actions.select_entry,
                ["o"] = actions.select_entry,
                ["<2-LeftMouse>"] = actions.select_entry,
                ["<c-b>"] = actions.scroll_view(-0.25),
                ["<c-f>"] = actions.scroll_view(0.25),
                ["<tab>"] = actions.select_next_entry,
                ["<s-tab>"] = actions.select_prev_entry,
                ["gf"] = actions.goto_file,
                ["<C-w><C-f>"] = actions.goto_file_split,
                ["<C-w>gf"] = actions.goto_file_tab,
                ["<leader>e"] = actions.focus_files,
                ["<leader>b"] = actions.toggle_files,
            },
            option_panel = {
                ["<tab>"] = actions.select_entry,
                ["q"] = actions.close,
            },
        },
    }
end

return M
