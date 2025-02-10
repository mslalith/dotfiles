local M = {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
}

function M.toggle()
    local lsp_lines = require("lsp_lines")
    vim.diagnostic.config {
        virtual_text = not lsp_lines.toggle(),
    }
end

function M.config()
    local lsp_lines = require("lsp_lines")
    lsp_lines.setup()
    M.toggle()

    MsVim.keys.normal_mode("<leader>ld", function()
        M.toggle()
    end, "Toggle virtual diagnostics")
end

return M
