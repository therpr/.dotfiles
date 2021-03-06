set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime ath to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" PLUGINS
Plugin 'mattn/emmet-vim'
" Styles
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'chriskempson/base16-vim'

"Plugin 'vim-scripts/vim-auto-save'
Plugin 'tpope/vim-repeat'
Plugin 'shime/vim-livedown'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'danro/rename.vim'
Plugin 'kien/ctrlp.vim'
"HTML
Plugin 'docunext/closetag.vim'

" JS Plugins
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'moll/vim-node'
Plugin 'digitaltoad/vim-jade'
Plugin 'einars/js-beautify'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'marijnh/tern_for_vim'

"PHP Plugins
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'arnaud-lb/vim-php-namespace'

"Ctags
Plugin 'ludovicchabant/vim-gutentags'

" Auto brackets closing
Plugin 'Raimondi/delimitMate'
" Auto semicolon
Plugin 'lfilho/cosco.vim'

" vim-snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" Optional
Plugin 'honza/vim-snippets'

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
""""""""" General Vim settings """""""""""""""""

syntax enable
set fileformats=unix,dos
set ruler
set laststatus=2

" Auto read when a file is changed from the outside.
set autoread

" Tab key produces 4 spaces, and tab characters are converted to spaces.
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" When you start searching text with /, search is performed at every
" new character insertion.
set incsearch
set ignorecase
set smartcase
set hlsearch

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Vim-autoformat
let g:formatterpath = ['js-beautify']
"au BufWrite * :Autoformat
noremap <C-m> :Autoformat<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Vim autosave
"let g:auto_save = 1  " enable AutoSave on Vim startup
noremap <Leader>s :update<CR>
imap <C-w>w <Esc>:w<CR>
nmap <C-w>w <Esc>:w<CR>

" Call JsBeautify before saving js file
autocmd FileType javascript autocmd BufWritePre * :call JsBeautify()

" Vim livedown preview
nmap gm :LivedownPreview<CR>

" Vim NERDTree
map <C-n> :NERDTreeToggle<CR>
" Open a NERDTree automatically when vim starts up if no files were specified
"autocmd StdinReadPre * let s:std_in=0
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" Mappings
imap <C-c> <CR><Esc>O
imap jj <Esc>
imap <A> <Esc>
let mapleader=","

"By default they move you one line down and ups but on a linewise basis, which is annoying. If I hit j I would expect the cursor to move down a single row on the screen, just like every other text editing area in the world.
:nmap j gj
:nmap k gk

"Tagbar
nmap <F8> :TagbarToggle<CR>

"Emmet C-E LEADER
"let g:user_emmet_leader_key='<C-E>'

"Omnicomplete
set omnifunc=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

"Php namespace
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>

set noswapfile
set number
set relativenumber
set background=dark
set term=screen-256color
set t_Co=256
let base16colorspace=256
colorscheme base16-ocean

"let g:airline_theme='hybrid'
" Powerline
let g:airline_powerline_fonts = 1
"let g:airline_theme='luna'

" auto comma - auto semicolon
autocmd FileType javascript,css,YOUR_LANG nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css,YOUR_LANG inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" jsbeautify
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" vim-node-dict
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict

" moving in insert mode C+o
inoremap Ż <Esc>:m .-2<CR>==gi
inoremap ∆ <Esc>:m .+1<CR>==gi

" clear search hl
" Make double-<Esc> clear search highlights
"nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
:nmap \q :nohlsearch<CR>

" Ctrl + [ = ESC
