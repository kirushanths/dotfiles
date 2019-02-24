execute pathogen#infect()
filetype plugin indent on

set showcmd            " Show (partial) command in status line.
set ignorecase         " Do case insensitive matching
set incsearch          " Incremental search
set hlsearch
set autowrite          " Automatically save before commands like :next and
set hidden             " Hide buffers when they are abandoned
set mouse=a            " Enable mouse usage (all modes)
set number
set numberwidth=5

" disable bracket matching
let g:loaded_matchparen= 1
set noshowmatch

set laststatus=2
set ruler

" default tab/space rules
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set scrolloff=1

" default rules on all files
autocmd BufWritePre * set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
" match go-fmt rules
autocmd FileType go set tabstop=8|set shiftwidth=8|set noexpandtab|set softtabstop=8

set cursorline          " highlight current line
set cursorcolumn
set wildmenu            " visual autocomplete for command menu

set backspace=2   " Backspace deletes like most programs in insert mode

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile

" set foldenable          " enable folding

set esckeys
set timeoutlen=10 ttimeoutlen=0

set term=screen-256color

syntax enable
set background=dark
colorscheme hybrid

" performance tweaks
set lazyredraw            " redraw only when we need to.
" set nocursorcolumn
" set nocursorline
syntax sync minlines=200
set synmaxcol=200
let html_no_rendering=1   " Don't render italic, bold, links in HTML

highlight Search ctermbg=cyan

"let g:solarized_termcolors=256

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|tmp|log)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_max_height = 30

let g:ag_prg="ag -i -o --hidden --column --vimgrep"
let g:ag_highlight=1

let g:airline_theme='light'
"let g:airline_extensions='tabline'
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

let g:javascript_enable_domhtmlcss = 1
let g:javascript_fold = 1
let g:jsx_ext_required = 1

" strip all trailing whitespace everytime on save
let g:better_whitespace_filetypes_blacklist=['xml', 'diff', 'gitcommit', 'unite', 'qf', 'help']
autocmd BufWritePre * StripWhitespace

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
"inoremap <silent> <Up> <ESC><Up>
"inoremap <silent> <Down> <ESC><Down>

" shortcut for esc
inoremap <C-p> <Esc>:CtrlP<CR>

" saving
inoremap <C-s> <Esc>:write<CR>
nnoremap <C-s> :write<CR>


