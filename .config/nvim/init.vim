call plug#begin(stdpath('data') . '/plugged')

set nocompatible
" WRINTING 
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" FILES 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-eunuch'
" EDITING 
Plug 'jiangmiao/auto-pairs' 
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-ragtag'
Plug 'reedes/vim-pencil'
" Plug 'simnalamburt/vim-mundo'
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
Plug 'chrisbra/NrrwRgn'
Plug 'reedes/vim-litecorrect'
" Languages 
Plug 'lervag/vimtex'
    let g:tex_flavor = "latex"
    let g:vimtex_view_method='zathura'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'vimwiki/vimwiki'
Plug 'vim-pandoc/vim-pandoc-after'
" Plug 'vim-pandoc/vim-rmarkdown'
Plug 'reedes/vim-lexical'
Plug 'vim-syntastic/syntastic'
Plug 'PProvost/vim-ps1'
" COLORS 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'iCyMind/NeoSolarized'
Plug 'justinmk/vim-sneak'
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
" nnoremap ; :
" xnoremap ; :
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
nnoremap <C-_> <C-w>_
" Quickly fix prievious spelling mistake with C-l
" inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

set nobackup	
set undofile	" keep an undo file (undo changes after closing)

" Switch on highlighting the last used search pattern.
set nohlsearch

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
set scrolloff=10
set formatprg=par

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
map <leader>d :Files<cr>

" Night mode
"
"
" Day mode
""=======================
"EXTERNAL SCRIPTING LANGUAGES
"===================================
"

let g:python3_host_prog = "/usr/bin/python3"

" ============================================
" ============================================
" PLUGIN OPTIONS
" ============================================
" Tex highlighting
let g:tex_fold_enabled=1
" VIM AIRLINE
" Enable wordcount
let g:airline_left_sep='|'
let g:airline_right_sep='|'
let g:airline#extensions#wordcount#enabled = 1
" Add notes to filetypes
let g:airline_powerline_fonts = 1
" A tab bar
let g:airline#extensions#tabline#enabled = 0
" Straight tabs 
let g:airline#extensions#vimtex#enabled = 1
" airline theme
let g:airline_theme='minimalist'
" vim Pencil colors
let g:pencil_terminal_italics = 1

" Put before vim-pandoc options
"let g:vimwiki_list = [{'path': '~/vimwiki/'}]
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
let g:pandoc#after#modules#enabled = ["nrrwrgn", "ultisnips"]
" FZF options
" Vim-Pencil
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
" vim-sneak 's' to go forward
let g:sneak#s_next = 1
" Labels for quick navigation
let g:sneak#label = 1
let g:nrrw_rgn_vert = 1
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
  autocmd FileType tex          call pencil#init()
" CLOSETAG OPTIONS
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
