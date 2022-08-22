local lsp_lines = require("lsp_lines")

local M = {}

local function enable()
    -- disable virtual_text if lsp_lines is enabled
    lsp_lines.toggle()
    vim.diagnostic.config {
        virtual_text = false,
    }
end

local function disable()
    -- enable virtual_text if lsp_lines is disabled
    lsp_lines.toggle()
    vim.diagnostic.config {
        virtual_text = true,
    }
end

function M.toggle()
    -- lsp_lines doesn't have any API to derive if it's enabled or not
    -- we depened on virtual_text
    local is_enabled = not vim.diagnostic.config().virtual_text
    if is_enabled then
        disable()
    else
        enable()
    end
end

-- enable lsp_lines to being with
enable()
lsp_lines.setup()

return M
