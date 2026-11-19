local group = vim.api.nvim_create_augroup('dotfiles', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  group = group,
  callback = function() vim.highlight.on_yank() end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  group = group,
  callback = function(args)
    if vim.bo[args.buf].modifiable then
      local view = vim.fn.winsaveview()
      vim.cmd([[silent! keeppatterns %s/\s\+$//e]])
      vim.fn.winrestview(view)
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = { 'gitcommit', 'markdown', 'text', 'tex' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
