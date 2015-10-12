execute pathogen#infect()
filetype plugin indent on

set showcmd            " Show (partial) command in status line.
"set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
"set smartcase          " Do smart case matching
set incsearch          " Incremental search
set autowrite          " Automatically save before commands like :next and
set hidden             " Hide buffers when they are abandoned
set mouse=a            " Enable mouse usage (all modes)
set number
set numberwidth=5
"set relativenumber 

set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set foldenable          " enable folding

set lazyredraw          " redraw only when we need to.

set laststatus=2
set ruler

set expandtab
set shiftwidth=2
set softtabstop=2

set esckeys
set timeoutlen=10 ttimeoutlen=0

syntax enable
" set background=dark
colorscheme desert

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

let g:agprg="ag -i -o --hidden --column --vimgrep" 
let g:ag_highlight=1

let g:airline_theme='bubblegum'
"let g:airline_extensions='tabline'
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:syntastic_javascript_checkers = ['jsxhint']

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0

let g:javascript_enable_domhtmlcss = 1
let g:javascript_fold = 1
let g:jsx_ext_required = 1

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
"inoremap <silent> <Up> <ESC><Up>
"inoremap <silent> <Down> <ESC><Down>

" shortcut for esc
inoremap <C-p> <Esc>:CtrlP<CR>

" saving
inoremap <C-s> <Esc>:write<CR>
nnoremap <C-s> :write<CR>


