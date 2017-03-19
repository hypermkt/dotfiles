" ------------------------------
" Vim Settings
" ------------------------------
filetype off     " ファイル形式の検出を無効にする

" For vim-plug
call plug#begin('~/.vim/plugged')

" Syntax checking hacks for vim
Plug 'scrooloose/syntastic'

" Improved PHP omnicompletion
Plug 'shawncplus/phpcomplete.vim'

" Keyword Completion
Plug 'Shougo/neocomplete.vim'

" ------------------------------
" General Settings
" ------------------------------
filetype indent on            " ファイル形式別インデントを有効にする
set expandtab                 " Tabをスペースに置き換える
set tabstop=2                 " Tabが対応する空白数
set shiftwidth=2              " 自動インデントの各段階における空白数
set autoindent
set paste

" ------------------------------
" Look And Feel Settings
" ------------------------------
set number                    " 行番号を表示
set title                     " タイトルを表示
syntax on                     " 表徴表示ON
set ruler                     " ルーラーを表示
set hlsearch                  " 検索結果をハイライト

" ------------------------------
" Encoding Settings
" ------------------------------
set encoding=utf-8
set fileencodings=utf-8,euc-jp

" ------------------------------
" Markdown Settings
" ------------------------------
au BufNewFile,BufRead *.md :set filetype=markdown
au BufNewFile,BufRead *.vue set filetype=html

" ------------------------------
" Indent Settings
" ------------------------------
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php set tabstop=2
autocmd FileType php set shiftwidth=2
autocmd FileType php set softtabstop=2

autocmd FileType html set tabstop=2
autocmd FileType html set shiftwidth=2
autocmd FileType html set softtabstop=2

" CakePHP Template
autocmd FileType ctp set tabstop=2
autocmd FileType ctp set shiftwidth=2
autocmd FileType ctp set softtabstop=2
