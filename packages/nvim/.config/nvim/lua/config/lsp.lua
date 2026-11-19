vim.diagnostic.config({
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = true,
  virtual_text = { spacing = 2, source = 'if_many' },
})

local servers = {
  { name = 'bashls', cmd = { 'bash-language-server', 'start' }, filetypes = { 'sh', 'bash', 'zsh' }, roots = { '.git' } },
  { name = 'clangd', cmd = { 'clangd' }, filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' }, roots = { 'compile_commands.json', 'compile_flags.txt', '.clangd', '.git' } },
  { name = 'gopls', cmd = { 'gopls' }, filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' }, roots = { 'go.work', 'go.mod', '.git' } },
  { name = 'lua_ls', cmd = { 'lua-language-server' }, filetypes = { 'lua' }, roots = { '.luarc.json', '.luarc.jsonc', '.git' } },
  { name = 'pyright', cmd = { 'pyright-langserver', '--stdio' }, filetypes = { 'python' }, roots = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' } },
  { name = 'rust_analyzer', cmd = { 'rust-analyzer' }, filetypes = { 'rust' }, roots = { 'Cargo.toml', '.git' } },
  { name = 'texlab', cmd = { 'texlab' }, filetypes = { 'tex', 'plaintex', 'bib' }, roots = { '.latexmkrc', 'latexmkrc', '.git' } },
  { name = 'ts_ls', cmd = { 'typescript-language-server', '--stdio' }, filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }, roots = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' } },
}

local function contains(list, value)
  for _, item in ipairs(list) do
    if item == value then return true end
  end
  return false
end

local function project_root(bufnr, markers)
  local name = vim.api.nvim_buf_get_name(bufnr)
  local start = name ~= '' and vim.fs.dirname(name) or vim.fn.getcwd()
  if vim.fs.root then
    return vim.fs.root(start, markers) or start
  end
  local found = vim.fs.find(markers, { upward = true, path = start })[1]
  return found and vim.fs.dirname(found) or start
end

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('dotfiles-lsp-start', { clear = true }),
  callback = function(args)
    local filetype = vim.bo[args.buf].filetype
    for _, server in ipairs(servers) do
      if contains(server.filetypes, filetype) and vim.fn.executable(server.cmd[1]) == 1 then
        vim.lsp.start({
          name = server.name,
          cmd = server.cmd,
          root_dir = project_root(args.buf, server.roots),
        }, { bufnr = args.buf })
      end
    end
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('dotfiles-lsp-attach', { clear = true }),
  callback = function(args)
    local map = function(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, { buffer = args.buf, desc = desc })
    end
    map('gd', vim.lsp.buf.definition, 'Go to definition')
    map('gD', vim.lsp.buf.declaration, 'Go to declaration')
    map('gr', vim.lsp.buf.references, 'References')
    map('gi', vim.lsp.buf.implementation, 'Go to implementation')
    map('K', vim.lsp.buf.hover, 'Hover documentation')
    map('<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
    map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
    vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
  end,
})
