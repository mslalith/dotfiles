local M = {
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
    },
    keys = {
        { "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
        { "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
        { "<leader>bh", "<cmd>BufferLineMovePrev<CR>", desc = "Move buffer to previous" },
        { "<leader>bl", "<cmd>BufferLineMoveNext<CR>", desc = "Move buffer to next" },
    },
}

function M.config()
    require("bufferline").setup {
        options = {
            numbers = "none",
            close_command = function(n)
                Snacks.bufdelete(n)
            end,
            buffer_close_icon = MsVim.icons.ui.BoldClose,
            modified_icon = MsVim.icons.ui.CircleSmall,
            close_icon = MsVim.icons.ui.BoldClose,
            left_trunc_marker = MsVim.icons.ui.ArrowCircleLeft,
            right_trunc_marker = MsVim.icons.ui.ArrowCircleRight,
            max_name_length = 30,
            max_prefix_length = 30,
            tab_size = 21,
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(_, _, diag)
                local icons = MsVim.icons.diagnostics
                local error = diag.error and icons.Error .. diag.error .. " " or ""
                local warning = diag.warning and icons.Warn .. diag.warning or ""
                return vim.trim(error .. warning)
            end,
            offsets = {
                { filetype = "snacks_layout_box" },
            },
            ---@param opts bufferline.IconFetcherOpts
            get_element_icon = function(opts)
                return MsVim.icons.filetypes[opts.filetype]
            end,
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            show_tab_indicators = true,
            enforce_regular_tabs = true,
            always_show_bufferline = true,
        },
    }
end

return M
