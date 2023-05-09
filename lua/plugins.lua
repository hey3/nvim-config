-- vim-jetpack が未インストールだったら追加。
local jetpackfile = vim.fn.stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
local jetpackurl = 'https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim'
if vim.fn.filereadable(jetpackfile) == 0 then
  vim.fn.system(string.format('curl -fsSLo %s --create-dirs %s', jetpackfile, jetpackurl))
end

vim.cmd('packadd vim-jetpack')

-- プラグイン追加。
require('jetpack.packer').startup(function(use)
  -- パッケージマネージャー
  use {
    'tani/vim-jetpack',
    opt = 1
  }
  -- テーマ
  use {
    'morhetz/gruvbox'
  }
  -- coc
  use {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      vim.g.coc_global_extensions = {
        'coc-prettier',
        'coc-eslint',
        'coc-stylelint',
        'coc-pairs',
        'coc-tsserver',
        'coc-json'
      }

      local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

      vim.keymap.set('i', '<Tab>',
        function()
          if vim.fn['coc#pum#visible']() == 1 then
            return vim.fn['coc#pum#next'](1)
          end
          if check_back_space() then
            return vim.fn['coc#refresh']()
          end
          return '<Tab>'
        end, opts)
      vim.keymap.set('i', '<S-Tab>',
        function()
          if vim.fn['coc#pum#visible']() == 1 then
            return vim.fn['coc#pum#prev'](1)
          end
          return '<S-Tab>'
        end, opts)
      vim.keymap.set('i', '<CR>',
        function()
          if vim.fn['coc#pum#visible']() == 1 then
            return vim.fn['coc#pum#confirm']();
          end
          return '\r'
        end, opts)
    end
  }
  -- ファジーファインダー
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      vim.keymap.set('n', '<C-f>', require('telescope.builtin').find_files, { noremap = true })
    end
  }
  -- ファイラ
  use {
    'lambdalisue/fern.vim',
    config = function()
      vim.keymap.set('n', '<C-e>', ':Fern . -reveal=% -drawer -toggle -width=30<CR>', { noremap = true })
    end
  }
end)

-- プラグインが利用可能になっていなかったら sync を実行。
local jetpack = require('jetpack')
for _, name in ipairs(jetpack.names()) do
  if not jetpack.tap(name) then
    jetpack.sync()
    break
  end
end
