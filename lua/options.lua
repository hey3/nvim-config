local options = {
   -- 基本
  encoding = 'utf-8', -- 文字エンコーディング
  fileencoding = 'utf-8', -- ファイルコンテンツの文字エンコーディング

  -- UI
  title = true, -- ウィンドウタイトルを表示するか
  number = true, -- 行番号を表示するかどうか
  relativenumber = false, -- カーソル行からの相対的な行番号を表示するかどうか
  numberwidth = 4, -- 行番号を表示するのに使われる桁数の最小値
  signcolumn = 'yes', -- 目印桁を常に表示
  cursorline = true, -- カーソルがあるテキスト行を CursorLine で強調するかどうか
  showmode = true, -- 挿入モード、置換モードまたはビジュアルモードで最終行にメッセージを表示するかどうか
  showtabline = 2, -- タブページを常に表示
  cmdheight = 2, -- コマンドラインの行数
  conceallevel = 0, -- conceal 構文表示を常に表示
  termguicolors = true, -- guifg と guibg を使用するかどうか
  background = 'dark', -- 背景色
  pumblend = 5, -- ポップアップメニューのの擬似透過性
  winblend = 0, -- フローティング ウィンドウの擬似透過性

  -- 検索
  hlsearch = true, -- 前回の検索パターンが存在するとき、それにマッチするテキストを全て強調表示するかどうか
  ignorecase = true, -- 検索パターンにおいて大文字と小文字を区別しないかどうか
  smartcase = true, --  検索パターンが大文字を含んでいたらオプション 'ignorecase' を上書きするかどうか

  -- 編集
  expandtab = true, -- INSERT 時にタブを挿入するとき、代わりに適切な数の空白を使うかどうか
  shiftwidth = 2, -- 自動インデントの各段階に使われる空白の数
  tabstop = 2, -- ファイル内のタブが対応する空白の数
  smartindent = true, -- 新しい行を作ったときに高度な自動インデント smart autoindenting を行うかどうか
  wrap = false, -- 行を折り返すかどうか

  -- 補完
  completeopt = { 'menuone', 'noselect' }, -- INSERT 時の補完
  pumheight = 10, --  挿入モード補完のポップアップメニューに表示される項目数の最大値

  -- ファイル
  backup = false, -- バックアップを作成するか
  writebackup = false, -- ファイルの上書きの前にバックアップを作るかどうか
  swapfile = false, -- バッファでスワップファイルを使用するかどうか
  undofile = true, -- 保存後にもアンドゥ履歴を残すかどうか

  -- Clipboard
  clipboard = 'unnamedplus', -- OS のクリップボードと共有する

  -- Terminal
  shell = 'fish', -- 使用するシェル

  -- マウス
  mouse = 'a', -- 常にマウス使用可能


  -- スクロール
  scrolloff = 8, -- カーソルの上または下に最低数表示する行
  sidescrolloff = 8, -- カーソルの右または左に最低数表示する列

  -- タイムアウト
  timeoutlen = 300, -- 連続入力として待機する時間
  updatetime = 300, -- スワップファイルをディスクに書き込むタイミングまでの待機する時間

  -- 分割
  splitbelow = false, -- ウィンドウ縦分割時に新しいウィンドウを現在のウィンドウの下に配置するかどうか
  splitright = false, -- ウィンドウ横分割時に新しいウィンドウを現在のウィンドウの右に配置するかどうか

  -- wildmenu
  wildoptions = 'pum', -- 完のマッチの表示に補完ポップアップメニューを使う

  -- wrap
  whichwrap = '<,>,[,],h,l',

  -- shell
  shellcmdflag = "-c",

  backupskip = { '/tmp/*', '/private/tmp/*' }, -- ファイル名のパターンのリスト
  guifont = 'monospace:h17' -- VimのGUI版で使われるフォントのリスト
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- 不要なインデント設定などは filetype ごとに上書き可能
vim.opt.formatoptions = {
  "j",
}
