return {
    "kevinhwang91/nvim-ufo",
    event = "VeryLazy",
    dependencies = "kevinhwang91/promise-async",
    config = function()
        vim.o.foldcolumn = "1" -- '0' is not bad
        vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        local ufo = require("ufo")
        ufo.setup {
            provider_selector = function(bufnr, filetype, buftype)
                return { "lsp", "indent" }
            end,
        }

        MsConfig.keys.normal("zR", ufo.openAllFolds, "Open all folds")
        MsConfig.keys.normal("zM", ufo.closeAllFolds, "Close all folds")
        MsConfig.keys.normal("zK", function()
            local winid = require("ufo").peekFoldedLinesUnderCursor()
            if not winid then
                vim.lsp.buf.hover()
            end
        end, "Peek folded lines")
    end,
}
