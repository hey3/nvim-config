vim.opt.background = "dark"
vim.opt.termguicolors = true

local ok = pcall(vim.cmd.colorscheme, "gruvbox")

if not ok then
  vim.cmd.colorscheme("default")
end
