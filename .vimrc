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
        Plugin 'Valloric/YouCompleteMe'
        Plugin 'SirVer/ultisnips'
        Plugin 'scrooloose/syntastic'
        Plugin 'tpope/vim-commentary'
        Plugin 'tpope/vim-endwise'
        Plugin 'javacomplete'
        Plugin 'Yggdroot/indentLine'
        Plugin 'matze/vim-move'

        call vundle#end()
    end

" For syntastic
    let g:syntastic_tex_checkers = ['chktek']

set nocompatible

set background=dark

" tabbing
set expandtab
set shiftwidth=4
set softtabstop=4

set backspace=2

colorscheme slate

set nu
set autoindent
syntax on

let g:ada_standard_types=1

hi CursorLine term=bold cterm=bold ctermbg=black guibg=Grey40
set cursorline
set ruler

set t_Co=256

filetype plugin indent on

set colorcolumn=81
highlight ColorColumn ctermbg=235


"Syntastic"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" For C++
    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm_extra_conf.py'
    let g:syntastic_cpp_compiler_options='-std=c++1y'
    let g:ycm_complete_in_comments=1
    let g:ycm_confirm_extra_conf=0
    set matchpairs+=<:>
    autocmd FileType c,cpp setlocal comments-=:// comments+=f://
    autocmd FileType c,cpp setlocal textwidth=0

    set path+=include

" For Java
    autocmd FileType java setlocal textwidth=0
    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
    set suffixes+=.class
    let g:syntastic_java_javac_config_file_enabled=1
    let g:syntastic_java_javac_options='-Xlint'

" For html and css
    autocmd Filetype htlm,css setlocal shiftwidth=2

" Spell checking and wrapping in some file types
    autocmd Filetype gitcommit set spell textwidth=72 nofoldenable colorcolumn=51,73
    autocmd Filetype mkd,liquid,tex,text set spell textwidth=80 shiftwidth=2

" For vimperatorrc
    autocmd BufNewFile,BufRead .vimperatorrc,vimperatorrc set filetype=vim

" Change keymap for vim-move
    nmap <C-Up>   <Plug>MoveLineUp
    vmap <C-Up>   <Plug>MoveBlockUp
    nmap <C-Down> <Plug>MoveLineDown
    vmap <C-Down> <Plug>MoveBlockDown

" Don't exit visual mode when shifting.
    vnoremap < <gv
    vnoremap > >gv

" YCM FixIt
    let g:ycm_echo_current_diagnostic=1

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
