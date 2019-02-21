set nu
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

set nocompatible
set path+=**

call plug#begin()
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'leshill/vim-json'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'enricobacis/vim-airline-clock'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
call plug#end()

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['javascript', 'javascript.jsx']
      \ })
endif

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_completion_enabled = 1

"colorscheme atlantic-dark
colorscheme codedark

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
  augroup END
endif

nnoremap ,rcomp :-1read $HOME/.vim/templates/component.jsx<CR>/SkeletonName<CR>vgn
nnoremap ,sh :-1read $HOME/.vim/templates/skeleton.sh<CR>o<Esc>o
nnoremap <C-@> :LspDefinition<CR>
"nnoremap \jtags :exec "ctags -f ./.git/tags -R . && sed -i -E '/^(if|switch|function|module\.exports|it|describe).+language:js$/d' ./.git/tags"

"let timer = timer_start(60000, 'UpdateStatusBar',{'repeat':-1})
set ruler
"set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
"function! UpdateStatusBar(timer)
"  execute 'let &ro = &ro'
"endfunction
