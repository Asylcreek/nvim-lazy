return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      nginx = { "nginxfmt" },
      nix = { "nil" },
      toml = { "taplo" },
      css = { "prettier" },
      scss = { "prettier" },
      svelte = { "prettier" },
      swift = { "swift_format" },
    },
  },
}
