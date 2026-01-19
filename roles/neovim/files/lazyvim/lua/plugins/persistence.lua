return {
  "folke/persistence.nvim",
  keys = {
    {
      "<leader>qw",
      function()
        require("persistence").save()
      end,
      desc = "Save Current Session",
    },
  },
}
