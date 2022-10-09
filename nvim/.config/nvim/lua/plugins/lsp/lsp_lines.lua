local lsp_lines = require("lsp_lines")

local M = {}

function M.toggle()
    vim.diagnostic.config {
        virtual_text = not lsp_lines.toggle(),
    }
end

M.toggle()
lsp_lines.setup()

return M
