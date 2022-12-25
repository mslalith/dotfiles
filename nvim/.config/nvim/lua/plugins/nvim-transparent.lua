local M = {
    "xiyaowong/nvim-transparent",
}

function M.config()
    require("transparent").setup {
        enable = true,
        extra_groups = {
            -- In particular, when you set it to 'all', that means all available groups

            -- nvim-bufferline
            "BufferLineTabClose",
            "BufferlineBufferSelected",
            "BufferLineFill",
            "BufferLineBackground",
            "BufferLineSeparator",
            "BufferLineIndicatorSelected",
        },
        exclude = {},
    }
end

return M
