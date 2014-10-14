" Use vim settings
set nocompatible

"set encoding=utf-8
"set foldmethod=syntax
"set foldlevelstart=20
set number
"set shiftwidth=8
"set showmatch
"set smartindent
"set spell spelllang=en_gb
"set tabstop=8
"set title

" Set backup and swap directories to avoid clutter
let vimdir = expand('~/.vim/')
let swpdir = vimdir . 'swaps/'
let bkpdir = vimdir . 'backups/'
let unddir = vimdir . 'undos/'
set undofile
if !isdirectory(swpdir) || !isdirectory(bkpdir) || !isdirectory(unddir)
	execute 'silent !mkdir -p ' . swpdir
	execute 'silent !mkdir -p ' . bkpdir
	execute 'silent !mkdir -p ' . unddir
endif
" Add // to enable building of bkp/swp dirs
let &directory = swpdir . '/'
let &backupdir = bkpdir . '/'
let &undodir   = unddir . '/'

" Switch filetype off for plugin/bundle loading
filetype off
filetype plugin indent off

" For Vundle
let bundledir = vimdir . 'bundle/'
let vundledir = bundledir . 'vundle/'
let vundleinstalled = 1
if !isdirectory(vundledir)
	let vundleinstalled = 0
	execute 'silent !mkdir -p ' . bundledir
	execute 'silent !git clone https://github.com/gmarik/vundle.git ' . vundledir
endif
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Plugin 'gmarik/vundle'

" Use airline for a better statusline
Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1

" Use sensible defaults
Plugin 'tpope/vim-sensible'

" Use fugitive for git
Plugin 'tpope/vim-fugitive'

" Use solarized colorscheme
Plugin 'altercation/vim-colors-solarized'

" For Go
"set rtp+=$GOROOT/misc/vim
Plugin 'jnwhiteh/vim-golang'
autocmd FileType go compiler go
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" Start nerdtree on startup
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['^.git$', '\.pyc$', '\~$']
autocmd vimenter * if !argc() | NERDTree | wincmd p | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Start nerdcommenter
Plugin 'scrooloose/nerdcommenter'

" Start gitgutter
Plugin 'airblade/vim-gitgutter'
highlight SignColumn ctermbg=None

" Start vim-gocode
Plugin 'Blackrush/vim-gocode'

" Enable plugins for autocompletion
Plugin 'AutoComplPop'
Plugin 'SuperTab'
Plugin 'Rip-Rip/clang_complete'
Plugin 'msanders/snipmate.vim'

" Enable plugins for LaTeX
Plugin 'lervag/vim-latex'

" Enable surround
Plugin 'tpope/vim-surround'

" Enable JSHint
Plugin 'Shutnik/jshint2.vim'
let jshint2_read = 1
let jshint2_save = 1
let jshint2_confirm = 0

" Enable Syntastic
Plugin 'scrooloose/syntastic'
let g:syntastic_typescript_checkers = ["tslint"]
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1

" Enable typescript-vim
Plugin 'leafgarland/typescript-vim'

" Enable floobits
"Plugin 'Floobits/floobits-vim'

" Trigger update after bundles loaded
if vundleinstalled == 0
	PluginInstall
endif
filetype plugin indent on
syntax on

" Mouse configurations
if has('mouse')
  set mouse=a
  set mousefocus " Added in hopes that this will work in the future...
  set mousehide
endif

" Make <Home> jump to start of line ignoring prepended whitespace
map <Home> ^
imap <Home> <Esc>^i

" CTRL-n for NERDTree toggling
map <C-n> :NERDTreeTabsToggle<CR>

" CTRL-PageUp/PageDown for tab switching
map <C-PageUp> :tabp<CR>
map <C-PageDown> :tabn<CR>

" Map \p to toggle paste mode
nnoremap <leader>p :set paste!<CR>

" Remove all trailing whitespaces on write
autocmd BufWritePre * :%s/\s\+$//e

" Try to use system clipboard
set clipboard=unnamedplus

" Disable arrow keys for good practise
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" Visually mark 80 char column as grey
set t_Co=256
let &colorcolumn=join(range(81,256),",")
highlight ColorColumn ctermbg=None ctermfg=lightgrey

" Always show min. 10 lines before/after current line
set scrolloff=10

autocmd BufRead,BufNewFile *.ts set expandtab shiftwidth=4 tabstop=4
autocmd BufRead,BufNewFile *.m  set expandtab shiftwidth=2 tabstop=2

