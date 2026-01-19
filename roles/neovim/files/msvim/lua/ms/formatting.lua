local M = {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = "ConformInfo",
}

--- @param message string
local function show_notification(message)
    vim.notify(message, "info", { title = "conform.nvim" })
end

--- @param is_global boolean
--- @param silent boolean
function M.enable_autoformat(is_global, silent)
    silent = silent or false
    if is_global then
        vim.g.disable_autoformat = false
        if not silent then
            show_notification("Auto Format on save enabled globally")
        end
    else
        vim.b.disable_autoformat = false
        if not silent then
            show_notification("Auto Format on save enabled for this buffer")
        end
    end
end

--- @param is_global boolean
--- @param silent boolean
function M.disable_autoformat(is_global, silent)
    silent = silent or false
    if is_global then
        vim.g.disable_autoformat = true
        if not silent then
            show_notification("Auto Format on save disabled globally")
        end
    else
        vim.b.disable_autoformat = true
        if not silent then
            show_notification("Auto Format on save disabled for this buffer")
        end
    end
end

function M.config()
    local conform = require("conform")
    local enable_autoformat_fts = { "lua" }

    conform.setup {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            rust = { "rustfmt", lsp_format = "fallback" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
        },
        format_on_save = function(bufnr)
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            return { timeout_ms = 500, lsp_format = "fallback" }
        end,
    }

    vim.api.nvim_create_user_command("Format", function()
        conform.format {
            async = true,
            lsp_format = "fallback",
        }
    end, { desc = "Format file or range" })

    MsConfig.keys.normal("<leader>ll", "<cmd>:Format<CR>", "Format file or range")

    vim.api.nvim_create_user_command("ToggleAutoFormatOnSave", function(args)
        local is_global = not args.bang
        local is_disabled
        if is_global then
            is_disabled = vim.g.disable_autoformat
        else
            is_disabled = vim.b.disable_autoformat
        end

        if is_disabled then
            M.enable_autoformat(is_global, false)
        else
            M.disable_autoformat(is_global, false)
        end
    end, {
        desc = "Toggle auto format on save",
        bang = true,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(opts)
            local ft = vim.bo[opts.buf].filetype
            if vim.tbl_contains(enable_autoformat_fts, ft) then
                M.enable_autoformat(true, true)
            else
                M.disable_autoformat(true, true)
            end
        end,
    })
end

return M
