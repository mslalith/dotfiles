return {
    "b0o/incline.nvim",
    event = "VeryLazy",
    config = function()
        local devicons = require("nvim-web-devicons")
        require("incline").setup {
            highlight = {
                groups = {
                    InclineNormal = { default = true, group = "lualine_b_normal" },
                    InclineNormalNC = { default = true, group = "Comment" },
                },
            },
            window = {
                margin = {
                    horizontal = 0,
                    vertical = 0,
                },
                padding = 0,
                overlap = {
                    borders = true,
                    statusline = false,
                    tabline = false,
                    winbar = true,
                },
            },
            render = function(props)
                local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                if filename == "" then
                    filename = "[No Name]"
                end
                local ft_icon, ft_color = devicons.get_icon_color(filename)

                local function get_diagnostic_label()
                    local icons = {
                        error = MsVim.icons.diagnostics.Error,
                        warn = MsVim.icons.diagnostics.Warn,
                        info = MsVim.icons.diagnostics.Info,
                        hint = MsVim.icons.diagnostics.Hint,
                    }
                    local label = {}

                    for severity, icon in pairs(icons) do
                        local n = #vim.diagnostic.get(
                            props.buf,
                            { severity = vim.diagnostic.severity[string.upper(severity)] }
                        )
                        if n > 0 then
                            table.insert(
                                label,
                                { icon .. n .. " ", group = "DiagnosticSign" .. severity, guibg = "none" }
                            )
                        end
                    end
                    return label
                end

                local contents = {}

                local diagnostic_label = get_diagnostic_label()
                if not vim.tbl_isempty(diagnostic_label) then
                    -- table.insert(
                    --     contents,
                    --     { MsVim.icons.ui.BoldDividerLeft, guibg = "InclineNormal", guifg = "InclineNormal" }
                    -- )
                    if vim.tbl_isempty(contents) then
                        table.insert(contents, { " ", guibg = "none" })
                    end
                    table.insert(contents, { diagnostic_label })
                end

                if not MsVim.plugins.has("bufferline.nvim") then
                    if vim.tbl_isempty(contents) then
                        table.insert(contents, { " ", guibg = "none" })
                    end
                    table.insert(contents, { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" })
                    table.insert(
                        contents,
                        { filename .. " ", gui = vim.bo[props.buf].modified and "bold,italic" or "bold" }
                    )
                end

                if not vim.tbl_isempty(contents) then
                    table.insert(contents, { " ", guibg = "none" })
                end

                return contents
            end,
        }
    end,
}
