-- Better window navigation
MsVim.keys.normal_mode("<C-h>", "<C-w>h", "Move left")
MsVim.keys.normal_mode("<C-j>", "<C-w>j", "Move down")
MsVim.keys.normal_mode("<C-k>", "<C-w>k", "Move up")
MsVim.keys.normal_mode("<C-l>", "<C-w>l", "Move right")

MsVim.keys.normal_mode("<F5>", ":so %<CR>", "Source file")
MsVim.keys.normal_mode("<C-a>", "ggVG", "Select all")
MsVim.keys.normal_mode("<leader><leader>q", ":q<CR>", "Quit")
MsVim.keys.normal_mode("<leader>s", ":w<CR>", "Save")
MsVim.keys.insert_mode("<C-s>", "<Esc>:w<CR>a", "Save")
MsVim.keys.normal_mode("dh", "d^", "Delete till end")
MsVim.keys.normal_mode("dl", "d$", "Delete till start")
MsVim.keys.normal_mode("n", "*", "Highlight search")

MsVim.keys.normal_mode("<ESC>", ":nohlsearch<CR>", "Clear highlight")

-- Resize with arrows
MsVim.keys.normal_mode("<A-Up>", ":resize +2<CR>", "Resize up")
MsVim.keys.normal_mode("<A-Down>", ":resize -2<CR>", "Resize down")
MsVim.keys.normal_mode("<A-Left>", ":vertical resize +2<CR>", "Resize left")
MsVim.keys.normal_mode("<A-Right>", ":vertical resize -2<CR>", "Resize right")

MsVim.keys.normal_mode("<A-j>", "30j", "Scroll down")
MsVim.keys.normal_mode("<A-k>", "30k", "Scroll up")
MsVim.keys.visual_block_mode("<A-j>", "30j", "Scroll down")
MsVim.keys.visual_block_mode("<A-k>", "30k", "Scroll up")

MsVim.keys.normal_mode("<leader>dj", function()
    vim.diagnostic.goto_next { float = false }
end, "Goto next diagnostic")
MsVim.keys.normal_mode("<leader>dk", function()
    vim.diagnostic.goto_prev { float = false }
end, "Goto previous diagnostic")

-- Telescope
MsVim.keys.normal_mode("<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Search file")

-- Stay in indent mode
MsVim.keys.normal_mode("<Tab>", "v>gv<Esc>", "Indent right")
MsVim.keys.normal_mode("<S-Tab>", "v<gv<Esc>", "Indent left")
MsVim.keys.insert_mode("<S-Tab>", "<C-D>", "Indent left")
MsVim.keys.visual_mode("<Tab>", ">gv", "Indent right")
MsVim.keys.visual_mode("<S-Tab>", "<gv", "Indent left")

-- Move text up and down
MsVim.keys.visual_mode("<A-S-j>", ":move '>+1<CR>gv-gv", "Move selection down")
MsVim.keys.visual_mode("<A-S-k>", ":move '<-2<CR>gv-gv", "Move selection up")
MsVim.keys.visual_mode("p", '"_dP', "Paste")

-- Move text up and down
MsVim.keys.visual_block_mode("<A-S-j>", ":move '>+1<CR>gv-gv", "Move selection down")
MsVim.keys.visual_block_mode("<A-S-k>", ":move '<-2<CR>gv-gv", "Move selection up")

-- Better terminal navigation
local term_opts = { silent = true }
MsVim.keys.terminal_mode("<C-h>", "<C-\\><C-N><C-w>h", "Move left", term_opts)
MsVim.keys.terminal_mode("<C-j>", "<C-\\><C-N><C-w>j", "Move down", term_opts)
MsVim.keys.terminal_mode("<C-k>", "<C-\\><C-N><C-w>k", "Move up", term_opts)
MsVim.keys.terminal_mode("<C-l>", "<C-\\><C-N><C-w>l", "Move right", term_opts)
