" ------------------------------
" Bundle Settings
" ------------------------------
set nocompatible " viとの互換性OFF
filetype off     " ファイル形式の検出を無効にする

set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
" Bundle 'scrooloose/syntastic'" Bundle 'Shougo/unite.vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'Shougo/neocomplete.vim'

" ------------------------------
" General Settings
" ------------------------------
filetype indent on            " ファイル形式別インデントを有効にする
set expandtab                 " Tabをスペースに置き換える
set tabstop=2                 " Tabが対応する空白数
set shiftwidth=2              " 自動インデントの各段階における空白数
set autoindent

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

" ------------------------------
" PHP Settings
" ------------------------------
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php set tabstop=4
autocmd FileType php set shiftwidth=4
autocmd FileType php set softtabstop=4

" ------------------------------
" Plugin Settings
" ------------------------------
" Syntastic
" let g:syntastic_check_on_open = 1
" let g:syntastic_enable_signs = 1
" let g:syntastic_echo_current_error = 1
" let g:syntastic_auto_loc_list = 2
" let g:syntastic_enable_highlighting = 1
" let g:syntastic_php_php_args = '-l'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" Ctags
" set tags=tags
" let Tlist_Ctags_Cmd = "/usr/bin/ctags"  " ctagsのコマンド
" let Tlist_Show_One_File = 1             " 現在表示中のファイルのみのタグしか表示しない
" let Tlist_Use_Right_Window = 1          " 右側にtag listのウインドうを表示する
" let Tlist_Exit_OnlyWindow = 1           " taglistのウインドウだけならVimを閉じる
" map <silent> <leader>l :TlistToggle<CR> " \lでtaglistウインドウを開いたり閉じたり出来るショートカット

" neocomplete
let g:neocomplete#enable_at_startup = 1
