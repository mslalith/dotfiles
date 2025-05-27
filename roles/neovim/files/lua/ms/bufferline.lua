local M = {
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
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
            sort_by = "insert_after_current",
            buffer_close_icon = MsConfig.icons.ui.BoldClose,
            modified_icon = MsConfig.icons.ui.CircleSmall,
            close_icon = MsConfig.icons.ui.BoldClose,
            left_trunc_marker = MsConfig.icons.ui.ArrowCircleLeft,
            right_trunc_marker = MsConfig.icons.ui.ArrowCircleRight,
            -- max_name_length = 30,
            -- max_prefix_length = 30,
            -- tab_size = 21,
            offsets = {
                { filetype = "snacks_layout_box" },
            },
            auto_toggle_bufferline = false,
            show_tab_indicators = true,
            enforce_regular_tabs = true,
            always_show_bufferline = true,
        },
    },
}

M.keys = {
    { "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
    { "<leader>bh", "<cmd>BufferLineMovePrev<CR>", desc = "Move buffer to previous" },
    { "<leader>bl", "<cmd>BufferLineMoveNext<CR>", desc = "Move buffer to next" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Toggle buffer pinning" },
    {
        "<leader>bt",
        function()
            M.toggle()
        end,
        desc = "Toggle showing buffers",
    },
}

function M.toggle()
    local status = vim.o.showtabline == 0 and 2 or 0
    vim.o.showtabline = status
end

return M
