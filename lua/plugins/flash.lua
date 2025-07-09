return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    labels = "nrtsgyhaeicmpod",
    modes = {
      char = {
        jump_labels = true,
        multi_line = false,
        highlight = {
          backdrop = false,
        },
        jump = {
          autojump = true,
        },
      },
    },
    label = { rainbow = { enabled = true } },
  },
  keys = {
    { "s", mode = { "n", "x", "o" }, false },
    { "S", mode = { "n", "x", "o" }, false },
    { "R", mode = { "o", "x" }, false },
  },
}
