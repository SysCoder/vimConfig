" '''''''''''''''''''"
" Plugins            "
"''''''''''''''''''''"
"Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on
" ctrlp

"'''''''''''''''''''"
" Settings          "
" ''''''''''''''''''"
:set number hlsearch tabstop=2 expandtab shiftwidth=2 
:set history=1000
:set hidden
:set incsearch

" Dictionary completion
:set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
:set complete-=k complete+=k

" find files by specifying directories.
" Usage - :find filename
" :set path+=app/**
" :set path+=/Users/marcelluspelcher/SourceCode/**

"'''''''''''''''''''"
" Mappings          "
" ''''''''''''''''''"
:let mapleader = ","

" <C-p> and <C-n> when used with the command history 
" does not filter. <Up> and <Down> does.
" This allows you to type some and then use <C-p> and
" <C-n> and take advantage of the filter.
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"''''''''''''''''''"
" global remaps    "
"''''''''''''''''''"
inoremap <Leader>r <Esc>:w<CR>:!python %:p<CR>
inoremap <Leader>, <Esc>
inoremap <Leader>c ggyw``

:nnoremap <space> i<space><esc>
:nnoremap <Enter> i<Enter><esc>

" Saves the current file and run
map <Leader>r <Esc>:w <CR>:!python %:p<CR>
map <F5> <Esc>:w <CR>:!%:p<CR>

" Open ctags in a new window
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"'''''''''''''''''''''"
"                     "
"  Macros             "
"                     "
"'''''''''''''''''''''"

if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif
