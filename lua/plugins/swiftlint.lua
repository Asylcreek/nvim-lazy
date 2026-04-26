local pattern = "[^:]+:(%d+):(%d+): (%w+): (.+)"
local groups = { "lnum", "col", "severity", "message" }
local defaults = { ["source"] = "swiftlint" }
local severity_map = {
  ["error"] = vim.diagnostic.severity.ERROR,
  ["warning"] = vim.diagnostic.severity.WARN,
}

return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      swift = { "swiftlint" },
    },
    linters = {
      swiftlint = {
        cmd = "swiftlint",
        stdin = true,
        args = {
          "lint",
          "--use-stdin",
          "--config",
          "-",
        },
        stream = "stdout",
        ignore_exitcode = true,
        parser = require("lint.parser").from_pattern(pattern, groups, severity_map, defaults),
      },
    },
  },
}
