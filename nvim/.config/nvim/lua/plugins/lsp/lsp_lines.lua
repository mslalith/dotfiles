local lsp_lines = require("lsp_lines")

local M = {}

function M.toggle()
    vim.diagnostic.config {
        virtual_text = not lsp_lines.toggle(),
    }
end

lsp_lines.setup()
M.toggle()

return M
