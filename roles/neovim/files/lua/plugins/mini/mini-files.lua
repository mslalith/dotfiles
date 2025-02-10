return {
    "echasnovski/mini.files",
    opts = {
        windows = {
            preview = false,
            -- width_focus = 30,
            -- width_preview = 30,
        },
        options = {
            use_as_default_explorer = false,
            permanent_delete = false,
        },
    },
    keys = {
        {
            "<leader>fm",
            function()
                require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
            end,
            desc = "Open mini.files (Directory of Current File)",
        },
        {
            "<leader>fM",
            function()
                require("mini.files").open(vim.uv.cwd(), true)
            end,
            desc = "Open mini.files (cwd)",
        },
    },
    config = function(_, opts)
        require("mini.files").setup(opts)

        local show_dotfiles = true
        local filter_show = function(fs_entry)
            return true
        end
        local filter_hide = function(fs_entry)
            return not vim.startswith(fs_entry.name, ".")
        end

        local toggle_dotfiles = function()
            show_dotfiles = not show_dotfiles
            local new_filter = show_dotfiles and filter_show or filter_hide
            require("mini.files").refresh { content = { filter = new_filter } }
        end

        vim.api.nvim_create_autocmd("User", {
            pattern = "MiniFilesBufferCreate",
            callback = function(args)
                local buf_id = args.data.buf_id

                MsVim.keys.normal_mode(
                    opts.mappings and opts.mappings.toggle_hidden or "g.",
                    toggle_dotfiles,
                    "Toggle hidden files",
                    { buffer = buf_id }
                )
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "MiniFilesActionRename",
            callback = function(event)
                Snacks.rename.on_rename_file(event.data.from, event.data.to)
            end,
        })
    end,
}
