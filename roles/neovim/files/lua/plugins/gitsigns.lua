local M = {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    cond = ms.is_git_repo,
}

function M.config()
    require("gitsigns").setup {
        on_attach = function(bufnr)
            local gitsigns = require("gitsigns")

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            --------------------------------------
            -- Navigation
            --------------------------------------
            map("n", "hj", function()
                if vim.wo.diff then
                    vim.cmd.normal { "hj", bang = true }
                else
                    gitsigns.nav_hunk("next")
                end
            end, { desc = "Next Hunk" })

            map("n", "hk", function()
                if vim.wo.diff then
                    vim.cmd.normal { "hk", bang = true }
                else
                    gitsigns.nav_hunk("prev")
                end
            end, { desc = "Previous Hunk" })

            --------------------------------------
            -- Actions
            --------------------------------------
            map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
            map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset Hunk" })

            map("v", "<leader>hs", function()
                gitsigns.stage_hunk { vim.fn.line("."), vim.fn.line("v") }
            end, { desc = "Stage Hunk" })

            map("v", "<leader>hr", function()
                gitsigns.reset_hunk { vim.fn.line("."), vim.fn.line("v") }
            end, { desc = "Reset Hunk" })

            map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage Buffer" })
            map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset Buffer" })
            map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
            map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview Hunk (inline)" })

            map("n", "<leader>hb", function()
                gitsigns.blame_line { full = true }
            end, { desc = "Blame Line" })

            map("n", "<leader>hd", function()
                gitsigns.diffthis("~")
            end, { desc = "Diff" })
        end,

        signs = {
            add = { text = "│" },
            change = { text = "│" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
            interval = 1000,
            follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
        },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        preview_config = {
            -- Options passed to nvim_open_win
            border = "single",
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 1,
        },
    }
end

return M
