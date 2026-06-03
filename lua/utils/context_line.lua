local M = {}

local log_lines = {
  c = 'printf("%s\\n", |);',
  cpp = 'std::cout << | << "\\n";',
  go = "fmt.Println(|)",
  java = "System.out.println(|);",
  javascript = "console.log(|);",
  javascriptreact = "console.log(|);",
  jsx = "console.log(|);",
  lua = "print(|)",
  php = "var_dump(|);",
  python = "print(|)",
  ruby = "puts |",
  rust = 'println!("{:?}", |);',
  sh = "echo |",
  tsx = "console.log(|);",
  typescript = "console.log(|);",
  typescriptreact = "console.log(|);",
  svelte = "console.log(|);",
}

local function current_lang()
  local ok, node = pcall(vim.treesitter.get_node, { ignore_injections = false })
  if ok and node then
    local range = { node:range() }
    local parser_ok, parser = pcall(vim.treesitter.get_parser, 0)
    local tree_ok, tree = parser_ok and pcall(parser.language_for_range, parser, range)

    if tree_ok and tree then
      return tree:lang()
    end
  end

  return vim.treesitter.language.get_lang(vim.bo.filetype) or vim.bo.filetype
end

local function snippet()
  local lang = current_lang()
  local line = log_lines[lang]

  if line then
    return line
  end

  error(("No log line configured for %q"):format(lang), 0)
end

function M.insert(above)
  local line = snippet()
  local marker = line:find("|", 1, true) or (#line + 1)
  local text = line:gsub("|", "", 1)
  local current_row = vim.api.nvim_win_get_cursor(0)[1]
  local insert_row = above and current_row - 1 or current_row

  vim.api.nvim_buf_set_lines(0, insert_row, insert_row, false, { text })
  vim.api.nvim_win_set_cursor(0, { insert_row + 1, marker - 1 })
  vim.cmd.startinsert()
end

return M
