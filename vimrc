set nocompatible

" tabbing
set expandtab
set shiftwidth=4
set softtabstop=4

set backspace=2

set nu
set autoindent
syntax enable

hi CursorLine term=bold cterm=bold ctermbg=black guibg=Grey40
set cursorline
set ruler

set t_Co=256

filetype plugin indent on

set colorcolumn=81
highlight ColorColumn ctermbg=235

" Spell checking and wrapping in some file types
    autocmd Filetype gitcommit set spell textwidth=72 nofoldenable colorcolumn=51,73
    autocmd Filetype mkd,liquid,tex,text set spell spelllang=en,fr textwidth=80 shiftwidth=2

" Change keymap for vim-move
    nmap <C-Up>   <Plug>MoveLineUp
    vmap <C-Up>   <Plug>MoveBlockUp
    nmap <C-Down> <Plug>MoveLineDown
    vmap <C-Down> <Plug>MoveBlockDown

" Don't exit visual mode when shifting.
    vnoremap < <gv
    vnoremap > >gv

" Other stuff
    set nospell
    set noignorecase
    set showmode showcmd
    set report=0
    set undolevels=1000
    set sidescroll=1
    set wildchar=<Tab>
    set joinspaces
    set errorformat=%f:%l:\ %m

    syntax on

colorscheme evening
set background=dark

set splitright
