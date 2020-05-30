call plug#begin(stdpath('data') . '/plugged')

set nocompatible

" WRINTING 
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" FILES 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-eunuch'
" EDITING 
Plug 'jiangmiao/auto-pairs' 
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-ragtag'
Plug 'reedes/vim-pencil'
Plug 'simnalamburt/vim-mundo'
Plug 'junegunn/vim-peekaboo'
" Plug 'reedes/vim-litecorrect'
" Languages 
Plug 'ap/vim-css-color'
Plug 'lervag/vimtex'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'
" Plug 'vim-pandoc/vim-rmarkdown'
" Plug 'reedes/vim-lexical'
" COLORS 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'iCyMind/NeoSolarized'
Plug 'reedes/vim-colors-pencil'

call plug#end()

set encoding=utf-8
" makes vim default register = the system clipboard
set clipboard+=unnamedplus 
syntax on

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
tnoremap <Esc> <C-\><C-n>

set backup	
set undofile	" keep an undo file (undo changes after closing)

" Switch on highlighting the last used search pattern.
set hlsearch

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

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

" EDIT NON-WHITESPACE
set virtualedit="block"
set autochdir
set relativenumber
set number
set splitbelow splitright
set ruler
set mouse=nicr " Mouse scrolling
set t_Co=256 " 256 colors TERM
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
autocmd FileType pandoc map <buffer><silent> <leader>pb :<c-u>Pandoc! beamer -s<cr> 
autocmd FileType pandoc map <buffer><silent> <leader>pp :<c-u>Pandoc! pdf -s<cr> 
autocmd FileType pandoc map <buffer><silent> <leader>ph :<c-u>Pandoc! ms -s -o %:r.pdf<cr>
" autocmd for filetype specific
autocmd FileType pandoc map <buffer><silent> <leader>pd :<c-u>Pandoc! docx -s --mathjax<cr> 
" Without vim-pandoc
" autocmd FileType pandoc nnoremap <buffer> <leader>pd :<c-u>!pandoc -f markdown -t docx -s --mathjax -o %:r.docx %<CR> 
" autocmd FileType pandoc noremap <leader>pb :<c-u>!pandoc -f markdown --pdf-engine=xelatex -t beamer -s -o %:r.pdf %<CR> 

map <leader>w :w<cr>
map <leader>f :Goyo<cr>
map <leader>l :Limelight<cr>
map <leader>d :NERDTreeToggle<cr>


" ============================================
" ============================================
" PLUGIN OPTIONS
" ============================================
" Tex highlighting
let g:tex_flavor = "latex"
let g:tex_fold_enabled=1
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
