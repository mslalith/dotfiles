local M = {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    cond = MsVim.is_git_repo,
}

function M.config()
    local icons = MsVim.icons.git

    require("gitsigns").setup {
        on_attach = function(bufnr)
            local gitsigns = require("gitsigns")

            local function nmap(l, r, desc)
                MsVim.keys.normal_mode(l, r, desc, { buffer = bufnr })
            end

            local function vmap(l, r, desc)
                MsVim.keys.visual_mode(l, r, desc, { buffer = bufnr })
            end

            --------------------------------------
            -- Navigation
            --------------------------------------
            nmap("<leader>hj", function()
                if vim.wo.diff then
                    vim.cmd.normal { "]c", bang = true }
                else
                    gitsigns.nav_hunk("next")
                end
            end, "Next Hunk")

            nmap("<leader>hk", function()
                if vim.wo.diff then
                    vim.cmd.normal { "[c", bang = true }
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

            nmap("<leader>hB", function()
                gitsigns.blame()
            end, "Blame File")

            nmap("<leader>hd", function()
                gitsigns.diffthis("~")
            end, "Diff")
        end,

        signs = {
            add = { text = icons.LineAdded },
            change = { text = icons.LineChanged },
            delete = { text = icons.LineDeleted },
            topdelete = { text = icons.LineDeleted },
            changedelete = { text = icons.LineDeleted },
            untracked = { text = icons.LineChanged },
        },
        signs_staged = {
            add = { text = icons.LineAdded },
            change = { text = icons.LineChanged },
            delete = { text = icons.LineDeleted },
            topdelete = { text = icons.LineDeleted },
            changedelete = { text = icons.LineDeleted },
        },
        attach_to_untracked = true,
        preview_config = {
            border = "rounded",
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 1,
        },
    }
end

return M
