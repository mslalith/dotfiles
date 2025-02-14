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
        { "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Toggle buffer pinning" },
    },
    opts = {
        options = {
            numbers = "none",
            close_command = function(n)
                Snacks.bufdelete(n)
            end,
            themable = true,
            indicator = {
                style = "none",
            },
            buffer_close_icon = MsVim.icons.ui.BoldClose,
            modified_icon = MsVim.icons.ui.CircleSmall,
            close_icon = MsVim.icons.ui.BoldClose,
            left_trunc_marker = MsVim.icons.ui.ArrowCircleLeft,
            right_trunc_marker = MsVim.icons.ui.ArrowCircleRight,
            -- max_name_length = 30,
            -- max_prefix_length = 30,
            -- tab_size = 21,
            offsets = {
                { filetype = "snacks_layout_box" },
            },
            show_tab_indicators = true,
            enforce_regular_tabs = true,
            always_show_bufferline = true,
        },
    },
}

return M
