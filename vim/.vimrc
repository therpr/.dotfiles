set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime ath to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" PLUGINS
Plugin 'mattn/emmet-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'tpope/vim-repeat'
Plugin 'shime/vim-livedown'

" JS Plugins
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'

" Auto brackets closing
Plugin 'Raimondi/delimitMate'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on    " required
" To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
"
syntax enable

" Indenting
filetype indent on
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Vim-autoformat
let g:formatterpath = ['js-beautify']
au BufWrite * :Autoformat

" Vim autosave
let g:auto_save = 1  " enable AutoSave on Vim startup

" Vim livedown preview
nmap gm :LivedownPreview<CR>

set number
set relativenumber
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized

" Mappings
imap <C-c> <CR><Esc>O
imap jj <Esc>
