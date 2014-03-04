" ------------------------------
" Bundle Settings
" ------------------------------
set nocompatible " viとの互換性OFF
filetype off     " ファイル形式の検出を無効にする

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/unite.vim'

" ------------------------------
" General Settings
" ------------------------------
filetype indent on            " ファイル形式別インデントを有効にする
set expandtab                 " Tabをスペースに置き換える
set tabstop=2                 " Tabが対応する空白数
set shiftwidth=2              " 自動インデントの各段階における空白数

" ------------------------------
" Look And Feel Settings
" ------------------------------
set number                    " 行番号を表示
syntax on                     " 表徴表示ON
set ruler                     " ルーラーを表示

" ------------------------------
" Syntastic Settings
" ------------------------------
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1
let g:syntastic_php_php_args = '-l'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
