local M = {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    cond = ms.is_git_repo,
}

function M.config()
    require("gitsigns").setup {
        on_attach = function(bufnr)
            local gitsigns = require("gitsigns")

            local function nmap(l, r, desc)
                ms.keys.normal_mode(l, r, desc, { buffer = bufnr })
            end

            local function vmap(l, r, desc)
                ms.keys.visual_mode(l, r, desc, { buffer = bufnr })
            end

            --------------------------------------
            -- Navigation
            --------------------------------------
            nmap("hj", function()
                if vim.wo.diff then
                    vim.cmd.normal { "hj", bang = true }
                else
                    gitsigns.nav_hunk("next")
                end
            end, "Next Hunk")

            nmap("hk", function()
                if vim.wo.diff then
                    vim.cmd.normal { "hk", bang = true }
                else
                    gitsigns.nav_hunk("prev")
                end
            end, "Previous Hunk")

            --------------------------------------
            -- Actions
            --------------------------------------
            nmap("<leader>hs", gitsigns.stage_hunk, "Stage Hunk")
            nmap("<leader>hr", gitsigns.reset_hunk, "Reset Hunk")

            vmap("<leader>hs", function()
                gitsigns.stage_hunk { vim.fn.line("."), vim.fn.line("v") }
            end, "Stage Hunk")

            vmap("<leader>hr", function()
                gitsigns.reset_hunk { vim.fn.line("."), vim.fn.line("v") }
            end, "Reset Hunk")

            nmap("<leader>hS", gitsigns.stage_buffer, "Stage Buffer")
            nmap("<leader>hR", gitsigns.reset_buffer, "Reset Buffer")
            nmap("<leader>hp", gitsigns.preview_hunk, "Preview Hunk")
            nmap("<leader>hi", gitsigns.preview_hunk_inline, "Preview Hunk (inline)")

            nmap("<leader>hb", function()
                gitsigns.blame_line { full = true }
            end, "Blame Line")

            nmap("<leader>hd", function()
                gitsigns.diffthis("~")
            end, "Diff")
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
