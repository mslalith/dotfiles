-- Better window navigation
ms.keys.normal_mode("<C-h>", "<C-w>h", "Move left")
ms.keys.normal_mode("<C-j>", "<C-w>j", "Move down")
ms.keys.normal_mode("<C-k>", "<C-w>k", "Move up")
ms.keys.normal_mode("<C-l>", "<C-w>l", "Move right")

ms.keys.normal_mode("<F5>", ":so %<CR>", "Source file")
ms.keys.normal_mode("<C-a>", "ggVG", "Select all")
ms.keys.normal_mode("<leader><leader>q", ":q<CR>", "Quit")
ms.keys.normal_mode("<leader>s", ":w<CR>", "Save")
ms.keys.insert_mode("<C-s>", "<Esc>:w<CR>a", "Save")
ms.keys.normal_mode("dh", "d^", "Delete till end")
ms.keys.normal_mode("dl", "d$", "Delete till start")
ms.keys.normal_mode("n", "*", "Highlight search")

ms.keys.normal_mode("<ESC>", ":nohlsearch<CR>", "Clear highlight")

-- Resize with arrows
ms.keys.normal_mode("<A-Up>", ":resize +2<CR>", "Resize up")
ms.keys.normal_mode("<A-Down>", ":resize -2<CR>", "Resize down")
ms.keys.normal_mode("<A-Left>", ":vertical resize +2<CR>", "Resize left")
ms.keys.normal_mode("<A-Right>", ":vertical resize -2<CR>", "Resize right")

ms.keys.normal_mode("<leader>l", "<cmd>lua require('plugins.lsp_lines').toggle()<cr>", "Toggle virtual diagnostics")
ms.keys.normal_mode("<A-j>", "30j", "Scroll down")
ms.keys.normal_mode("<A-k>", "30k", "Scroll up")

-- Telescope
ms.keys.normal_mode("<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Search file")

-- Stay in indent mode
ms.keys.normal_mode("<Tab>", "v>gv<Esc>", "Indent right")
ms.keys.normal_mode("<S-Tab>", "v<gv<Esc>", "Indent left")
ms.keys.insert_mode("<S-Tab>", "<C-D>", "Indent left")
ms.keys.visual_mode("<Tab>", ">gv", "Indent right")
ms.keys.visual_mode("<S-Tab>", "<gv", "Indent left")

-- Move text up and down
ms.keys.visual_mode("<A-S-j>", ":move '>+1<CR>gv-gv", "Move selection down")
ms.keys.visual_mode("<A-S-k>", ":move '<-2<CR>gv-gv", "Move selection up")
ms.keys.visual_mode("p", '"_dP', "Paste")

-- Move text up and down
ms.keys.visual_block_mode("J", ":move '>+1<CR>gv-gv", "Move selection down")
ms.keys.visual_block_mode("K", ":move '<-2<CR>gv-gv", "Move selection up")
ms.keys.visual_block_mode("<A-j>", ":move '>+1<CR>gv-gv", "Move selection down")
ms.keys.visual_block_mode("<A-k>", ":move '<-2<CR>gv-gv", "Move selection up")

-- Better terminal navigation
local term_opts = { silent = true }
ms.keys.terminal_mode("<C-h>", "<C-\\><C-N><C-w>h", "Move left", term_opts)
ms.keys.terminal_mode("<C-j>", "<C-\\><C-N><C-w>j", "Move down", term_opts)
ms.keys.terminal_mode("<C-k>", "<C-\\><C-N><C-w>k", "Move up", term_opts)
ms.keys.terminal_mode("<C-l>", "<C-\\><C-N><C-w>l", "Move right", term_opts)
