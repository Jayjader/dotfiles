" for bundle, various plugins
    set nocompatible                " be iMproved, required
    filetype off                    " required

    let g:HasVundle = !empty(glob(expand("~") . "/.vim/bundle/Vundle.vim/*"))
    if g:HasVundle
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()

        Plugin 'gmarik/Vundle.vim'
        Plugin 'bling/vim-airline'
        Plugin 'tpope/vim-sensible'
        Plugin 'tpope/vim-commentary'
        Plugin 'Yggdroot/indentLine'
        Plugin 'matze/vim-move'
        Plugin 'flazz/vim-colorschemes'
        Plugin 'scrooloose/syntastic'

        call vundle#end()
    end

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

" Syntastic
let g:syntastic_tex_checkers = ['chktek']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"For Python
    let g:ycm_python_binary_path = '/usr/bin/python3'

" For html and css
    autocmd Filetype htlm,css setlocal shiftwidth=2

" Spell checking and wrapping in some file types
    autocmd Filetype gitcommit set spell textwidth=72 nofoldenable colorcolumn=51,73
    autocmd Filetype mkd,liquid,tex,text set spell spelllang=en,fr textwidth=80 shiftwidth=2

" LatEx
    let g:tex_flavor='latex'


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
    filetype plugin indent on

    syntax on

colorscheme hybrid
set background=dark

set splitright
