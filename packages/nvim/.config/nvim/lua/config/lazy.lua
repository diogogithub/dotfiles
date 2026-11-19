local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop
if not uv.fs_stat(lazypath) then
  local result = vim.fn.system({
    'git', 'clone', '--filter=blob:none', '--branch=stable',
    'https://github.com/folke/lazy.nvim.git', lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.notify('Could not install lazy.nvim:\n' .. result, vim.log.levels.ERROR)
    return
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'nvim-mini/mini.nvim',
    version = '*',
    config = function()
      require('mini.ai').setup()
      require('mini.comment').setup()
      require('mini.completion').setup()
      require('mini.icons').setup()
      require('mini.pairs').setup()
      require('mini.statusline').setup()
      require('mini.surround').setup()
      MiniIcons.mock_nvim_web_devicons()
    end,
  },
  {
    'ibhagwan/fzf-lua',
    cond = vim.fn.executable('fzf') == 1,
    cmd = 'FzfLua',
    keys = {
      { '<leader>ff', '<cmd>FzfLua files<CR>', desc = 'Find files' },
      { '<leader>fg', '<cmd>FzfLua live_grep<CR>', desc = 'Live grep' },
      { '<leader>fb', '<cmd>FzfLua buffers<CR>', desc = 'Buffers' },
      { '<leader>fh', '<cmd>FzfLua help_tags<CR>', desc = 'Help tags' },
    },
    opts = { 'fzf-native' },
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function() require('conform').format({ async = true, lsp_format = 'fallback' }) end,
        desc = 'Format buffer',
      },
    },
    opts = {
      notify_on_error = false,
      formatters_by_ft = {
        c = { 'clang_format' },
        cpp = { 'clang_format' },
        go = { 'gofmt' },
        lua = { 'stylua' },
        php = { 'php_cs_fixer' },
        python = { 'ruff_format', 'black', stop_after_first = true },
        sh = { 'shfmt' },
      },
    },
  },
  {
    'lervag/vimtex',
    ft = 'tex',
    init = function()
      if vim.fn.executable('zathura') == 1 then
        vim.g.vimtex_view_method = 'zathura'
      elseif vim.fn.executable('okular') == 1 then
        vim.g.vimtex_view_general_viewer = 'okular'
        vim.g.vimtex_view_method = 'general'
      end
      vim.g.vimtex_compiler_method = 'latexmk'
    end,
  },
}, {
  checker = { enabled = true, notify = false },
  change_detection = { notify = false },
  install = { colorscheme = { 'habamax' } },
})
