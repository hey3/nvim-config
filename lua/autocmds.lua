local autocmd = vim.api.nvim_create_autocmd

-- 保存時に空白を削除。
autocmd('BufWritePre', {
  pattern = '*',
  command = ':%s/\\s\\+$//e',
})

-- 新しい行に自動コメントを追加しない。
autocmd('BufEnter', {
  pattern = '*',
  command = 'set fo-=c fo-=r fo-=o',
})
