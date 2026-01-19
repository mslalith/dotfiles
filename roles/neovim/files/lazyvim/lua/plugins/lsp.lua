return {
  "neovim/nvim-lspconfig",
  keys = {
    { "<A-Enter>", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },
    -- {
    --   "ff",
    --   function()
    --     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<leader>cr", true, true, true), "n", true)
    --   end,
    --   desc = "Rename",
    -- },
  },
}
