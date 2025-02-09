local M = {
    "nvim-lualine/lualine.nvim",
    event = "BufReadPre",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
    },
}

function M.config()
    local lualine = require("lualine")

    lualine.setup {
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = {
                left = MsVim.icons.ui.DividerRight,
                right = MsVim.icons.ui.DividerLeft,
            },
            section_separators = {
                left = MsVim.icons.ui.BoldDividerRight,
                right = MsVim.icons.ui.BoldDividerLeft,
            },
            always_divide_middle = true,
            globalstatus = vim.o.laststatus == 3,
            disabled_filetypes = {
                statusline = { "snacks_dashboard" },
            },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = {
                {
                    "diagnostics",
                    symbols = {
                        error = MsVim.icons.diagnostics.Error,
                        warn = MsVim.icons.diagnostics.Warn,
                        info = MsVim.icons.diagnostics.Info,
                        hint = MsVim.icons.diagnostics.Hint,
                    },
                },
                { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                { "filename" },
            },
            lualine_x = {
                "encoding",
                "filetype",
                {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                    color = function()
                        return { fg = Snacks.util.color("Special") }
                    end,
                },
            },
            lualine_y = {
                {
                    "diff",
                    symbols = {
                        added = MsVim.icons.git.Added,
                        modified = MsVim.icons.git.Modified,
                        removed = MsVim.icons.git.Removed,
                    },
                    source = function()
                        local gitsigns = vim.b.gitsigns_status_dict
                        if gitsigns then
                            return {
                                added = gitsigns.added,
                                modified = gitsigns.changed,
                                removed = gitsigns.removed,
                            }
                        end
                    end,
                },
                { "progress", separator = " ", padding = { left = 1, right = 0 } },
                { "location", padding = { left = 0, right = 1 } },
            },
            lualine_z = {
                function()
                    return MsVim.icons.ui.Clock .. os.date("%R")
                end,
            },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        extensions = {},
    }
end

return M
