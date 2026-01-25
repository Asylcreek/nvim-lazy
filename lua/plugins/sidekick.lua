return {
  "folke/sidekick.nvim",
  opts = {
    nes = { enabled = false },
    cli = {
      tools = {
        droid = {
          cmd = { "droid" },
        },
      },
      mux = {
        backend = "tmux",
        enabled = true,
      },
    },
    copilot = { status = { enabled = false } },
  },
  keys = {
    {
      "<leader>aa",
      function()
        require("sidekick.cli").show({ name = "droid" })
      end,
      desc = "Sidekick Toggle CLI",
    },
  },
}
