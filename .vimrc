"=========================
" 基本設定
"=========================
syntax on
colorscheme desert

" タブをスペース2つに
set tabstop=2

""新しい行のインデントを現在行と同じにする
set autoindent

"タブの代わりに空白文字を指定する
set expandtab

"行番号を表示する
set number

"閉括弧が入力された時、対応する括弧を強調する
set showmatch

set smarttab

set shiftwidth=2


" 全角スペースの表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkGray gui=reverse guifg=DarkGray
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    "ZenkakuSpace をカラーファイルで設定するなら、
    "次の行をコメントアウト
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

"
" NeoBundle
"
"
" NeoBundle がインストールされていない時、
" もしくは、プラグインの初期化に失敗した時の処理
function! s:WithoutBundles()
  colorscheme desert
  " その他の処理
endfunction

" NeoBundle よるプラグインのロードと各プラグインの初期化
function! s:LoadBundles()
  " 読み込むプラグインの指定
  NeoBundle 'tpope/vim-surround'
  "-------------------------
  " 各種プラグライン
  "-------------------------
  " colorscheme
  "NeoBundle 'w0ng/vim-hybrid'
  "NeoBundle 'vim-scripts/twilight'
  " エクスプローラー的なNERDTree
  NeoBundle 'scrooloose/nerdtree'
  " 入力保管
  NeoBundle 'Townk/vim-autoclose'
  " マークアップ用入力補完
  NeoBundle 'mattn/emmet-vim'
  " ソースコード実行
  NeoBundle 'thinca/vim-quickrun'
  " ...
  " 読み込んだプラグインの設定
  " ...
  "=========================
  " ショートカット
  "=========================
  "ctrl+eでNERDTreeを開く
  nnoremap <silent><C-e> :NERDTreeToggle<CR>
endfunction

" NeoBundle がインストールされているなら LoadBundles() を呼び出す
" そうでないなら WithoutBundles() を呼び出す
function! s:InitNeoBundle()
  if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    filetype plugin indent off
    if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
    try
      call neobundle#begin(expand('~/.vim/bundle/'))
	  NeoBundleFetch 'Shougo/neobundle.vim'
      call s:LoadBundles()
      call neobundle#end()
    catch
      call s:WithoutBundles()
    endtry 
  else
    call s:WithoutBundles()
  endif

  filetype indent plugin on
  syntax on
  " 未インストールのプラグインがある場合、インストールするかを確認する
  NeoBundleCheck
endfunction

call s:InitNeoBundle()


