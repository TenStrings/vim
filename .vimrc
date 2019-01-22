set nu
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

set nocompatible
set path+=**

call plug#begin()
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
call plug#end()

"syntax on
"filetype plugin indent on

colorscheme atlantic-dark

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set ruler
nnoremap <silent> <C-n> :set relativenumber!<cr>

set timeoutlen=1000 ttimeoutlen=0

set mouse=n
set ignorecase
set smartcase

set splitbelow
set splitright


let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        highlight Normal ctermbg=none
        highlight NonText ctermbg=none
        let t:is_transparent = 1
    else
        colorscheme atlantic-dark
        let t:is_transparent = 0
    endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<CR>
