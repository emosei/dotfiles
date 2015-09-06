"=========================
" 基本設定
"=========================
syntax on
colorscheme desert

" タブをスペース2つに
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

"=========================
" ショートカット
"=========================
"ctrl+eでNERDTreeを開く
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"=========================
" Neobundle設定
"=========================
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

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

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかを確認する
NeoBundleCheck
