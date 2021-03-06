set nocompatible              " be iMproved, required
filetype off      
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" WRINTING 
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
" FILES 
" Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plugin 'junegunn/fzf.vim'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-eunuch'
" EDITING 
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-ragtag'
Plugin 'reedes/vim-pencil'
Plugin 'simnalamburt/vim-mundo'
" Plugin 'reedes/vim-litecorrect'
" Languages 
Plugin 'ap/vim-css-color'
" Plugin 'lervag/vimtex'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc-after'
" Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'reedes/vim-lexical'
" COLORS 
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'dikiaap/minimalist'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'reedes/vim-colors-pencil'


call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

set encoding=utf-8
" makes vim default register = the system clipboard
set clipboard+=unnamedplus 

" ============================================
" ============================================
" REMAPS ============================================
" Leader key = space
nnoremap <SPACE> <Nop>
let mapleader = ' '
nnoremap ; :
xnoremap ; :
" Don't use Ex mode, use Q for formatting.
" Revert with :unmap Q.
map Q gq
" Disable arrow keys in normal mode
no <Up> <Nop>
no <Down> <Nop>
no <Left> <Nop>
no <Right> <Nop>

" Disable arrow keys in insert mode
ino <Up> <Nop>
ino <Down> <Nop>
ino <Left> <Nop>
ino <Right> <Nop>
" Remap ESC to kk
:imap jj <Esc>
" Disable space in normal
" Quicker window movement
" Keymaps
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" Buffer movement (C-n - next, C-p - previous).
map <C-n> :bn<cr>
map <C-p> :bp<cr>

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
" The matchit plugin makes the % command work better, but it is not
" The ! means the package won't be loaded right away but when plugins are loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Sensible options
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set autowrite 
" EDIT NON-WHITESPACE
set virtualedit="block"
set autochdir
set relativenumber
set number
set splitbelow splitright
set ruler
set mouse=nicr " Mouse scrolling
set t_Co=256 " 256 colors TERM
set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key
set display=truncate
set history=200
set showcmd
set hidden
set magic
set termguicolors

" Completion for file open etc.
set wildmenu
set wildmode=list:longest
set wildignore+=*.log,*.pdf,*.docx,*.pptx,*.swp,*.o,*.hi,*~
" Ignore these when using TAB key with :e
set suffixes=~,.aux,.bak,.bkp,.dvi,.hi,.o,.pdf,.gz,.idx,.log,.ps,.swp,.tar,.ilg,.bbl,.toc,.ind,.docx
" Create backup files ending in ~, in ~/tmp or, if
" that is not possible, in the working directory.
set backup
set backupdir=~/.cache/backups
set directory=~/.cache/swaps
" Flexible backspace: allow backspacing over autoindent, line breaks, start of
" insert.
set backspace=indent,eol,start

" SPELL OPTIONS
set spelllang=fr,en_us,es,cjk
" THEMEING
set background=dark

" ===================================
" LEADER SHORTCUTS 
" =================================

" ==========================
" Pandoc renders
" See https://vi.stackexchange.com/questions/17549/using-pandoc-with-vim-keybindings
" Faster Make
autocmd FileType pandoc noremap <buffer><silent> <leader>pb :<c-u>Pandoc! beamer -s<cr> 
autocmd FileType pandoc noremap <buffer><silent> <leader>pp :<c-u>Pandoc! pdf -s<cr> 
autocmd FileType pandoc noremap <buffer><silent> <leader>ph :<c-u>Pandoc! ms -s -o %:r.pdf<cr>
" autocmd for filetype specific
autocmd FileType pandoc nnoremap <buffer><silent> <leader>pd :<c-u>Pandoc! docx -s --mathjax<cr> 
autocmd FileType tex nnoremap <buffer><silent> <leader>op :<c-u>silent call system('zathura '.expand('%:p:r:S').'.pdf')<cr>
" Without vim-pandoc
" autocmd FileType pandoc nnoremap <buffer> <leader>pd :<c-u>!pandoc -f markdown -t docx -s --mathjax -o %:r.docx %<CR> 
" autocmd FileType pandoc noremap <leader>pb :<c-u>!pandoc -f markdown --pdf-engine=xelatex -t beamer -s -o %:r.pdf %<CR> 

nnoremap <buffer><silent> <leader>w :<c-u>w<cr>
" nnoremap <buffer><silent> <leader>y :<c-u>Goyo<cr>
nnoremap <buffer><silent> <leader>l :<c-u>Limelight<cr>
nnoremap <buffer><silent> <leader>f :<c-u>NERDTreeToggle<cr>


" ============================================
" ============================================
" PLUGIN OPTIONS
" ============================================
" Tex highlighting
let g:tex_flavor = "latex"

" VIM AIRLINE
" Enable wordcount
let g:airline#extensions#wordcount#enabled = 1
" Add notes to filetypes
let g:airline_powerline_fonts = 1
" A tab bar
let g:airline#extensions#tabline#enabled = 0
" Straight tabs 
let g:airline#extensions#vimtex#enabled = 1
" airline theme
let g:airline_theme='pencil'
" vim Pencil colors
let g:pencil_terminal_italics = 1

" COLORS
syntax on
colorscheme pencil
" Some tab completions Omnicmpletions
" set omnifunc=syntaxcomplete#Complete
" vimcompletesme options
" vim-pandoc options
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#spell#enabled = 0
" vim-pandoc-after integration
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#syntax#conceal#use = 0
" FZF options
" Vim-Pencil
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
                            \ | call lexical#init()
"                            \ | call litecorrect#init()
  autocmd FileType help         call pencil#init()
                            \ | call lexical#init()
"                            \ | call litecorrect#init()
  autocmd FileType pandoc       call pencil#init()
                            \ | call lexical#init()
"                            \ | call litecorrect#init()
  autocmd FileType text         call pencil#init()
                            \ | call lexical#init()
"                            \ | call litecorrect#init()
" GUI options
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
if has("gui_running")
  set columns=80
  set lsp=3 " line spacing
  set guifont=Fira\ Code\ Retina\ 10
  set guioptions=ce 
  "              ||
  "              |+-- use simple dialogs rather than pop-ups
  "              +  use GUI tabs, not console style tabs
  set lines=40
  set mousehide " hide the mouse cursor when typing
endif
