local autocmd = vim.api.nvim_create_autocmd

-- 保存時に末尾の空白を削除
autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local view = vim.fn.winsaveview()

    vim.cmd([[%s/\s\+$//e]])

    vim.fn.winrestview(view)
  end,
})

-- 新しい行に自動コメントを追加しない
autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})
