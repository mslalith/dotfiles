local layouts = require("plugins.snacks.layouts")

local M = {
  "akinsho/flutter-tools.nvim",
  -- lazy = false,
  ft = "dart",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = true,
}

M.keys = {
  {
    "<leader>p",
    function()
      M.flutter_commands_picker()
    end,
    desc = "Flutter Commands",
  },
}

local dartExcludedFolders = {
  vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
  vim.fn.expand("$HOME/.pub-cache"),
  vim.fn.expand("/opt/homebrew/"),
  vim.fn.expand("$HOME/tools/flutter/"),
}

function M.config()
  require("flutter-tools").setup({
    cmd = { "dart", "language-server", "--protocol=lsp" },
    widget_guides = { enabled = true },
    -- dev_log = {
    --     enabled = true,
    --     open_cmd = "tabedit",
    -- },
    lsp = {
      settings = {
        analysisExcludedFolders = dartExcludedFolders,
        updateImportsOnRename = true,
      },
      capabilities = function(config)
        config.textDocument.codeAction = {
          codeActionLiteralSupport = {
            codeActionKind = {
              valueSet = {
                "",
                "quickfix",
                "refactor",
                "refactor.extract",
                "refactor.inline",
                "refactor.rewrite",
                -- "source",
                -- "source.organizeImports",
                -- "source.fixAll",
              },
            },
          },
        }

        return config
      end,
    },
  })
end

function M.flutter_commands_picker()
  local commands = {
    {
      text = "Run (dev)",
      execute = function()
        vim.cmd("FlutterRun --dart-define=environment=dev --flavor dev --web-browser-flag=--disable-web-security")
      end,
    },
    {
      text = "Run",
      execute = function()
        vim.cmd("FlutterRun")
      end,
    },
    {
      text = "Run (with args)",
      execute = function()
        vim.fn.feedkeys(":FlutterRun")
      end,
    },
    {
      text = "Reload",
      execute = function()
        vim.cmd(":FlutterReload")
      end,
    },
    {
      text = "Restart",
      execute = function()
        vim.cmd(":FlutterRestart")
      end,
    },
    {
      text = "Pub Get",
      execute = function()
        vim.cmd(":FlutterPubGet")
      end,
    },
    {
      text = "Pub Upgrade",
      execute = function()
        vim.cmd(":FlutterPubUpgrade")
      end,
    },
    {
      text = "Toggle Log",
      execute = function()
        vim.cmd("FlutterLogToggle")
      end,
    },
    {
      text = "Clear Log",
      execute = function()
        vim.cmd("FlutterLogClear")
      end,
    },
    {
      text = "Quit",
      execute = function()
        vim.cmd("FlutterQuit")
      end,
    },
  }

  local items = {}
  for i, v in ipairs(commands) do
    table.insert(
      items,
      vim.tbl_deep_extend("force", v, {
        idx = i,
        text = "Flutter Tools: " .. v.text,
      })
    )
  end

  Snacks.picker({
    title = "Flutter Commands",
    items = items,
    format = "text",
    layout = layouts.vscode_bordered,
    confirm = function(picker, item)
      items[item.idx].execute()
      picker:close()
    end,
  })
end

return M
