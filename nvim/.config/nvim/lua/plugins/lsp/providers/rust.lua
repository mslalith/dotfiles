return {
    tools = {
        -- autoSetHints = false,
        on_initialized = function()
            vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
                pattern = { "*.rs" },
                callback = function()
                    vim.lsp.codelens.refresh()
                end,
            })
        end,

        auto = false,
        inlay_hints = {
            only_current_line = true,
            auto = true,

            -- Event which triggers a refersh of the inlay hints.
            -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
            -- not that this may cause higher CPU usage.
            -- This option is only respected when only_current_line and
            -- autoSetHints both are true.
            only_current_line_autocmd = "CursorHold",
        },
    },
    server = {
        standalone = false,
        settings = {
            ["rust-analyzer"] = {
                lens = {
                    enable = true,
                },
            },
        },
    },
}
