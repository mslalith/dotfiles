return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            lua = { "luacheck" },
        }

        local args = {
            "--globals",
            "vim",
            "MsVim",
        }
        for _, v in ipairs(lint.linters.luacheck.args) do
            table.insert(args, v)
        end
        lint.linters.luacheck.args = args

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        MsVim.keys.normal_mode("<leader>cl", function()
            lint.try_lint()
        end, "Trigger lint")
    end,
}
