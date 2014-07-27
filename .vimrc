" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  "filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set encoding=utf-8
set foldmethod=syntax
set foldlevelstart=20
set number
set shiftwidth=8
set showmatch
set smartindent
set spell spelllang=en_gb
set tabstop=8
set title

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

" For Go
"set rtp+=$GOROOT/misc/vim
Bundle 'jnwhiteh/vim-golang'
autocmd FileType go compiler go
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" Start nerdtree on startup
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['^.git$', '\.pyc$', '\~$']
autocmd vimenter * if !argc() | NERDTree | wincmd p | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Start nerdcommenter
Bundle 'scrooloose/nerdcommenter'

" Start gitgutter
Bundle 'airblade/vim-gitgutter'
highlight SignColumn ctermbg=None

" Start vim-gocode
Bundle 'Blackrush/vim-gocode'

" Enable plugins for autocompletion
Bundle 'AutoComplPop'
Bundle 'SuperTab'
Bundle 'Rip-Rip/clang_complete'
Bundle 'msanders/snipmate.vim'

" Enable plugins for LaTeX
Bundle 'lervag/vim-latex'

" Enable surround
Bundle 'tpope/vim-surround'

" Enable JSHint
Bundle 'Shutnik/jshint2.vim'
let jshint2_read = 1
let jshint2_save = 1
let jshint2_confirm = 0

" Enable Syntastic
Bundle 'scrooloose/syntastic'
let g:syntastic_typescript_checkers = ["tslint"]
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1

" Enable typescript-vim
Bundle 'leafgarland/typescript-vim'

" Enable floobits
"Bundle 'Floobits/floobits-vim'

" Trigger update after bundles loaded
if vundleinstalled == 0
	BundleInstall
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

