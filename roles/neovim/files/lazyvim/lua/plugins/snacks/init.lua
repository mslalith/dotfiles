local layouts = require("plugins.snacks.layouts")

return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      sources = {
        explorer = {
          auto_close = true,
        },
        buffers = {
          layout = layouts.vscode_bordered,
        },
        recent = {
          layout = layouts.vscode_bordered,
        },
        diagnostics = {
          layout = layouts.vertical,
        },
        diagnostics_buffer = {
          layout = layouts.vertical,
        },
        lsp_references = {
          layout = layouts.vertical,
        },
        command_history = {
          layout = layouts.vscode_bordered,
        },
        lines = {
          layout = vim.tbl_deep_extend("force", layouts.vscode_bordered, { preview = "main" }),
        },
      },
      formatters = {
        file = {
          filename_first = true,
        },
      },
    },
    styles = {
      ---@diagnostic disable-next-line: missing-fields
      lazygit = {
        width = 0,
        height = 0,
      },
    },
  },
  keys = {
    {
      "<leader><leader>",
      function()
        Snacks.picker.smart({
          multi = { "buffers", "files" },
          layout = layouts.vscode_bordered,
        })
      end,
      desc = "Find Files (smart)",
    },
  },
}
