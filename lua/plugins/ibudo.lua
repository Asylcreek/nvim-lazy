return {
  dir = "~/.ibudo/integrations/ibudo.nvim",
  name = "ibudo.nvim",
  lazy = false,
  keys = {
    {
      "<leader>ic",
      function()
        return require("ibudo").comment_operator()
      end,
      mode = { "n", "x" },
      expr = true,
      desc = "Comment on motion/selection into Ibudo's composer",
    },
    {
      "<leader>icc",
      function()
        return require("ibudo").comment_line()
      end,
      mode = "n",
      expr = true,
      desc = "Comment on line into Ibudo's composer",
    },
  },
}
