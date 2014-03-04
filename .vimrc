" ------------------------------
" Bundle Settings
" ------------------------------
set nocompatible " viとの互換性OFF
filetype off     " ファイル形式の検出を無効にする

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
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
