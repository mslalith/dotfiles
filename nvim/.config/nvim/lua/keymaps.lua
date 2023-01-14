-- Better window navigation
ms.keys.normal_mode("<C-h>", "<C-w>h")
ms.keys.normal_mode("<C-j>", "<C-w>j")
ms.keys.normal_mode("<C-k>", "<C-w>k")
ms.keys.normal_mode("<C-l>", "<C-w>l")

ms.keys.normal_mode("<F5>", ":so %<CR>")
ms.keys.normal_mode("<C-a>", "ggVG")
ms.keys.normal_mode("<leader><leader>q", ":q<CR>")
ms.keys.normal_mode("<C-s>", ":w<CR>")
ms.keys.insert_mode("<C-s>", "<Esc>:w<CR>a")
ms.keys.normal_mode("dh", "d^")
ms.keys.normal_mode("dl", "d$")

ms.keys.normal_mode("<ESC>", ":nohlsearch<CR>")
ms.keys.normal_mode("<leader>l", ":Lazy<CR>")
ms.keys.normal_mode("<leader>e", ":NvimTreeToggle<CR>")

-- Resize with arrows
ms.keys.normal_mode("<A-Up>", ":resize +2<CR>")
ms.keys.normal_mode("<A-Down>", ":resize -2<CR>")
ms.keys.normal_mode("<A-Left>", ":vertical resize +2<CR>")
ms.keys.normal_mode("<A-Right>", ":vertical resize -2<CR>")

-- Buffers
ms.keys.normal_mode("<S-l>", ":BufferLineCycleNext<CR>")
ms.keys.normal_mode("<S-h>", ":BufferLineCyclePrev<CR>")
ms.keys.normal_mode("<leader>w", ":bdelete<CR>")
ms.keys.normal_mode("<leader>bh", ":BufferLineMovePrev<CR>")
ms.keys.normal_mode("<leader>bl", ":BufferLineMoveNext<CR>")

-- Navigate in Editor
ms.keys.normal_mode("<leader>/", ":HopWordMW<CR>")
ms.keys.normal_mode("<leader>i", ":TroubleToggle workspace_diagnostics<CR>")

-- Telescope
ms.keys.normal_mode("<A-S-o>", "<cmd>Telescope find_files<CR>")
ms.keys.normal_mode("<A-S-f>", "<cmd>Telescope live_grep<CR>")
ms.keys.normal_mode("<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
ms.keys.normal_mode("<A-m>", "<cmd>Telescope aerial<CR>")
-- ms.keys.normal_mode("gd", "<cmd>Telescope lsp_definitions<CR>")
ms.keys.normal_mode("<A-v>", ":Telescope neoclip plus<CR>")
ms.keys.normal_mode("<C-e>", ":Telescope oldfiles<CR>")

ms.keys.normal_mode("<A-l>", "<cmd>lua require('plugins.lsp_lines').toggle()<cr>")
ms.keys.normal_mode("<A-b>", ":MarksListAll<CR>")

-- Stay in indent mode
ms.keys.normal_mode("<Tab>", "v>gv<Esc>")
ms.keys.normal_mode("<S-Tab>", "v<gv<Esc>")
ms.keys.insert_mode("<S-Tab>", "<C-D>")
ms.keys.visual_mode("<Tab>", ">gv")
ms.keys.visual_mode("<S-Tab>", "<gv")

-- Move text up and down
ms.keys.visual_mode("<A-S-j>", ":move '>+1<CR>gv-gv")
ms.keys.visual_mode("<A-S-k>", ":move '<-2<CR>gv-gv")
ms.keys.visual_mode("p", '"_dP')

-- Move text up and down
ms.keys.visual_block_mode("J", ":move '>+1<CR>gv-gv")
ms.keys.visual_block_mode("K", ":move '<-2<CR>gv-gv")
ms.keys.visual_block_mode("<A-j>", ":move '>+1<CR>gv-gv")
ms.keys.visual_block_mode("<A-k>", ":move '<-2<CR>gv-gv")

-- Better terminal navigation
local term_opts = { silent = true }
ms.keys.terminal_mode("<C-h>", "<C-\\><C-N><C-w>h", term_opts)
ms.keys.terminal_mode("<C-j>", "<C-\\><C-N><C-w>j", term_opts)
ms.keys.terminal_mode("<C-k>", "<C-\\><C-N><C-w>k", term_opts)
ms.keys.terminal_mode("<C-l>", "<C-\\><C-N><C-w>l", term_opts)
