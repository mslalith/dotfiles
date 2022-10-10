-- Better window navigation
ms_config.keys.normal_mode("<C-h>", "<C-w>h")
ms_config.keys.normal_mode("<C-j>", "<C-w>j")
ms_config.keys.normal_mode("<C-k>", "<C-w>k")
ms_config.keys.normal_mode("<C-l>", "<C-w>l")

ms_config.keys.normal_mode("<F5>", ":so %<CR>")
ms_config.keys.normal_mode("<C-a>", "ggVG")
ms_config.keys.normal_mode("<C-s>", ":w<CR>")
ms_config.keys.insert_mode("<C-s>", "<Esc>:w<CR>a")
ms_config.keys.normal_mode("dh", "d^")
ms_config.keys.normal_mode("dl", "d$")

ms_config.keys.normal_mode("<leader>`", ":nohlsearch<CR>")
ms_config.keys.normal_mode("<leader>e", ":NvimTreeToggle<CR>")

-- Resize with arrows
ms_config.keys.normal_mode("<A-Up>", ":resize +2<CR>")
ms_config.keys.normal_mode("<A-Down>", ":resize -2<CR>")
ms_config.keys.normal_mode("<A-Left>", ":vertical resize +2<CR>")
ms_config.keys.normal_mode("<A-Right>", ":vertical resize -2<CR>")

-- Buffers
ms_config.keys.normal_mode("<S-l>", ":BufferLineCycleNext<CR>")
ms_config.keys.normal_mode("<S-h>", ":BufferLineCyclePrev<CR>")
ms_config.keys.normal_mode("<leader>w", ":bdelete<CR>")
ms_config.keys.normal_mode("<leader>bh", ":BufferLineMovePrev<CR>")
ms_config.keys.normal_mode("<leader>bl", ":BufferLineMoveNext<CR>")

-- Navigate in Editor
ms_config.keys.normal_mode("<leader>/", ":HopWordMW<CR>")
ms_config.keys.normal_mode("<leader>i", ":TroubleToggle workspace_diagnostics<CR>")

-- Diffview
ms_config.keys.normal_mode("<leader>d", ":DiffviewToggle<CR>") -- this is a custom command

-- Telescope
ms_config.keys.normal_mode("<A-S-o>", "<cmd>Telescope find_files<CR>")
ms_config.keys.normal_mode("<A-S-f>", "<cmd>Telescope live_grep<CR>")
ms_config.keys.normal_mode("<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
ms_config.keys.normal_mode("<A-m>", "<cmd>Telescope aerial<CR>")
ms_config.keys.normal_mode("gd", "<cmd>Telescope lsp_definitions<CR>")
ms_config.keys.normal_mode("<A-v>", ":Telescope neoclip plus<CR>")
ms_config.keys.normal_mode("<C-e>", ":Telescope oldfiles<CR>")

ms_config.keys.normal_mode("<A-l>", "<cmd>lua require('plugins.lsp.lsp_lines').toggle()<cr>")
ms_config.keys.normal_mode("<A-b>", ":MarksListAll<CR>")

-- Stay in indent mode
ms_config.keys.normal_mode("<Tab>", "v>gv<Esc>")
ms_config.keys.normal_mode("<S-Tab>", "v<gv<Esc>")
ms_config.keys.insert_mode("<S-Tab>", "<C-D>")
ms_config.keys.visual_mode("<Tab>", ">gv")
ms_config.keys.visual_mode("<S-Tab>", "<gv")

-- Move text up and down
ms_config.keys.visual_mode("<A-S-j>", ":move '>+1<CR>gv-gv")
ms_config.keys.visual_mode("<A-S-k>", ":move '<-2<CR>gv-gv")
ms_config.keys.visual_mode("p", '"_dP')

-- Move text up and down
ms_config.keys.visual_block_mode("J", ":move '>+1<CR>gv-gv")
ms_config.keys.visual_block_mode("K", ":move '<-2<CR>gv-gv")
ms_config.keys.visual_block_mode("<A-j>", ":move '>+1<CR>gv-gv")
ms_config.keys.visual_block_mode("<A-k>", ":move '<-2<CR>gv-gv")

-- Better terminal navigation
local term_opts = { silent = true }
ms_config.keys.terminal_mode("<C-h>", "<C-\\><C-N><C-w>h", term_opts)
ms_config.keys.terminal_mode("<C-j>", "<C-\\><C-N><C-w>j", term_opts)
ms_config.keys.terminal_mode("<C-k>", "<C-\\><C-N><C-w>k", term_opts)
ms_config.keys.terminal_mode("<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Custom Commands
vim.api.nvim_create_user_command("DiffviewToggle", function(e)
    local view = require("diffview.lib").get_current_view()

    if view then
        vim.cmd("DiffviewClose")
    else
        vim.cmd("DiffviewOpen " .. e.args)
    end
end, { nargs = "*" })
