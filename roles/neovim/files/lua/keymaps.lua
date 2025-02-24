-- Unbind keymaps
MsConfig.keys.unbind_normal("s")

-- Better window navigation
MsConfig.keys.normal("<C-h>", "<C-w>h", "Move left")
MsConfig.keys.normal("<C-j>", "<C-w>j", "Move down")
MsConfig.keys.normal("<C-k>", "<C-w>k", "Move up")
MsConfig.keys.normal("<C-l>", "<C-w>l", "Move right")

MsConfig.keys.normal("<F5>", ":so %<CR>", "Source file")
MsConfig.keys.normal("<C-a>", "ggVG", "Select all")
MsConfig.keys.normal("<leader><leader>q", ":q<CR>", "Quit")
MsConfig.keys.normal("<leader><leader>s", ":w<CR>", "Save")
MsConfig.keys.insert("<C-s>", "<Esc>:w<CR>a", "Save")
MsConfig.keys.normal("dh", "d^", "Delete till end")
MsConfig.keys.normal("dl", "d$", "Delete till start")
MsConfig.keys.normal("n", "*", "Highlight search")

MsConfig.keys.normal("<ESC>", ":nohlsearch<CR>", "Clear highlight")

-- Resize with arrows
MsConfig.keys.normal("<A-Up>", ":resize +2<CR>", "Resize up")
MsConfig.keys.normal("<A-Down>", ":resize -2<CR>", "Resize down")
MsConfig.keys.normal("<A-Left>", ":vertical resize +2<CR>", "Resize left")
MsConfig.keys.normal("<A-Right>", ":vertical resize -2<CR>", "Resize right")

MsConfig.keys.normal("<A-j>", "<C-d>zz", "Scroll down")
MsConfig.keys.normal("<A-k>", "<C-u>zz", "Scroll up")
MsConfig.keys.visual_block("<A-j>", "<C-d>zz", "Scroll down")
MsConfig.keys.visual_block("<A-k>", "<C-u>zz", "Scroll up")

MsConfig.keys.normal("<leader>dj", function()
    vim.diagnostic.goto_next { float = false }
end, "Goto next diagnostic")
MsConfig.keys.normal("<leader>dk", function()
    vim.diagnostic.goto_prev { float = false }
end, "Goto previous diagnostic")

-- Telescope
MsConfig.keys.normal("<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Search file")

-- Stay in indent mode
MsConfig.keys.normal("<Tab>", "v>gv<Esc>", "Indent right")
MsConfig.keys.normal("<S-Tab>", "v<gv<Esc>", "Indent left")
MsConfig.keys.insert("<S-Tab>", "<C-D>", "Indent left")
MsConfig.keys.visual("<Tab>", ">gv", "Indent right")
MsConfig.keys.visual("<S-Tab>", "<gv", "Indent left")

-- Move text up and down
MsConfig.keys.visual("<A-S-j>", ":move '>+1<CR>gv-gv", "Move selection down")
MsConfig.keys.visual("<A-S-k>", ":move '<-2<CR>gv-gv", "Move selection up")
MsConfig.keys.visual("p", '"_dP', "Paste")

-- Move text up and down
MsConfig.keys.visual_block("<A-S-j>", ":move '>+1<CR>gv-gv", "Move selection down")
MsConfig.keys.visual_block("<A-S-k>", ":move '<-2<CR>gv-gv", "Move selection up")

-- Better terminal navigation
local term_opts = { silent = true }
MsConfig.keys.terminal("<C-h>", "<C-\\><C-N><C-w>h", "Move left", term_opts)
MsConfig.keys.terminal("<C-j>", "<C-\\><C-N><C-w>j", "Move down", term_opts)
MsConfig.keys.terminal("<C-k>", "<C-\\><C-N><C-w>k", "Move up", term_opts)
MsConfig.keys.terminal("<C-l>", "<C-\\><C-N><C-w>l", "Move right", term_opts)
