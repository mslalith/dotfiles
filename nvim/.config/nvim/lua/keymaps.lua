local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set
keymap("", "<Space>", "<Nop>", opts)

-- Modes
--   normal_mode = "n",
-- local keymap = vim.api.nvim_set_keymap
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<F5>", ":so %<CR>", opts)
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<leader>`", ":nohlsearch<CR>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize -2<CR>", opts)

-- Buffers
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<leader>w", ":Bdelete!<CR>", opts)
keymap("n", "<leader>bh", ":BufferLineMovePrev<CR>", opts)
keymap("n", "<leader>bl", ":BufferLineMoveNext<CR>", opts)

-- Navigate in Editor
keymap("n", "<leader>/", ":HopWordMW<CR>", opts)
keymap("n", "<leader>i", ":TroubleToggle workspace_diagnostics<CR>", opts)

-- Diffview
keymap("n", "<leader>d", ":DiffviewToggle<CR>", opts) -- this is a custom command

-- Telescope
keymap("n", "<A-S-o>", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader><leader>b", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader><leader>s", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<A-S-f>", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader><leader>h", "<cmd>Telescope help_tags<CR>", opts)
keymap("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<A-m>", "<cmd>Telescope aerial<CR>", opts)
keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
keymap("n", "<A-v>", ":Telescope neoclip plus<CR>", opts)

-- Press jk fast to enter Normal mode
keymap("i", "jk", "<ESC>", opts)

-- Stay in indent mode
keymap("n", "<Tab>", "v>gv<Esc>", opts)
keymap("n", "<S-Tab>", "v<gv<Esc>", opts)
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Custom Commands
vim.api.nvim_create_user_command("DiffviewToggle", function(e)
    local view = require("diffview.lib").get_current_view()

    if view then
        vim.cmd("DiffviewClose")
    else
        vim.cmd("DiffviewOpen " .. e.args)
    end
end, { nargs = "*" })
