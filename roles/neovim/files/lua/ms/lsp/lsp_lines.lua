return {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    keys = {
        { "<leader>ld", "<cmd>lua require('lsp_lines').toggle()<cr>", desc = "Toggle LSP lines diagnostics" },
    },
    config = function()
        local lsp_lines = require("lsp_lines")
        lsp_lines.setup()

        -- disable
        lsp_lines.toggle()
    end,
}
