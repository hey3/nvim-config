-- ============================================================
-- Jetpack bootstrap
-- ============================================================

local jetpack_path =
  vim.fn.stdpath("data") .. "/site/pack/jetpack/opt/vim-jetpack"

if vim.fn.empty(vim.fn.glob(jetpack_path)) > 0 then
  vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/tani/vim-jetpack",
    jetpack_path,
  })
end

vim.cmd('packadd vim-jetpack')

-- ============================================================
-- Plugins
-- ============================================================

require("jetpack.packer").add {
  -- Plugin manager
  { "tani/vim-jetpack" },

  -- Colorscheme
  { "morhetz/gruvbox" },

  -- Completion / LSP
  {
    "neoclide/coc.nvim",
    branch = "release",
  },

  -- Telescope
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter" },

  -- File explorer
  { "lambdalisue/fern.vim" },
}

-- ============================================================
-- Install missing plugins
-- ============================================================

local jetpack = require("jetpack")

for _, name in ipairs(jetpack.names()) do
  if not jetpack.tap(name) then
    jetpack.sync()
    break
  end
end


-- ============================================================
-- Telescope
-- ============================================================

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<Leader>f", builtin.find_files, {
  desc = "Find files",
})

vim.keymap.set("n", "<Leader>g", builtin.live_grep, {
  desc = "Live grep",
})


-- ============================================================
-- Fern
-- ============================================================

vim.keymap.set("n", "<Leader>1", function()
  vim.cmd("Fern . -reveal=% -drawer -toggle -width=30")
end, {
  desc = "File explorer",
})


-- ============================================================
-- Coc
-- ============================================================

vim.g.coc_global_extensions = {
  "coc-prettier",
  "coc-eslint",
  "coc-stylelint",
  "coc-pairs",
  "coc-tsserver",
  "coc-json",
}

local function check_back_space()
  local col = vim.api.nvim_win_get_cursor(0)[2]

  return col == 0
    or vim.api.nvim_get_current_line():sub(col, col):match("%s")
end

vim.keymap.set("i", "<Tab>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn["coc#pum#next"](1)
  end

  if check_back_space() then
    return "<Tab>"
  end

  return vim.fn["coc#refresh"]()
end, {
  expr = true,
  replace_keycodes = true,
  silent = true,
})

vim.keymap.set("i", "<S-Tab>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn["coc#pum#prev"](1)
  end

  return "<C-h>"
end, {
  expr = true,
  replace_keycodes = true,
  silent = true,
})

vim.keymap.set("i", "<CR>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn["coc#pum#confirm"]()
  end

  return "<CR>"
end, {
  expr = true,
  replace_keycodes = true,
  silent = true,
})
