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
        Plugin 'SirVer/ultisnips'
        Plugin 'honza/vim-snippets'
        Plugin 'tpope/vim-commentary'
        Plugin 'javacomplete'
        Plugin 'Yggdroot/indentLine'
        Plugin 'matze/vim-move'
        Plugin 'fatih/vim-go'
        Plugin 'PotatoesMaster/i3-vim-syntax'
        Plugin 'Valloric/YouCompleteMe'
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


let g:ada_standard_types=1

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

" For C++
    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm_extra_conf.py'
    let g:syntastic_cpp_compiler_options='-std=c++1y'
    let g:ycm_complete_in_comments=1
    let g:ycm_confirm_extra_conf=0
    set matchpairs+=<:>
    autocmd FileType c,cpp setlocal comments-=:// comments+=f://
    autocmd FileType c,cpp setlocal textwidth=0 shiftwidth=2 softtabstop=2

    set path+=include

" For Java
    autocmd FileType java setlocal textwidth=0
    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
    set suffixes+=.class
    let g:syntastic_java_javac_config_file_enabled=1
    let g:syntastic_java_javac_options='-Xlint'

" For Whitespace
    autocmd Filetype whitespace setlocal noexpandtab
    autocmd Filetype whitespace setlocal shiftwidth=8
    autocmd Filetype whitespace setlocal softtabstop=8

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

" YCM Stuff
    let g:ycm_echo_current_diagnostic=1
    let g:ycm_filetype_blacklist = { 'ocaml' : 1 ,
          \ 'tex' : 1,
          \ 'text' : 1}

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

    " OPAM/ OCAML/ merlin
    let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
    execute "set rtp+=" . g:opamshare . "/merlin/vim"
    execute "helptags " . g:opamshare . "/merlin/vim/doc"
    let g:syntastic_ocaml_checkers = ['merlin']
    autocmd Filetype ocaml setlocal textwidth=0 shiftwidth=2 softtabstop=2
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line

" ocaml autoindent plugin
"set rtp+=/home/jayjader/.vim/bundle/ocp-indent-vim

colorscheme hybrid
set background=dark

set splitright
