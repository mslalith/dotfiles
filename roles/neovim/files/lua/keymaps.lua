-- Better window navigation
ms.keys.normal_mode("<C-h>", "<C-w>h")
ms.keys.normal_mode("<C-j>", "<C-w>j")
ms.keys.normal_mode("<C-k>", "<C-w>k")
ms.keys.normal_mode("<C-l>", "<C-w>l")

ms.keys.normal_mode("<F5>", ":so %<CR>")
ms.keys.normal_mode("<C-a>", "ggVG")
ms.keys.normal_mode("<leader><leader>q", ":q<CR>")
ms.keys.normal_mode("<leader>s", ":w<CR>")
ms.keys.insert_mode("<C-s>", "<Esc>:w<CR>a")
ms.keys.normal_mode("dh", "d^")
ms.keys.normal_mode("dl", "d$")

ms.keys.normal_mode("<ESC>", ":nohlsearch<CR>")
-- ms.keys.normal_mode("<leader>fm", ":NvimTreeToggle<CR>")

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
ms.keys.normal_mode("<leader>i", ":TroubleToggle workspace_diagnostics<CR>")

ms.keys.normal_mode("<leader>l", "<cmd>lua require('plugins.lsp_lines').toggle()<cr>")
ms.keys.normal_mode("<A-b>", ":MarksListAll<CR>")
ms.keys.normal_mode("<A-j>", "30j")
ms.keys.normal_mode("<A-k>", "30k")

-- Snacks
ms.keys.normal_mode("<leader>un", "<cmd>lua require('snacks').notifier.hide()<cr>")
ms.keys.normal_mode("<leader>sh", "<cmd>lua require('snacks').notifier.show_history()<cr>")
ms.keys.normal_mode("<leader>g", "<cmd>lua require('snacks').lazygit()<cr>")
ms.keys.normal_mode("<leader>sde", "<cmd>lua require('snacks').dim.enable()<cr>")
ms.keys.normal_mode("<leader>sdd", "<cmd>lua require('snacks').dim.disable()<cr>")
ms.keys.normal_mode("<leader>sie", "<cmd>lua require('snacks').indent.enable()<cr>")
ms.keys.normal_mode("<leader>sid", "<cmd>lua require('snacks').indent.disable()<cr>")
ms.keys.normal_mode("<leader>fm", "<cmd>lua require('snacks').picker.explorer()<cr>")
ms.keys.normal_mode("<A-S-o>", "<cmd>lua require('snacks').picker.files()<CR>")
ms.keys.normal_mode("<A-S-f>", "<cmd>lua require('snacks').picker.grep()<CR>")
ms.keys.normal_mode("<C-e>", "<cmd>lua require('snacks').picker.buffers()<CR>")

-- Telescope
ms.keys.normal_mode("<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
-- ms.keys.normal_mode("<A-m>", "<cmd>Telescope aerial<CR>")

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
