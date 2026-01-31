" ------------------------------
" Vim Settings
" ------------------------------

set nocompatible
filetype off     " ファイル形式の検出を無効にする

" For vim-plug
call plug#begin('~/.vim/plugged')

" Syntax checking hacks for vim
Plug 'scrooloose/syntastic'

" Keyword Completion
Plug 'Shougo/neocomplete.vim'
Plug 'mattn/emmet-vim'
Plug 'EdenEast/nightfox.nvim'

call plug#end()

" ------------------------------
" General Settings
" ------------------------------
filetype indent on            " ファイル形式別インデントを有効にする
set expandtab                 " Tabをスペースに置き換える
set tabstop=2                 " Tabが対応する空白数
set shiftwidth=2              " 自動インデントの各段階における空白数
set autoindent
" これが有効だとなぜかタブに戻ってしまうので一旦コメントアウト
"set paste

" ------------------------------
" Look And Feel Settings
" ------------------------------
set number                    " 行番号を表示
set title                     " タイトルを表示
syntax on                     " 表徴表示ON
set ruler                     " ルーラーを表示
set hlsearch                  " 検索結果をハイライト
colorscheme nightfox

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
autocmd FileType html set tabstop=2
autocmd FileType html set shiftwidth=2
autocmd FileType html set softtabstop=2

" ------------------------------
" vim-go Settings
" ------------------------------
au BufNewFile,BufRead *.go set filetype=go

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
